/**
 * File Name:    ProductTypeEnums.java
 * <p/>
 * File Desc:    TODO
 * <p/>
 * Product AB:   TODO
 * <p/>
 * Product Name: TODO
 * <p/>
 * Module Name:  TODO
 * <p/>
 * Module AB:    TODO
 * <p/>
 * Author:       敖海样
 * <p/>
 * History:      2016/7/8 0008 created by jie.wang
 */
package com.sinitek.managerdemo.sirmdemo.common.enums;

import com.sinitek.base.enumsupport.AbstractEnumItem;

/**
 * Created with IntelliJ IDEA.
 * User: jie.wang
 * Date: 2016/7/8 0008
 * Time: 上午 10:46
 * 文件说明：TODO
 */
public class ProductTypeEnums extends AbstractEnumItem
{
    public static final ProductTypeEnums SHIPIN =new ProductTypeEnums("0",0,"食品",null) ;
    public static final ProductTypeEnums JIADIAN =new ProductTypeEnums("1",1,"家电",null) ;
    public static final ProductTypeEnums SHUJI =new ProductTypeEnums("2",2,"书籍",null) ;

    protected ProductTypeEnums( String enumItemName, int enumItemValue, String enumItemInfo, String enumItemDisplayValue )
    {
        super( enumItemName, enumItemValue, enumItemInfo, enumItemDisplayValue );
    }
}