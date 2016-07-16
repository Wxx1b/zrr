/**
 * File Name:    GenderEnums.java
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
 * History:      2015/12/14 created by hy.ao
 */
package com.sinitek.managerdemo.demo.common.enums;

import com.sinitek.base.enumsupport.AbstractEnumItem;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 17:24
 * 文件说明：TODO
 */
public class GenderEnums extends AbstractEnumItem
{
    /**
     * 性别女
     */
    public static final GenderEnums GENDER_GIRL = new GenderEnums( "0", 0, "女", null );

    /**
     * 性别男
     */
    public static final GenderEnums GENDER_BOY = new GenderEnums( "1", 1, "男", null );

    protected GenderEnums( String enumItemName, int enumItemValue, String enumItemInfo, String enumItemDisplayValue )
    {
        super( enumItemName, enumItemValue, enumItemInfo, enumItemDisplayValue );
    }
}