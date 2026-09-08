<%@ page errorPage="../../ErrorPage.jsp" %>

<%@page import="fr.paris.lutece.plugins.html.web.HtmlPortletTemplateJspBean"%>

${ htmlPortletTemplateJspBean.init( pageContext.request, HtmlPortletTemplateJspBean.RIGHT_MANAGE_HTML_PORTLET_TEMPLATES ) }
${ pageContext.response.sendRedirect( htmlPortletTemplateJspBean.doModifyHtmlPortletTemplate( pageContext.request ) ) }
