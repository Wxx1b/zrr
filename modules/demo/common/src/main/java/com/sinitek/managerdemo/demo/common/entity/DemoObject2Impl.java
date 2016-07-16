/**
 * File Name:    DemoObject2Impl.java
 *
 * File Desc:    范例表2
 *
 * Module Name:  通用框架
 *
 * Module AB:    通用框架
 *
 * Author:       MetaDB Framework
 *
 * History:      2011-02-25 created by MetaDB Framework
 */
package com.sinitek.managerdemo.demo.common.entity;

import com.sinitek.base.metadb.*;

/**
 * 范例表2
 * 实现类
 *
 * @author  MetaDB Framework
 * @version 1.0
 */
public class DemoObject2Impl extends MetaObjectImpl implements IDemoObject2
{
    public DemoObject2Impl()
    {
        this( MetaDBContextFactory.getInstance().getEntity( ENTITY_NAME ) );
    }

    private DemoObject2Impl(IEntity entity)
    {
        super( entity );
    }

    public String getName()
    {
        return ( String ) get( "Name" );
    }


    public void setName( String value )
    {
        put( "Name", value );
    }



}