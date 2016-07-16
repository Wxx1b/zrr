/**
 * File Name:    IDemoObject.java
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
import com.sinitek.base.metadb.IMetaObjectImpl;

import java.util.Date;

/**
 * 范例对象
 *
 * @author  MetaDB Framework
 * @version 1.0
 */
public interface IDemoObject extends IMetaObjectImpl
{
    /**
     * 对应实体名称，取值为DEMOOBJECT
     */
    public static final String ENTITY_NAME = "DEMOOBJECT";

    /**
     * 获得日期属性值
     *
     * @return 日期属性值
     */
    public Date getDemoDate();

    /**
     * 设置日期属性值
     *
     * @param value 日期属性值
     */
    public void setDemoDate( Date value );

    /**
     * 获得枚举属性值
     *
     * @return 枚举属性值
     */
    public IEnumItem getDemoEnum();

    /**
     * 设置枚举属性值
     *
     * @param value 枚举属性值
     */
    public void setDemoEnum( IEnumItem value );

    /**
     * 设置枚举枚举属性值
     *
     * @param value 枚举枚举属性值，使用枚举项值
     */
    public void setDemoEnumEnumValue( Integer value );

    /**
     * 获得外键属性值
     *
     * @return 外键属性值
     */
    public IDemoObject2 getDemoForeign();

    /**
     * 设置外键属性值
     *
     * @param value 外键属性值
     */
    public void setDemoForeign( IDemoObject2 value );

    /**
     * 设置外键关联实体属性值
     *
     * @param value 外键属性关联值
     */
    public void setDemoForeignEntityValue( Object value );

    /**
     * 获得字符串属性值
     *
     * @return 字符串属性值
     */
    public String getDemoString();

    /**
     * 设置字符串属性值
     *
     * @param value 字符串属性值
     */
    public void setDemoString( String value );

    /**
     * 获得整型属性值
     *
     * @return 整型属性值
     */
    public Integer getDemoInteger();

    /**
     * 设置整型属性值
     *
     * @param value 整型属性值
     */
    public void setDemoInteger( Integer value );


}