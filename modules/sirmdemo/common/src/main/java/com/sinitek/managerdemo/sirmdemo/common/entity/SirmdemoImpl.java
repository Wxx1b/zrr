/**
 * File Name:    SirmdemoImpl.java
 *
 * File Desc:    sirm模块（商品信息表）
 *
 * Module Name:  sirm模块
 *
 * Module AB:    sirm模块
 *
 * Author:       MetaDB Framework
 *
 * History:      2016-07-08 created by MetaDB Framework
 */
package com.sinitek.managerdemo.sirmdemo.common.entity;

import com.sinitek.base.metadb.*;

/**
 * sirm模块（商品信息表）
 * 实现类
 *
 * @author  MetaDB Framework
 * @version 1.0
 */
public class SirmdemoImpl extends MetaObjectImpl implements ISirmdemo
{
    public SirmdemoImpl()
    {
        this( MetaDBContextFactory.getInstance().getEntity( ENTITY_NAME ) );
    }

    public SirmdemoImpl( IEntity entity )
    {
        super( entity );
    }

    public Integer getCATEGORY()
    {
        return ( Integer ) get( "CATEGORY" );
    }


    public void setCATEGORY( Integer value )
    {
        put( "CATEGORY", value );
    }


    public String getPRODUCTID()
    {
        return ( String ) get( "PRODUCTID" );
    }


    public void setPRODUCTID( String value )
    {
        put( "PRODUCTID", value );
    }


    public String getPRODUCTNAME()
    {
        return ( String ) get( "PRODUCTNAME" );
    }


    public void setPRODUCTNAME( String value )
    {
        put( "PRODUCTNAME", value );
    }


    public Double getPRODUCTPRICE()
    {
        return ( Double ) get( "PRODUCTPRICE" );
    }


    public void setPRODUCTPRICE( Double value )
    {
        put( "PRODUCTPRICE", value );
    }


    public Integer getQUANTITY()
    {
        return ( Integer ) get( "QUANTITY" );
    }


    public void setQUANTITY( Integer value )
    {
        put( "QUANTITY", value );
    }


    public String getDESPERATION()
    {
        return ( String ) get( "DESPERATION" );
    }


    public void setDESPERATION( String value )
    {
        put( "DESPERATION", value );
    }


    public String getORIGIN()
    {
        return ( String ) get( "ORIGIN" );
    }


    public void setORIGIN( String value )
    {
        put( "ORIGIN", value );
    }


    public String getPRODUCTDATE()
    {
        return ( String ) get( "PRODUCTDATE" );
    }


    public void setPRODUCTDATE( String value )
    {
        put( "PRODUCTDATE", value );
    }



}