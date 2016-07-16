/**
 * File Name:    ISirmdemo.java
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
 *
 * @author  MetaDB Framework
 * @version 1.0
 */
public interface ISirmdemo extends IMetaObjectImpl
{
    /**
     * 对应实体名称，取值为SIRMDEMO
     */
    public static final String ENTITY_NAME = "SIRMDEMO";

    /**
     * 获得商品类型属性值
     *
     * @return 商品类型属性值
     */
    public Integer getCATEGORY();

    /**
     * 设置商品类型属性值
     *
     * @param value 商品类型属性值
     */
    public void setCATEGORY( Integer value );

    /**
     * 获得商品编号属性值
     *
     * @return 商品编号属性值
     */
    public String getPRODUCTID();

    /**
     * 设置商品编号属性值
     *
     * @param value 商品编号属性值
     */
    public void setPRODUCTID( String value );

    /**
     * 获得商品名称属性值
     *
     * @return 商品名称属性值
     */
    public String getPRODUCTNAME();

    /**
     * 设置商品名称属性值
     *
     * @param value 商品名称属性值
     */
    public void setPRODUCTNAME( String value );

    /**
     * 获得商品价格属性值
     *
     * @return 商品价格属性值
     */
    public Double getPRODUCTPRICE();

    /**
     * 设置商品价格属性值
     *
     * @param value 商品价格属性值
     */
    public void setPRODUCTPRICE( Double value );

    /**
     * 获得商品数量属性值
     *
     * @return 商品数量属性值
     */
    public Integer getQUANTITY();

    /**
     * 设置商品数量属性值
     *
     * @param value 商品数量属性值
     */
    public void setQUANTITY( Integer value );

    /**
     * 获得商品描述属性值
     *
     * @return 商品描述属性值
     */
    public String getDESPERATION();

    /**
     * 设置商品描述属性值
     *
     * @param value 商品描述属性值
     */
    public void setDESPERATION( String value );

    /**
     * 获得产地属性值
     *
     * @return 产地属性值
     */
    public String getORIGIN();

    /**
     * 设置产地属性值
     *
     * @param value 产地属性值
     */
    public void setORIGIN( String value );

    /**
     * 获得生产日期属性值
     *
     * @return 生产日期属性值
     */
    public String getPRODUCTDATE();

    /**
     * 设置生产日期属性值
     *
     * @param value 生产日期属性值
     */
    public void setPRODUCTDATE( String value );


}