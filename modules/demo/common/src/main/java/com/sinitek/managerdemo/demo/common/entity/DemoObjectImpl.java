/**
 * File Name:    DemoObjectImpl.java
 *
 * File Desc:    范例对象
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

import com.sinitek.base.enumsupport.IEnumItem;
import com.sinitek.base.metadb.*;

import java.util.Date;

/**
 * 范例对象
 * 实现类
 *
 * @author  MetaDB Framework
 * @version 1.0
 */
public class DemoObjectImpl extends MetaObjectImpl implements IDemoObject
{
    public DemoObjectImpl()
    {
        this( MetaDBContextFactory.getInstance().getEntity( ENTITY_NAME ) );
    }

    private DemoObjectImpl(IEntity entity)
    {
        super( entity );
    }

    public Date getDemoDate()
    {
        return ( Date ) get( "DemoDate" );
    }


    public void setDemoDate( Date value )
    {
        put( "DemoDate", value );
    }


    public IEnumItem getDemoEnum()
    {
        return ( IEnumItem ) get( "DemoEnum" );
    }


    public void setDemoEnum( IEnumItem value )
    {
        put( "DemoEnum", value );
    }


    public void setDemoEnumEnumValue( Integer value )
    {
        setEnumValue( "DemoEnum", value );
    }


    public IDemoObject2 getDemoForeign()
    {
        return ( IDemoObject2 ) get( "DemoForeign" );
    }


    public void setDemoForeign( IDemoObject2 value )
    {
        put( "DemoForeign", value );
    }


    public void setDemoForeignEntityValue( Object value )
    {
        setEntityValue( "DemoForeign", value );
    }


    public String getDemoString()
    {
        return ( String ) get( "DemoString" );
    }


    public void setDemoString( String value )
    {
        put( "DemoString", value );
    }


    public Integer getDemoInteger()
    {
        return ( Integer ) get( "DemoInteger" );
    }


    public void setDemoInteger( Integer value )
    {
        put( "DemoInteger", value );
    }



}