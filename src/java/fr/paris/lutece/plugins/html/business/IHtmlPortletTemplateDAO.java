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

import java.util.List;

/**
 * Interface for HtmlPortletTemplate DAO
 */
public interface IHtmlPortletTemplateDAO
{
    /**
     * Insert a new template in the table
     *
     * @param template
     *            The template to insert. Its identifier is set by this method.
     */
    void insert( HtmlPortletTemplate template );

    /**
     * Update the template in the table
     *
     * @param template
     *            The template to update
     */
    void store( HtmlPortletTemplate template );

    /**
     * Delete a template from the table
     *
     * @param nIdTemplate
     *            The identifier of the template to delete
     */
    void delete( int nIdTemplate );

    /**
     * Load the data of a template from the table
     *
     * @param nIdTemplate
     *            The identifier of the template
     * @return The instance of the template, or null if not found
     */
    HtmlPortletTemplate load( int nIdTemplate );

    /**
     * Returns the list of all the templates
     *
     * @return A list of HtmlPortletTemplate objects
     */
    List<HtmlPortletTemplate> selectTemplatesList( );

    /**
     * Checks whether a template is used by at least one HTML portlet
     *
     * @param nIdTemplate
     *            The identifier of the template
     * @return true if the template is used by a portlet, false otherwise
     */
    boolean checkTemplateIsUsed( int nIdTemplate );
}
