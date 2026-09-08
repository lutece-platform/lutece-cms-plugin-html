<%@ page errorPage="../../ErrorPage.jsp" %>
<jsp:include page="../../AdminHeader.jsp" />

<%@page import="fr.paris.lutece.plugins.html.web.HtmlPortletTemplateJspBean"%>

${ htmlPortletTemplateJspBean.init( pageContext.request, HtmlPortletTemplateJspBean.RIGHT_MANAGE_HTML_PORTLET_TEMPLATES ) }
${ htmlPortletTemplateJspBean.getCreateHtmlPortletTemplate( pageContext.request ) }

<%@ include file="../../AdminFooter.jsp" %>
