<%@ page errorPage="../../ErrorPage.jsp" %>

<%@page import="fr.paris.lutece.plugins.html.web.portlet.HtmlPortletJspBean"%>

${ htmlPortletJspBean.init( pageContext.request, HtmlPortletJspBean.RIGHT_MANAGE_ADMIN_SITE ) }
${ pageContext.response.sendRedirect( htmlPortletJspBean.doCreate( pageContext.request ) ) }





