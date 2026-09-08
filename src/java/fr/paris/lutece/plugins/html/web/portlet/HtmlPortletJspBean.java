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
package fr.paris.lutece.plugins.html.web.portlet;

import fr.paris.lutece.plugins.html.business.HtmlPortletTemplateHome;
import fr.paris.lutece.plugins.html.business.portlet.HtmlPortlet;
import fr.paris.lutece.plugins.html.business.portlet.HtmlPortletHome;
import fr.paris.lutece.portal.business.portlet.Portlet;
import fr.paris.lutece.portal.business.portlet.PortletHome;
import fr.paris.lutece.portal.service.admin.AdminUserService;
import fr.paris.lutece.portal.service.message.AdminMessage;
import fr.paris.lutece.portal.service.message.AdminMessageService;
import fr.paris.lutece.portal.service.util.AppPathService;
import fr.paris.lutece.portal.web.constants.Messages;
import fr.paris.lutece.portal.web.portlet.PortletJspBean;
import fr.paris.lutece.util.html.HtmlTemplate;

import java.util.HashMap;
import java.util.Map;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Named;
import jakarta.servlet.http.HttpServletRequest;

/**
 * This class provides the user interface to manage Html Portlet features
 */
@RequestScoped
@Named
public class HtmlPortletJspBean extends PortletJspBean
{
    // //////////////////////////////////////////////////////////////////////////
    // Constants

    // Parameter
    private static final String PARAMETER_CONTENT_HTML = "html_content";
    private static final String PARAMETER_ID_TEMPLATE = "id_template";

    // Marks
    private static final String MARK_WEBAPP_URL = "webapp_url";
    private static final String MARK_LOCALE = "locale";
    private static final String MARK_HTML_CONTENT = "html_content";
    private static final String MARK_ID_TEMPLATE = "id_template";
    private static final String MARK_TEMPLATES_LIST = "templates_list";

    private static final long serialVersionUID = 1L;

    /**
     * Returns the properties prefix used for html portlet and defined in lutece.properties file
     *
     * @return the value of the property prefix
     */
    public String getPropertiesPrefix( )
    {
        return "portlet.html";
    }

    /**
     * Returns the Html Portlet form of creation
     *
     * @param request
     *            The Http rquest
     * @return the html code of the html portlet form
     */
    @Override
    public String getCreate( HttpServletRequest request )
    {
        String strPageId = request.getParameter( PARAMETER_PAGE_ID );
        String strPortletTypeId = request.getParameter( PARAMETER_PORTLET_TYPE_ID );

        Map<String, Object> model = new HashMap<>( );
        model.put( MARK_WEBAPP_URL, AppPathService.getBaseUrl( request ) );
        model.put( MARK_LOCALE, AdminUserService.getLocale( request ).getLanguage( ) );
        model.put( MARK_HTML_CONTENT, "" );
        model.put( MARK_ID_TEMPLATE, HtmlPortletTemplateHome.DEFAULT_TEMPLATE_ID );
        model.put( MARK_TEMPLATES_LIST, HtmlPortletTemplateHome.getTemplatesReferenceList( ) );

        HtmlTemplate template = getCreateTemplate( strPageId, strPortletTypeId, model );

        return template.getHtml( );
    }

    /**
     * Returns the Html Portlet form for update
     *
     * @param request
     *            The Http request
     * @return the html code of the html portlet form
     */
    @Override
    public String getModify( HttpServletRequest request )
    {
        String strPortletId = request.getParameter( PARAMETER_PORTLET_ID );
        int nPortletId = Integer.parseInt( strPortletId );
        HtmlPortlet portlet = (HtmlPortlet) PortletHome.findByPrimaryKey( nPortletId );

        Map<String, Object> model = new HashMap<>( );
        model.put( MARK_WEBAPP_URL, AppPathService.getBaseUrl( request ) );
        model.put( MARK_LOCALE, AdminUserService.getLocale( request ).getLanguage( ) );
        model.put( MARK_HTML_CONTENT, portlet.getHtml( ) );
        model.put( MARK_ID_TEMPLATE, portlet.getIdTemplate( ) );
        model.put( MARK_TEMPLATES_LIST, HtmlPortletTemplateHome.getTemplatesReferenceList( ) );

        HtmlTemplate template = getModifyTemplate( portlet, model );

        return template.getHtml( );
    }

    /**
     * Processes the creation form of a new html portlet
     *
     * @param request
     *            The Http request
     * @return The jsp URL which displays the view of the created html portlet
     */
    @Override
    public String doCreate( HttpServletRequest request )
    {
        HtmlPortlet portlet = new HtmlPortlet( );

        // get portlet common attributes
        String strErrorUrl = setPortletCommonData( request, portlet );

        if ( strErrorUrl != null )
        {
            return strErrorUrl;
        }

        // get portlet specific attributes
        String strPageId = request.getParameter( PARAMETER_PAGE_ID );
        int nPageId = Integer.parseInt( strPageId );
        portlet.setPageId( nPageId );

        strErrorUrl = setPortletSpecificData( request, portlet );

        if ( strErrorUrl != null )
        {
            return strErrorUrl;
        }

        // creates the portlet
        HtmlPortletHome.getInstance( ).create( portlet );

        // displays the page with the new portlet
        return getPageUrl( portlet.getPageId( ) );
    }

    /**
     * Processes the update form of the html portlet whose identifier is in the http request
     *
     * @param request
     *            The Http request
     * @return The jsp URL which displays the view of the updated portlet
     */
    @Override
    public String doModify( HttpServletRequest request )
    {
        // recovers portlet attributes
        String strPortletId = request.getParameter( PARAMETER_PORTLET_ID );
        int nPortletId = Integer.parseInt( strPortletId );
        Portlet portlet = PortletHome.findByPrimaryKey( nPortletId );

        // get portlet common attributes
        String strErrorUrl = setPortletCommonData( request, portlet );

        if ( strErrorUrl != null )
        {
            return strErrorUrl;
        }

        HtmlPortlet htmlPortlet = (HtmlPortlet) portlet;

        strErrorUrl = setPortletSpecificData( request, htmlPortlet );

        if ( strErrorUrl != null )
        {
            return strErrorUrl;
        }

        // updates the portlet
        htmlPortlet.update( );

        // displays the page with the portlet updated
        return getPageUrl( portlet.getPageId( ) );
    }

    // //////////////////////////////////////////////////////////////////////////////////
    // Private Implementation

    /**
     * Fill the portlet with the specific data of the form : the HTML content and the chosen template
     *
     * @param request
     *            The Http request
     * @param portlet
     *            The portlet to fill
     * @return an error URL if the form is invalid, null otherwise
     */
    private String setPortletSpecificData( HttpServletRequest request, HtmlPortlet portlet )
    {
        String strIdTemplate = request.getParameter( PARAMETER_ID_TEMPLATE );
        int nIdTemplate;

        try
        {
            nIdTemplate = Integer.parseInt( strIdTemplate );
        }
        catch( NumberFormatException e )
        {
            return AdminMessageService.getMessageUrl( request, Messages.MANDATORY_FIELDS, AdminMessage.TYPE_STOP );
        }

        if ( HtmlPortletTemplateHome.findByPrimaryKey( nIdTemplate ) == null )
        {
            return AdminMessageService.getMessageUrl( request, Messages.MANDATORY_FIELDS, AdminMessage.TYPE_STOP );
        }

        portlet.setIdTemplate( nIdTemplate );
        portlet.setHtml( request.getParameter( PARAMETER_CONTENT_HTML ) );

        return null;
    }
}
