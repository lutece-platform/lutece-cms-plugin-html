--
-- Structure for table html_portlet
--

DROP TABLE IF EXISTS html_portlet;
CREATE TABLE html_portlet (
  id_portlet int DEFAULT '0' NOT NULL,
  html LONG VARCHAR,
  PRIMARY KEY (id_portlet)
);