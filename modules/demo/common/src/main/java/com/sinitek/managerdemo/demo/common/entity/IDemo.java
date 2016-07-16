/**
 * File Name:    IDemo.java
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
 *
 * @author  MetaDB Framework
 * @version 1.0
 */
public interface IDemo extends IMetaObjectImpl
{
    /**
     * 对应实体名称:DEMO
     */
    public static final String ENTITY_NAME = "DEMO";

    /**
     * 获得姓名属性值
     *
     * @return 姓名属性值
     */
    public String getName();

    /**
     * 设置姓名属性值
     *
     * @param value 姓名属性值
     */
    public void setName( String value );

    /**
     * 获得年龄属性值
     *
     * @return 年龄属性值
     */
    public Integer getAge();

    /**
     * 设置年龄属性值
     *
     * @param value 年龄属性值
     */
    public void setAge( Integer value );

    /**
     * 获得性别属性值
     *
     * @return 性别属性值
     */
    public String getGender();

    /**
     * 设置性别属性值
     *
     * @param value 性别属性值
     */
    public void setGender( String value );

    /**
     * 获得收入属性值
     *
     * @return 收入属性值
     */
    public Double getIncome();

    /**
     * 设置收入属性值
     *
     * @param value 收入属性值
     */
    public void setIncome( Double value );


}