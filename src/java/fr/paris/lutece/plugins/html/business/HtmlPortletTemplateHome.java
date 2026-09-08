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
package fr.paris.lutece.plugins.html.business;

import fr.paris.lutece.util.ReferenceList;

import java.util.List;

import jakarta.enterprise.inject.spi.CDI;

/**
 * This class provides instances management methods for HtmlPortletTemplate objects
 */
public final class HtmlPortletTemplateHome
{
    /** The identifier of the default template */
    public static final int DEFAULT_TEMPLATE_ID = 1;

    // Static variable pointed at the DAO instance
    private static IHtmlPortletTemplateDAO _dao = CDI.current( ).select( IHtmlPortletTemplateDAO.class ).get( );

    /**
     * Private constructor - this class need not be instantiated
     */
    private HtmlPortletTemplateHome( )
    {
    }

    /**
     * Creates a new template in the database
     *
     * @param template
     *            The template to create. Its identifier is set by this method.
     * @return The created template
     */
    public static HtmlPortletTemplate create( HtmlPortletTemplate template )
    {
        _dao.insert( template );

        return template;
    }

    /**
     * Updates a template in the database
     *
     * @param template
     *            The template to update
     * @return The updated template
     */
    public static HtmlPortletTemplate update( HtmlPortletTemplate template )
    {
        _dao.store( template );

        return template;
    }

    /**
     * Removes a template from the database
     *
     * @param nKey
     *            The template primary key
     */
    public static void remove( int nKey )
    {
        _dao.delete( nKey );
    }

    /**
     * Returns the template whose identifier is specified in parameter
     *
     * @param nKey
     *            The template primary key
     * @return the template, or null if not found
     */
    public static HtmlPortletTemplate findByPrimaryKey( int nKey )
    {
        return _dao.load( nKey );
    }

    /**
     * Returns the list of all the templates
     *
     * @return A list of templates
     */
    public static List<HtmlPortletTemplate> getTemplatesList( )
    {
        return _dao.selectTemplatesList( );
    }

    /**
     * Returns the list of all the templates as a reference list (id / description)
     *
     * @return A reference list of templates
     */
    public static ReferenceList getTemplatesReferenceList( )
    {
        ReferenceList list = new ReferenceList( );

        for ( HtmlPortletTemplate template : getTemplatesList( ) )
        {
            list.addItem( template.getId( ), template.getDescription( ) );
        }

        return list;
    }

    /**
     * Checks whether a template is used by at least one HTML portlet
     *
     * @param nKey
     *            The template primary key
     * @return true if the template is used by a portlet, false otherwise
     */
    public static boolean isTemplateUsed( int nKey )
    {
        return _dao.checkTemplateIsUsed( nKey );
    }
}
