/**
 * File Name:    AgeBusinessExceptionEnum.java
 * <p>
 * File Desc:    TODO
 * <p>
 * Product AB:   TODO
 * <p>
 * Product Name: TODO
 * <p>
 * Module Name:  TODO
 * <p>
 * Module AB:    TODO
 * <p>
 * Author:       jc.xue
 * <p>
 * History:      2016/5/10 created by jc.xue
 */
package com.sinitek.managerdemo.demo.common.enums;


import com.sinitek.base.enumsupport.AbstractBusinessExceptionEnum;

/**
 * Created with IntelliJ IDEA.
 * User: jc.xue
 * Date: 2016/5/10
 * Time: 11:40
 * 文件说明：TODO
 */
public class AgeBusinessExceptionEnum extends AbstractBusinessExceptionEnum
{
    /**
     * 年龄范围异常，>60
     */
    public static final AgeBusinessExceptionEnum AGE_TOO_OLD=new AgeBusinessExceptionEnum( "TOO_OLD","年龄太大" );
    /**
     * 年龄范围异常，<18
     */
    public static final AgeBusinessExceptionEnum AGE_TOO_YOUNG=new AgeBusinessExceptionEnum( "TOO_YOUNG","年龄太小" );;

    private AgeBusinessExceptionEnum( String enumItemName, String enumItemInfo )
    {
        super( enumItemName, enumItemInfo );
    }

    @Override
    protected String getProjectCode()
    {
        return "managerdemo";
    }

    @Override
    protected String getModuleCode()
    {
        return "demo";
    }
}