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

--
-- Remove the XSL styles and stylesheets of the HTML portlet
--
DELETE FROM core_style_mode_stylesheet WHERE id_style IN (100, 101);
DELETE FROM core_style WHERE id_style IN (100, 101);
DELETE FROM core_stylesheet WHERE id_stylesheet IN (10, 285);
