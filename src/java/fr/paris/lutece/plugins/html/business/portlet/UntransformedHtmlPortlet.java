/*
 * Copyright (c) 2002-2016, Mairie de Paris
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

import fr.paris.lutece.portal.business.portlet.PortletHtmlContent;
import jakarta.servlet.http.HttpServletRequest;

/**
 * UntransformedHtmlPortlet
 */
public class UntransformedHtmlPortlet extends PortletHtmlContent implements IHtmlPortlet
{
    private String _strHtml;

    /**
     * Sets the Html portlet content
     *
     * @param strHtml
     *            the Html code to sets content
     */
    @Override
    public void setHtml( String strHtml )
    {
        _strHtml = strHtml;
    }

    /**
     * Returns the content of the Html portlet
     *
     * @return the Html code content
     */
    @Override
    public String getHtml( )
    {
        return _strHtml;
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public String getHtmlContent( HttpServletRequest request )
    {
        return _strHtml;
    }

    /**
     * Updates the current instance of the HtmlPortlet object
     */
    @Override
    public void update( )
    {
        UntransformedHtmlPortletHome.getInstance( ).update( this );
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public void remove( )
    {
        UntransformedHtmlPortletHome.getInstance( ).remove( this );
    }

}
