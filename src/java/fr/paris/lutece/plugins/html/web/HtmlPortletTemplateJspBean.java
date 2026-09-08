/*
 * Copyright (c) 2002-2018, Mairie de Paris
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  1. Redistributions of source code must retain the above copyright notice
 *     and the following disclaimer.
 *
 *  2. Redistributions in binary form must reproduce the above copyright notice
 *     and the following disclaimer in the documentation and/or other materials
 *     provided with the distribution.
 *
 *  3. Neither the name of 'Mairie de Paris' nor 'Lutece' nor the names of its
 *     contributors may be used to endorse or promote products derived from
 *     this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * License 1.0
 */
package fr.paris.lutece.plugins.html.web;

import fr.paris.lutece.plugins.html.business.HtmlPortletTemplate;
import fr.paris.lutece.plugins.html.business.HtmlPortletTemplateHome;
import fr.paris.lutece.plugins.html.service.HtmlPortletTemplateResourceIdService;
import fr.paris.lutece.portal.service.admin.AccessDeniedException;
import fr.paris.lutece.portal.service.message.AdminMessage;
import fr.paris.lutece.portal.service.message.AdminMessageService;
import fr.paris.lutece.portal.service.rbac.RBACService;
import fr.paris.lutece.portal.service.security.SecurityTokenService;
import fr.paris.lutece.portal.service.template.AppTemplateService;
import fr.paris.lutece.portal.web.admin.AdminFeaturesPageJspBean;
import fr.paris.lutece.portal.web.constants.Messages;
import fr.paris.lutece.util.html.HtmlTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Named;
import jakarta.servlet.http.HttpServletRequest;

/**
 * This class provides the user interface to manage the HTML portlet templates ( manage, create, modify, remove )
 */
@RequestScoped
@Named
public class HtmlPortletTemplateJspBean extends AdminFeaturesPageJspBean
{
    // Right
    /**
     * Right to manage the HTML portlet templates
     */
    public static final String RIGHT_MANAGE_HTML_PORTLET_TEMPLATES = "HTML_PORTLET_TEMPLATE_MANAGEMENT";

    /**
     * Serial version UID
     */
    private static final long serialVersionUID = 2989375912874624231L;

    // Parameters
    private static final String PARAMETER_TEMPLATE_ID = "template_id";
    private static final String PARAMETER_TEMPLATE_DESCRIPTION = "template_description";
    private static final String PARAMETER_TEMPLATE_PATH = "template_path";

    // Properties for page titles
    private static final String PROPERTY_PAGE_TITLE_TEMPLATE_LIST = "html.manage_html_portlet_templates.pageTitle";
    private static final String PROPERTY_PAGE_TITLE_CREATE_TEMPLATE = "html.create_html_portlet_template.pageTitle";
    private static final String PROPERTY_PAGE_TITLE_MODIFY_TEMPLATE = "html.modify_html_portlet_template.pageTitle";

    // Markers
    private static final String MARK_TEMPLATES_LIST = "templates_list";
    private static final String MARK_TEMPLATE = "template";
    private static final String MARK_PERMISSIONS_MODIFY = "permissions_modify";
    private static final String MARK_PERMISSIONS_DELETE = "permissions_delete";

    // Templates files path
    private static final String TEMPLATE_MANAGE_TEMPLATES = "admin/plugins/html/manage_html_portlet_templates.html";
    private static final String TEMPLATE_CREATE_TEMPLATE = "admin/plugins/html/create_html_portlet_template.html";
    private static final String TEMPLATE_MODIFY_TEMPLATE = "admin/plugins/html/modify_html_portlet_template.html";

    // Messages
    private static final String MESSAGE_CONFIRM_REMOVE_TEMPLATE = "html.message.confirmRemoveTemplate";
    private static final String MESSAGE_TEMPLATE_IS_USED = "html.message.templateIsUsed";
    private static final String MESSAGE_TEMPLATE_NOT_FOUND = "html.message.templateNotFound";
    private static final String ERROR_UNAUTHORIZED = "User is not authorized to perform this action on the template";

    // JSP
    private static final String JSP_DO_REMOVE_TEMPLATE = "jsp/admin/plugins/html/DoRemoveHtmlPortletTemplate.jsp";

    /**
     * Returns the list of the HTML portlet templates
     *
     * @param request
     *            The Http request
     * @return the html code for display the templates list
     */
    public String getManageHtmlPortletTemplates( HttpServletRequest request )
    {
        setPageTitleProperty( PROPERTY_PAGE_TITLE_TEMPLATE_LIST );

        List<HtmlPortletTemplate> listTemplates = HtmlPortletTemplateHome.getTemplatesList( );

        Map<String, Boolean> mapPermissionsModify = new HashMap<>( );
        Map<String, Boolean> mapPermissionsDelete = new HashMap<>( );

        for ( HtmlPortletTemplate template : listTemplates )
        {
            mapPermissionsModify.put( template.getResourceId( ),
                    RBACService.isAuthorized( template, HtmlPortletTemplateResourceIdService.PERMISSION_MODIFY, getUser( ) ) );
            mapPermissionsDelete.put( template.getResourceId( ),
                    RBACService.isAuthorized( template, HtmlPortletTemplateResourceIdService.PERMISSION_DELETE, getUser( ) ) );
        }

        Map<String, Object> model = new HashMap<>( );
        model.put( MARK_TEMPLATES_LIST, listTemplates );
        model.put( MARK_PERMISSIONS_MODIFY, mapPermissionsModify );
        model.put( MARK_PERMISSIONS_DELETE, mapPermissionsDelete );

        HtmlTemplate template = AppTemplateService.getTemplate( TEMPLATE_MANAGE_TEMPLATES, getLocale( ), model );

        return getAdminPage( template.getHtml( ) );
    }

    /**
     * Returns the creation form of a HTML portlet template
     *
     * @param request
     *            The Http request
     * @return the html code of the creation form
     */
    public String getCreateHtmlPortletTemplate( HttpServletRequest request )
    {
        setPageTitleProperty( PROPERTY_PAGE_TITLE_CREATE_TEMPLATE );

        Map<String, Object> model = new HashMap<>( );
        model.put( SecurityTokenService.MARK_TOKEN, getSecurityTokenService( ).getToken( request, TEMPLATE_CREATE_TEMPLATE ) );

        HtmlTemplate template = AppTemplateService.getTemplate( TEMPLATE_CREATE_TEMPLATE, getLocale( ), model );

        return getAdminPage( template.getHtml( ) );
    }

    /**
     * Processes the creation form of a new HTML portlet template
     *
     * @param request
     *            The Http request
     * @return The Jsp URL of the process result
     * @throws AccessDeniedException
     *             if the security token is invalid
     */
    public String doCreateHtmlPortletTemplate( HttpServletRequest request ) throws AccessDeniedException
    {
        if ( !getSecurityTokenService( ).validate( request, TEMPLATE_CREATE_TEMPLATE ) )
        {
            throw new AccessDeniedException( ERROR_INVALID_TOKEN );
        }

        String strDescription = request.getParameter( PARAMETER_TEMPLATE_DESCRIPTION );
        String strTemplatePath = request.getParameter( PARAMETER_TEMPLATE_PATH );

        if ( StringUtils.isBlank( strDescription ) || StringUtils.isBlank( strTemplatePath ) )
        {
            return AdminMessageService.getMessageUrl( request, Messages.MANDATORY_FIELDS, AdminMessage.TYPE_STOP );
        }

        HtmlPortletTemplate template = new HtmlPortletTemplate( );
        template.setDescription( strDescription.trim( ) );
        template.setTemplatePath( strTemplatePath.trim( ) );
        HtmlPortletTemplateHome.create( template );

        return getHomeUrl( request );
    }

    /**
     * Returns the modification form of a HTML portlet template
     *
     * @param request
     *            The Http request
     * @return the html code of the modification form
     * @throws AccessDeniedException
     *             if the user is not authorized to modify the template
     */
    public String getModifyHtmlPortletTemplate( HttpServletRequest request ) throws AccessDeniedException
    {
        setPageTitleProperty( PROPERTY_PAGE_TITLE_MODIFY_TEMPLATE );

        HtmlPortletTemplate template = getTemplateFromRequest( request );

        if ( template == null )
        {
            return AdminMessageService.getMessageUrl( request, MESSAGE_TEMPLATE_NOT_FOUND, AdminMessage.TYPE_STOP );
        }

        checkPermission( template, HtmlPortletTemplateResourceIdService.PERMISSION_MODIFY );

        Map<String, Object> model = new HashMap<>( );
        model.put( MARK_TEMPLATE, template );
        model.put( SecurityTokenService.MARK_TOKEN, getSecurityTokenService( ).getToken( request, TEMPLATE_MODIFY_TEMPLATE ) );

        HtmlTemplate htmlTemplate = AppTemplateService.getTemplate( TEMPLATE_MODIFY_TEMPLATE, getLocale( ), model );

        return getAdminPage( htmlTemplate.getHtml( ) );
    }

    /**
     * Processes the modification form of a HTML portlet template whose new parameters are stored in the http request
     *
     * @param request
     *            The Http request
     * @return The Jsp URL of the process result
     * @throws AccessDeniedException
     *             if the security token is invalid or if the user is not authorized to modify the template
     */
    public String doModifyHtmlPortletTemplate( HttpServletRequest request ) throws AccessDeniedException
    {
        if ( !getSecurityTokenService( ).validate( request, TEMPLATE_MODIFY_TEMPLATE ) )
        {
            throw new AccessDeniedException( ERROR_INVALID_TOKEN );
        }

        HtmlPortletTemplate template = getTemplateFromRequest( request );

        if ( template == null )
        {
            return AdminMessageService.getMessageUrl( request, MESSAGE_TEMPLATE_NOT_FOUND, AdminMessage.TYPE_STOP );
        }

        checkPermission( template, HtmlPortletTemplateResourceIdService.PERMISSION_MODIFY );

        String strDescription = request.getParameter( PARAMETER_TEMPLATE_DESCRIPTION );
        String strTemplatePath = request.getParameter( PARAMETER_TEMPLATE_PATH );

        if ( StringUtils.isBlank( strDescription ) || StringUtils.isBlank( strTemplatePath ) )
        {
            return AdminMessageService.getMessageUrl( request, Messages.MANDATORY_FIELDS, AdminMessage.TYPE_STOP );
        }

        template.setDescription( strDescription.trim( ) );
        template.setTemplatePath( strTemplatePath.trim( ) );
        HtmlPortletTemplateHome.update( template );

        return getHomeUrl( request );
    }

    /**
     * Returns the confirmation page of the removal of the HTML portlet template whose identifier is in the http request
     *
     * @param request
     *            The Http request
     * @return the Jsp URL of the confirmation page
     * @throws AccessDeniedException
     *             if the user is not authorized to delete the template
     */
    public String getConfirmRemoveHtmlPortletTemplate( HttpServletRequest request ) throws AccessDeniedException
    {
        HtmlPortletTemplate template = getTemplateFromRequest( request );

        if ( template == null )
        {
            return AdminMessageService.getMessageUrl( request, MESSAGE_TEMPLATE_NOT_FOUND, AdminMessage.TYPE_STOP );
        }

        checkPermission( template, HtmlPortletTemplateResourceIdService.PERMISSION_DELETE );

        if ( HtmlPortletTemplateHome.isTemplateUsed( template.getId( ) ) )
        {
            return AdminMessageService.getMessageUrl( request, MESSAGE_TEMPLATE_IS_USED, AdminMessage.TYPE_STOP );
        }

        Map<String, Object> parameters = new HashMap<>( );
        parameters.put( PARAMETER_TEMPLATE_ID, template.getResourceId( ) );
        parameters.put( SecurityTokenService.PARAMETER_TOKEN, getSecurityTokenService( ).getToken( request, JSP_DO_REMOVE_TEMPLATE ) );

        return AdminMessageService.getMessageUrl( request, MESSAGE_CONFIRM_REMOVE_TEMPLATE, new Object [ ] {
                template.getDescription( )
        }, null, JSP_DO_REMOVE_TEMPLATE, null, AdminMessage.TYPE_CONFIRMATION, parameters );
    }

    /**
     * Processes the removal of a HTML portlet template
     *
     * @param request
     *            The Http request
     * @return The Jsp URL of the process result
     * @throws AccessDeniedException
     *             if the security token is invalid or if the user is not authorized to delete the template
     */
    public String doRemoveHtmlPortletTemplate( HttpServletRequest request ) throws AccessDeniedException
    {
        if ( !getSecurityTokenService( ).validate( request, JSP_DO_REMOVE_TEMPLATE ) )
        {
            throw new AccessDeniedException( ERROR_INVALID_TOKEN );
        }

        HtmlPortletTemplate template = getTemplateFromRequest( request );

        if ( template == null )
        {
            return AdminMessageService.getMessageUrl( request, MESSAGE_TEMPLATE_NOT_FOUND, AdminMessage.TYPE_STOP );
        }

        checkPermission( template, HtmlPortletTemplateResourceIdService.PERMISSION_DELETE );

        if ( HtmlPortletTemplateHome.isTemplateUsed( template.getId( ) ) )
        {
            return AdminMessageService.getMessageUrl( request, MESSAGE_TEMPLATE_IS_USED, AdminMessage.TYPE_STOP );
        }

        HtmlPortletTemplateHome.remove( template.getId( ) );

        return getHomeUrl( request );
    }

    // //////////////////////////////////////////////////////////////////////////////////
    // Private Implementation

    /**
     * Loads the template whose identifier is in the http request
     *
     * @param request
     *            The Http request
     * @return the template, or null if the identifier is missing, invalid or unknown
     */
    private HtmlPortletTemplate getTemplateFromRequest( HttpServletRequest request )
    {
        String strId = request.getParameter( PARAMETER_TEMPLATE_ID );

        if ( !StringUtils.isNumeric( strId ) )
        {
            return null;
        }

        return HtmlPortletTemplateHome.findByPrimaryKey( Integer.parseInt( strId ) );
    }

    /**
     * Checks that the current user has the given RBAC permission on the template
     *
     * @param template
     *            The template
     * @param strPermission
     *            The permission to check
     * @throws AccessDeniedException
     *             if the user does not have the permission
     */
    private void checkPermission( HtmlPortletTemplate template, String strPermission ) throws AccessDeniedException
    {
        if ( !RBACService.isAuthorized( template, strPermission, getUser( ) ) )
        {
            throw new AccessDeniedException( ERROR_UNAUTHORIZED );
        }
    }
}
