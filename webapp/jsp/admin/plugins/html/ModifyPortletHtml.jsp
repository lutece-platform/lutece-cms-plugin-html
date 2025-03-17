<%@ page errorPage="../../ErrorPage.jsp" %>
<jsp:include page="../../PortletAdminHeader.jsp" />

<%@page import="fr.paris.lutece.plugins.html.web.portlet.HtmlPortletJspBean"%>


${ htmlPortletJspBean.init( pageContext.request, HtmlPortletJspBean.RIGHT_MANAGE_ADMIN_SITE ) }
${ htmlPortletJspBean.getModify( pageContext.request ) }
