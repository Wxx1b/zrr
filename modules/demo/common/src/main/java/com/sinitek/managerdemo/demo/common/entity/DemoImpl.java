/**
 * File Name:    DemoImpl.java
 *
 * File Desc:    demo实例
 *
 * Module Name:  后台模块
 *
 * Module AB:    后台模块
 *
 * Author:       MetaDB Framework
 *
 * History:      2016-06-28 created by MetaDB Framework
 */
package com.sinitek.managerdemo.demo.common.entity;

import com.sinitek.base.metadb.*;

/**
 * demo实例
 * 实现类
 *
 * @author  MetaDB Framework
 * @version 1.0
 */
public class DemoImpl extends MetaObjectImpl implements IDemo
{
    public DemoImpl()
    {
        this( MetaDBContextFactory.getInstance().getEntity( ENTITY_NAME ) );
    }

    public DemoImpl( IEntity entity )
    {
        super( entity );
    }

    public String getName()
    {
        return ( String ) get( "name" );
    }


    public void setName( String value )
    {
        put( "name", value );
    }


    public Integer getAge()
    {
        return ( Integer ) get( "age" );
    }


    public void setAge( Integer value )
    {
        put( "age", value );
    }


    public String getGender()
    {
        return ( String ) get( "gender" );
    }


    public void setGender( String value )
    {
        put( "gender", value );
    }


    public Double getIncome()
    {
        return ( Double ) get( "income" );
    }


    public void setIncome( Double value )
    {
        put( "income", value );
    }



}