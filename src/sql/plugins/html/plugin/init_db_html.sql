-- liquibase formatted sql
-- changeset html:init_db_html.sql
-- preconditions onFail:MARK_RAN onError:WARN
--
-- Dumping data for table html_portlet_template
--

INSERT INTO html_portlet_template (id_template, description, template_path) VALUES (1, 'Défaut', 'skin/plugins/html/portlet_html.html');
INSERT INTO html_portlet_template (id_template, description, template_path) VALUES (2, 'Fond coloré', 'skin/plugins/html/portlet_html_background.html');
INSERT INTO html_portlet_template (id_template, description, template_path) VALUES (3, 'Encadré', 'skin/plugins/html/portlet_html_bordered.html');
INSERT INTO html_portlet_template (id_template, description, template_path) VALUES (4, 'Brut (sans habillage)', 'skin/plugins/html/portlet_html_raw.html');

--
-- Dumping data for table html_portlet
--

INSERT INTO html_portlet (id_portlet, html ) VALUES
	(1, ''),
	(2, '<ul class="features"> \n <li>Lutece is FreeSoftware. Full OpenSource licensed under BSD.</li> \n <li>Full responsive design Back and Front</li> \n <li>Compliant with Twitter Bootstrap themes</li> \n <li>Very modular and flexible architecture based on plugins, APIs, IoC</li> \n <li>Over 300 plugins available for many needs : Content Management, Collaborative, Workflows, ...</li> \n <li>Runs on Java Platform and rely on powerful build tools such as Apache Maven</li> \n <li>Uses best of breed Java Open Source stacks : Lucene, Spring, Ehcache, Freemarker, ...</li> \n</ul> \n<p class="logo">&nbsp;</p>'),
	(4, '<h2>Get into the Back Office of this demo site</h2> \n<p class="mb20">Sign in as administrator with <em>admin/adminadmin</em>.</p> \n<p><a class="btn btn-primary" title="Access to admin [Open  in new window]" href="jsp/admin/AdminLogin.jsp" target=""><span class="fa fa-door-open">&nbsp;</span> Enter Back Office</a></p> \n<p>&nbsp;</p>'),
	(5, '<h3>Resources</h3> \n<hr> \n<div class="row"> \n <div class="col-xs-12 col-sm-6"> \n  <div class="media"> \n   <div class="media-left">\n    <a title="GitHub site [Open  in new window]" href="https://github.com/lutece-platform" target="_blank"><img class="media-object" src="images/local/skin/github-logo.png" alt="Github logo" width="100px"> </a>\n   </div> \n   <div class="media-body"> \n    <h4 class="media-heading">Access to our code repository</h4> \n   </div> \n  </div> \n  <div class="media"> \n   <div class="media-left">\n    <a title="Docker Hub site [Open  in new window]" href="https://hub.docker.com/u/lutece" target="_blank"><img class="media-object" src="images/local/skin/docker-logo.png" alt="Docker images" width="100px"> </a>\n   </div> \n   <div class="media-body"> \n    <h4 class="media-heading">Grab some Docker images to run demos</h4> \n   </div> \n  </div> \n </div> \n <div class="col-xs-12 col-sm-6"> \n  <div class="media"> \n   <div class="media-left">\n    <a title="Lutece Wiki site [Open  in new window]" href="https://fr.lutece.paris.fr/fr/jsp/site/Portal.jsp?page=wiki&amp;action=changeLanguage&amp;page_name=home&amp;language=en" target="_blank"> <img class="media-object" src="images/local/skin/wiki-logo.png" alt="WIKI" width="100px"> </a>\n   </div> \n   <div class="media-body"> \n    <h4 class="media-heading">Read our technical documentation</h4> \n   </div> \n  </div> \n  <div class="media"> \n   <div class="media-left">\n    <a title=" Twitter Site [Open  in new window]" href="https://twitter.com/LuteceNews" target="_blank"> <img class="media-object" src="images/local/skin/twitter-logo.png" alt="Twitter logo" width="100px"> </a>\n   </div> \n   <div class="media-body"> \n    <h4 class="media-heading">Follow us on Twitter</h4> \n   </div> \n  </div> \n </div> \n</div>');

--
-- The template of a portlet is now stored by the core (core_portlet.id_template) : the plugin's own template table and column are dropped.
-- On a new database the rows inserted above are simply discarded ; the templates are registered in core_portlet_template by init_core_html.sql.
--
-- changeset html:init_db_html.sql-rev1.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = database() AND table_name = 'html_portlet_template'
DROP TABLE html_portlet_template;

-- changeset html:init_db_html.sql-rev2.sql
-- preconditions onFail:MARK_RAN onError:WARN
-- precondition-sql-check expectedResult:1 SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = database() AND table_name = 'html_portlet' AND column_name = 'id_template'
ALTER TABLE html_portlet DROP COLUMN id_template;
