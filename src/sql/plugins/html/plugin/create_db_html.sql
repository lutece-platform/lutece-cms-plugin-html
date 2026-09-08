-- liquibase formatted sql
-- changeset html:create_db_html.sql
-- preconditions onFail:MARK_RAN onError:WARN
--
-- Structure for table html_portlet
--

DROP TABLE IF EXISTS html_portlet;
CREATE TABLE html_portlet (
  id_portlet int DEFAULT '0' NOT NULL,
  html LONG VARCHAR,
  id_template int DEFAULT 1 NOT NULL,
  PRIMARY KEY (id_portlet)
);

--
-- Structure for table html_portlet_template
-- The FreeMarker templates available to render an HTML portlet. Managed from the back office (HTML_PORTLET_TEMPLATE_MANAGEMENT right).
--

DROP TABLE IF EXISTS html_portlet_template;
CREATE TABLE html_portlet_template (
  id_template int DEFAULT 0 NOT NULL,
  description varchar(255) DEFAULT NULL,
  template_path varchar(255) DEFAULT NULL,
  PRIMARY KEY (id_template)
);
