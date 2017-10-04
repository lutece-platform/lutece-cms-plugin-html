
--
-- Dumping data for table core_portlet
--

INSERT INTO core_portlet (id_portlet, id_portlet_type, id_page, name, date_update, status, portlet_order, column_no, id_style, accept_alias, date_creation, display_portlet_title, role, device_display_flags) VALUES 
(1,'HTML_PORTLET',1,'Qu\'est-ce que Lutece ?','2014-06-08 17:53:14',0,2,1,101,0,'2011-03-14 13:13:39',1,'none',273),
(2,'HTML_PORTLET',1,'Software overview','2014-06-08 17:58:00',0,1,2,100,0,'2012-09-18 08:35:45',0,'none',273),
(3,'HTML_PORTLET',1,'Back Office quick access','2014-06-08 17:49:37',0,1,3,100,0,'2009-05-15 04:38:08',0,'none',273),
(4,'HTML_PORTLET',2,'Page 1','2014-06-08 18:28:50',0,1,1,100,0,'2014-06-08 18:27:59',0,'none',273);


--
-- Dumping data for table html_portlet
--

INSERT INTO html_portlet (id_portlet, html) VALUES 
(1,'<div class=\"jumbotron\">\n  <h1>Welcome to LUTECE</h1>\n  <h3>\n    <small>Lutece is a CMS / Portal and a Web Framework that let\n    you create large and complex sites and applications.</small>\n  </h3>\n</div>\n'),
(2,'<ul>\n  <li>Lutece is FreeSoftware. Full OpenSource licensed under\n  BSD.</li>\n  <li>Full responsive design Back and Front</li>\n  <li>Compliant with Bootstrap 3.x themes</li>\n  <li>Very modular and flexible architecture based on plugins,\n  APIs, IoC</li>\n  <li>Over 300 plugins available for many needs : Content\n  Management, Collaborative, Workflows, ...</li>\n  <li>Runs on Java Platform and rely on powerful build tools such\n  as Apache Maven</li>\n  <li>Uses best of breed Java Open Source stacks : Lucene, Spring,\n  Ehcache, Freemarker, ...</li>\n</ul>\n'),
(3,'<form class=\"form\" action=\"jsp/admin/AdminLogin.jsp\" method=\"post\"> <div class=\"well\"> \n <span class=\"help-block\">Go and log in as \"admin\" or \"webmaster\".<br>The secret password is \"adminadmin\".</span> \n <br> \n <span class=\"help-block\">The \"admin\" user has all rights and features, whereas the \"webmaster\" user can only work on the editorial content of the site.</span> \n <br> \n <button class=\"btn btn-primary btn-block btn-flat\" type=\"submit\">Display login form</button> \n </div> </form>'),
(4,'<h2>Here is a child page sample.</h2>\n<p>&#160;</p>\n<p>This page is divided into 2 columns.</p>\n<p>In each column you can publish several and different portlets :\nHTML, documents, ...</p>\n<p>This page can also have childs.</p>\n<p>&#160;</p>\n<p>&#160;</p>\n');

