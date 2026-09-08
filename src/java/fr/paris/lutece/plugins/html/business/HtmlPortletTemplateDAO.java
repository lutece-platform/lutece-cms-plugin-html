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

import fr.paris.lutece.util.sql.DAOUtil;

import java.util.ArrayList;
import java.util.List;

import jakarta.enterprise.context.ApplicationScoped;

/**
 * This class provides Data Access methods for HtmlPortletTemplate objects
 */
@ApplicationScoped
public class HtmlPortletTemplateDAO implements IHtmlPortletTemplateDAO
{
    // Constants
    private static final String SQL_QUERY_NEW_PK = "SELECT max( id_template ) FROM html_portlet_template";
    private static final String SQL_QUERY_SELECT = "SELECT id_template, description, template_path FROM html_portlet_template WHERE id_template = ?";
    private static final String SQL_QUERY_SELECTALL = "SELECT id_template, description, template_path FROM html_portlet_template ORDER BY id_template";
    private static final String SQL_QUERY_INSERT = "INSERT INTO html_portlet_template ( id_template, description, template_path ) VALUES ( ?, ?, ? )";
    private static final String SQL_QUERY_UPDATE = "UPDATE html_portlet_template SET description = ?, template_path = ? WHERE id_template = ?";
    private static final String SQL_QUERY_DELETE = "DELETE FROM html_portlet_template WHERE id_template = ?";
    private static final String SQL_QUERY_CHECK_IS_USED = "SELECT COUNT(*) FROM html_portlet WHERE id_template = ?";

    /**
     * Generates a new primary key
     *
     * @return The new primary key
     */
    private int newPrimaryKey( )
    {
        int nKey = 1;

        try ( DAOUtil daoUtil = new DAOUtil( SQL_QUERY_NEW_PK ) )
        {
            daoUtil.executeQuery( );

            if ( daoUtil.next( ) )
            {
                nKey = daoUtil.getInt( 1 ) + 1;
            }
        }

        return nKey;
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public void insert( HtmlPortletTemplate template )
    {
        try ( DAOUtil daoUtil = new DAOUtil( SQL_QUERY_INSERT ) )
        {
            template.setId( newPrimaryKey( ) );

            daoUtil.setInt( 1, template.getId( ) );
            daoUtil.setString( 2, template.getDescription( ) );
            daoUtil.setString( 3, template.getTemplatePath( ) );

            daoUtil.executeUpdate( );
        }
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public void store( HtmlPortletTemplate template )
    {
        try ( DAOUtil daoUtil = new DAOUtil( SQL_QUERY_UPDATE ) )
        {
            daoUtil.setString( 1, template.getDescription( ) );
            daoUtil.setString( 2, template.getTemplatePath( ) );
            daoUtil.setInt( 3, template.getId( ) );

            daoUtil.executeUpdate( );
        }
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public void delete( int nIdTemplate )
    {
        try ( DAOUtil daoUtil = new DAOUtil( SQL_QUERY_DELETE ) )
        {
            daoUtil.setInt( 1, nIdTemplate );
            daoUtil.executeUpdate( );
        }
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public HtmlPortletTemplate load( int nIdTemplate )
    {
        HtmlPortletTemplate template = null;

        try ( DAOUtil daoUtil = new DAOUtil( SQL_QUERY_SELECT ) )
        {
            daoUtil.setInt( 1, nIdTemplate );
            daoUtil.executeQuery( );

            if ( daoUtil.next( ) )
            {
                template = loadFromDaoUtil( daoUtil );
            }
        }

        return template;
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public List<HtmlPortletTemplate> selectTemplatesList( )
    {
        List<HtmlPortletTemplate> listTemplates = new ArrayList<>( );

        try ( DAOUtil daoUtil = new DAOUtil( SQL_QUERY_SELECTALL ) )
        {
            daoUtil.executeQuery( );

            while ( daoUtil.next( ) )
            {
                listTemplates.add( loadFromDaoUtil( daoUtil ) );
            }
        }

        return listTemplates;
    }

    /**
     * {@inheritDoc }
     */
    @Override
    public boolean checkTemplateIsUsed( int nIdTemplate )
    {
        boolean bIsUsed = false;

        try ( DAOUtil daoUtil = new DAOUtil( SQL_QUERY_CHECK_IS_USED ) )
        {
            daoUtil.setInt( 1, nIdTemplate );
            daoUtil.executeQuery( );

            if ( daoUtil.next( ) )
            {
                bIsUsed = daoUtil.getInt( 1 ) > 0;
            }
        }

        return bIsUsed;
    }

    /**
     * Build a template from the current row of the result set
     *
     * @param daoUtil
     *            the DAOUtil positioned on a row
     * @return the template
     */
    private HtmlPortletTemplate loadFromDaoUtil( DAOUtil daoUtil )
    {
        HtmlPortletTemplate template = new HtmlPortletTemplate( );
        template.setId( daoUtil.getInt( 1 ) );
        template.setDescription( daoUtil.getString( 2 ) );
        template.setTemplatePath( daoUtil.getString( 3 ) );

        return template;
    }
}
