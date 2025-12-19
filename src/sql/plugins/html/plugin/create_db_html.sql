-- liquibase formatted sql
-- changeset html:create_db_html.sql
-- preconditions onFail:MARK_RAN onError:WARN
--
-- Structure for table html_portlet
--

DROP TABLE IF EXISTS html_portlet;
CREATE TABLE html_portlet (
  id_portlet int DEFAULT '0' NOT NULL,
  html LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (id_portlet)
);
