-- liquibase formatted sql
-- changeset html:update_db_core_html-6.0.0-6.0.1.sql
-- preconditions onFail:MARK_RAN onError:WARN
--
-- New admin feature : management of the HTML portlet templates
--
DELETE FROM core_user_right WHERE id_right = 'HTML_PORTLET_TEMPLATE_MANAGEMENT';
DELETE FROM core_admin_right WHERE id_right = 'HTML_PORTLET_TEMPLATE_MANAGEMENT';

INSERT INTO core_admin_right (id_right,name,level_right,admin_url,description,is_updatable,plugin_name,id_feature_group,icon_url,documentation_url) VALUES
('HTML_PORTLET_TEMPLATE_MANAGEMENT','html.adminFeature.html_portlet_template_management.name',0,'jsp/admin/plugins/html/ManageHtmlPortletTemplates.jsp','html.adminFeature.html_portlet_template_management.description',0,'html','STYLE','ti ti-template',NULL);

INSERT INTO core_user_right (id_right,id_user) VALUES ('HTML_PORTLET_TEMPLATE_MANAGEMENT',1);
