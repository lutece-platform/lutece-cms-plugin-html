-- liquibase formatted sql
-- changeset html:init_core_html.sql
-- preconditions onFail:MARK_RAN onError:WARN
--
-- Dumping data for table core_portlet_type
--

INSERT INTO core_portlet_type (id_portlet_type,name,url_creation,url_update,home_class,plugin_name,url_docreate,create_script,create_specific,create_specific_form,url_domodify,modify_script,modify_specific,modify_specific_form) VALUES ('HTML_PORTLET','html.portlet.name','plugins/html/CreatePortletHtml.jsp','plugins/html/ModifyPortletHtml.jsp','fr.paris.lutece.plugins.html.business.portlet.HtmlPortletHome','html','plugins/html/DoCreatePortletHtml.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/html/portlet_html.html','','plugins/html/DoModifyPortletHtml.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/html/portlet_html.html','');

--
-- Dumping data for table core_admin_right
--
INSERT INTO core_admin_right (id_right,name,level_right,admin_url,description,is_updatable,plugin_name,id_feature_group,icon_url,documentation_url) VALUES
('HTML_PORTLET_TEMPLATE_MANAGEMENT','html.adminFeature.html_portlet_template_management.name',0,'jsp/admin/plugins/html/ManageHtmlPortletTemplates.jsp','html.adminFeature.html_portlet_template_management.description',0,'html','STYLE','ti ti-template',NULL);

--
-- Dumping data for table core_user_right
--
INSERT INTO core_user_right (id_right,id_user) VALUES ('HTML_PORTLET_TEMPLATE_MANAGEMENT',1);
