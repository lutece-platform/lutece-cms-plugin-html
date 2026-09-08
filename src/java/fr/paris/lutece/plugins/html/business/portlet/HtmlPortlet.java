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
package fr.paris.lutece.plugins.html.business.portlet;

import fr.paris.lutece.plugins.html.business.HtmlPortletTemplate;
import fr.paris.lutece.plugins.html.business.HtmlPortletTemplateHome;
import fr.paris.lutece.portal.business.portlet.PortletHtmlContent;
import fr.paris.lutece.portal.service.template.AppTemplateService;
import fr.paris.lutece.util.html.HtmlTemplate;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;

/**
 * This class represents business objects HtmlPortlet. The content is rendered with the FreeMarker template chosen for the portlet.
 */
public class HtmlPortlet extends PortletHtmlContent
{
    // ///////////////////////////////////////////////////////////////////////////////
    // Constants
    private static final String TEMPLATE_PORTLET_HTML_DEFAULT = "skin/plugins/html/portlet_html.html";

    // Marks
    private static final String MARK_PORTLET = "portlet";
    private static final String MARK_PORTLET_ID = "portlet_id";
    private static final String MARK_PORTLET_NAME = "portlet_name";
    private static final String MARK_HTML_CONTENT = "html_content";

    private String _strHtml;
    private int _nIdTemplate = HtmlPortletTemplateHome.DEFAULT_TEMPLATE_ID;

    /**
     * Sets the identifier of the portlet type to value specified
     */
    public HtmlPortlet( )
    {
        setPortletTypeId( HtmlPortletHome.getInstance( ).getPortletTypeId( ) );
    }

    /**
     * Sets the Html portlet content
     *
     * @param strHtml
     *            the Html code to sets content
     */
    public void setHtml( String strHtml )
    {
        _strHtml = strHtml;
    }

    /**
     * Returns the content of the Html portlet
     *
     * @return the Html code content
     */
    public String getHtml( )
    {
        return _strHtml;
    }

    /**
     * Sets the identifier of the FreeMarker template used to render the portlet
     *
     * @param nIdTemplate
     *            the template identifier
     */
    public void setIdTemplate( int nIdTemplate )
    {
        _nIdTemplate = nIdTemplate;
    }

    /**
     * Returns the identifier of the FreeMarker template used to render the portlet
     *
     * @return the template identifier
     */
    public int getIdTemplate( )
    {
        return _nIdTemplate;
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public String getHtmlContent( HttpServletRequest request )
    {
        Map<String, Object> model = new HashMap<>( );
        model.put( MARK_PORTLET, this );
        model.put( MARK_PORTLET_ID, getId( ) );
        model.put( MARK_HTML_CONTENT, _strHtml );

        if ( getDisplayPortletTitle( ) == 0 )
        {
            model.put( MARK_PORTLET_NAME, getName( ) );
        }

        HtmlTemplate template = AppTemplateService.getTemplate( getTemplatePath( ), getLocale( request ), model );

        return template.getHtml( );
    }

    /**
     * Returns the path of the FreeMarker template chosen for this portlet, or the default one if the chosen template does not exist anymore
     *
     * @return the template path
     */
    private String getTemplatePath( )
    {
        HtmlPortletTemplate portletTemplate = HtmlPortletTemplateHome.findByPrimaryKey( _nIdTemplate );

        if ( portletTemplate == null || portletTemplate.getTemplatePath( ) == null || portletTemplate.getTemplatePath( ).isEmpty( ) )
        {
            return TEMPLATE_PORTLET_HTML_DEFAULT;
        }

        return portletTemplate.getTemplatePath( );
    }

    /**
     * Updates the current instance of the HtmlPortlet object
     */
    public void update( )
    {
        HtmlPortletHome.getInstance( ).update( this );
    }

    /**
     * Removes the current instance of the HtmlPortlet object
     */
    @Override
    public void remove( )
    {
        HtmlPortletHome.getInstance( ).remove( this );
    }
}
