-- liquibase formatted sql
-- changeset html:update_db_html-6.0.0-6.0.1.sql
-- preconditions onFail:MARK_RAN onError:WARN
--
-- The XSL based portlet has been removed : every HTML portlet is now rendered with a FreeMarker template
-- chosen per portlet. Existing "HTML_UNTRANSFORMED_PORTLET" portlets are migrated to the single remaining
-- "HTML_PORTLET" type with the "raw" template, and the old XSL styles are mapped to the matching templates.
--
-- NOTE : the steps below touch both plugin and core tables and must run in this order.
--

--
-- Templates available for the HTML portlets
--
DROP TABLE IF EXISTS html_portlet_template;
CREATE TABLE html_portlet_template (
  id_template int DEFAULT 0 NOT NULL,
  description varchar(255) DEFAULT NULL,
  template_path varchar(255) DEFAULT NULL,
  PRIMARY KEY (id_template)
);

INSERT INTO html_portlet_template (id_template, description, template_path) VALUES (1, 'Défaut', 'skin/plugins/html/portlet_html.html');
INSERT INTO html_portlet_template (id_template, description, template_path) VALUES (2, 'Fond coloré', 'skin/plugins/html/portlet_html_background.html');
INSERT INTO html_portlet_template (id_template, description, template_path) VALUES (3, 'Encadré', 'skin/plugins/html/portlet_html_bordered.html');
INSERT INTO html_portlet_template (id_template, description, template_path) VALUES (4, 'Brut (sans habillage)', 'skin/plugins/html/portlet_html_raw.html');

--
-- Template chosen for each portlet
--
ALTER TABLE html_portlet ADD COLUMN id_template int DEFAULT 1 NOT NULL;

-- Old "Fond coloré" XSL style (101) -> "Fond coloré" template
UPDATE html_portlet SET id_template = 2 WHERE id_portlet IN (SELECT id_portlet FROM core_portlet WHERE id_style = 101);
-- Old untransformed portlets -> "raw" template
UPDATE html_portlet SET id_template = 4 WHERE id_portlet IN (SELECT id_portlet FROM core_portlet WHERE id_portlet_type = 'HTML_UNTRANSFORMED_PORTLET');

--
-- Single portlet type
--
UPDATE core_portlet SET id_portlet_type = 'HTML_PORTLET' WHERE id_portlet_type = 'HTML_UNTRANSFORMED_PORTLET';
UPDATE core_portlet SET id_style = 0 WHERE id_portlet_type = 'HTML_PORTLET';

DELETE FROM core_portlet_type WHERE id_portlet_type = 'HTML_UNTRANSFORMED_PORTLET';

-- changeset html:update_db_html-6.0.0-6.0.1.sql-rev1.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- comment Legacy XSL style tables left the core for plugin-xmltransformer and are absent from many databases: skip instead of failing the whole update
-- precondition-sql-check expectedResult:3 SELECT COUNT(1) from INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=database() AND TABLE_NAME IN ('core_style_mode_stylesheet','core_stylesheet','core_style');
DELETE FROM core_style_mode_stylesheet WHERE id_style IN (100, 101);
DELETE FROM core_style WHERE id_style IN (100, 101);
DELETE FROM core_stylesheet WHERE id_stylesheet IN (10, 285);

--
-- 6.0.1 : the FreeMarker templates of the portlets are managed by the core (core_portlet_template, core_portlet.id_template,
-- Section Template Management feature). The plugin's own registry (html_portlet_template, html_portlet.id_template,
-- HTML_PORTLET_TEMPLATE_MANAGEMENT feature) is migrated to it, then removed.
--
-- The plugin upgrade scripts run BEFORE the core upgrade script in the same liquibase run (sql/plugins/* sorts before sql/upgrade/*) :
-- the core structures are created here when they do not exist yet, with the very same statements as the core script, which is then skipped.
--

-- changeset html:update_db_html-6.0.0-6.0.1.sql-rev2.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = database() AND table_name = 'core_portlet' AND column_name = 'id_template'
ALTER TABLE core_portlet ADD COLUMN id_template int default 0 NOT NULL;

-- changeset html:update_db_html-6.0.0-6.0.1.sql-rev3.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = database() AND table_name = 'core_portlet_template'
CREATE TABLE IF NOT EXISTS core_portlet_template (
	id_template int AUTO_INCREMENT NOT NULL,
	id_portlet_type varchar(50) default NULL,
	description varchar(255) default NULL,
	template_path varchar(255) default NULL,
	PRIMARY KEY (id_template)
);

-- changeset html:update_db_html-6.0.0-6.0.1.sql-rev4.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM core_portlet_template WHERE id_portlet_type = 'HTML_PORTLET'
INSERT INTO core_portlet_template (id_portlet_type, description, template_path) VALUES ('HTML_PORTLET', 'Défaut', 'skin/plugins/html/portlet_html.html');
INSERT INTO core_portlet_template (id_portlet_type, description, template_path) VALUES ('HTML_PORTLET', 'Fond coloré', 'skin/plugins/html/portlet_html_background.html');
INSERT INTO core_portlet_template (id_portlet_type, description, template_path) VALUES ('HTML_PORTLET', 'Encadré', 'skin/plugins/html/portlet_html_bordered.html');
INSERT INTO core_portlet_template (id_portlet_type, description, template_path) VALUES ('HTML_PORTLET', 'Brut (sans habillage)', 'skin/plugins/html/portlet_html_raw.html');

-- changeset html:update_db_html-6.0.0-6.0.1.sql-rev5.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- comment Each HTML portlet keeps its template : the plugin template is matched to the core template with the same path (templates added by the site included)
-- precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = database() AND table_name = 'html_portlet_template'
INSERT INTO core_portlet_template (id_portlet_type, description, template_path)
	SELECT 'HTML_PORTLET', ht.description, ht.template_path FROM html_portlet_template ht
	WHERE ht.template_path IS NOT NULL AND ht.template_path NOT IN (SELECT ct.template_path FROM core_portlet_template ct WHERE ct.id_portlet_type = 'HTML_PORTLET' AND ct.template_path IS NOT NULL);
UPDATE core_portlet SET id_template = (
		SELECT MIN(ct.id_template) FROM core_portlet_template ct, html_portlet_template ht, html_portlet hp
		WHERE hp.id_portlet = core_portlet.id_portlet AND ht.id_template = hp.id_template
		AND ct.id_portlet_type = 'HTML_PORTLET' AND ct.template_path = ht.template_path )
	WHERE id_portlet_type = 'HTML_PORTLET'
	AND id_portlet IN (SELECT hp2.id_portlet FROM html_portlet hp2, html_portlet_template ht2 WHERE ht2.id_template = hp2.id_template AND ht2.template_path IS NOT NULL);
DROP TABLE html_portlet_template;

-- changeset html:update_db_html-6.0.0-6.0.1.sql-rev6.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = database() AND table_name = 'html_portlet' AND column_name = 'id_template'
ALTER TABLE html_portlet DROP COLUMN id_template;

-- changeset html:update_db_html-6.0.0-6.0.1.sql-rev7.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- comment The plugin's own template management feature is replaced by the core one (CORE_PORTLET_TEMPLATE_MANAGEMENT)
DELETE FROM core_user_right WHERE id_right = 'HTML_PORTLET_TEMPLATE_MANAGEMENT';
DELETE FROM core_admin_right WHERE id_right = 'HTML_PORTLET_TEMPLATE_MANAGEMENT';
DELETE FROM core_admin_role_resource WHERE resource_type = 'HTML_PORTLET_TEMPLATE';
