/**
 * File Name:    IDemoObject2.java
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

import com.sinitek.base.metadb.IMetaObjectImpl;

/**
 * 范例表2
 *
 * @author  MetaDB Framework
 * @version 1.0
 */
public interface IDemoObject2 extends IMetaObjectImpl
{
    /**
     * 对应实体名称，取值为DEMOOBJECT2
     */
    public static final String ENTITY_NAME = "DEMOOBJECT2";

    /**
     * 获得名字属性值
     *
     * @return 名字属性值
     */
    public String getName();

    /**
     * 设置名字属性值
     *
     * @param value 名字属性值
     */
    public void setName( String value );


}