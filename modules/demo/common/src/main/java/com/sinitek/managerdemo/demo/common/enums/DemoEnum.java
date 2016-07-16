/**
 * File Name:    UserInfoState.java
 *
 * File Desc:    用户状态枚举类
 *
 * Product AB:   BASE_1_0_0
 *
 * Product Name: 底层框架
 *
 * Module Name:  Framework
 *
 * Module AB:    Framework
 *
 * Author:       方佳玮
 *
 * History:      2008-4-16 created by 方佳玮
 */
package com.sinitek.managerdemo.demo.common.enums;

import com.sinitek.base.enumsupport.AbstractEnumItem;

/**
 * 用户状态枚举类
 *
 * @author Jw Fang
 * @version 1.0
 */
public class DemoEnum extends AbstractEnumItem
{
    /**
     * 0-正常
     */
    public static final DemoEnum NORMAL = new DemoEnum( "0", 0, "正常", null );

    /**
     * 1-注销
     */
    public static final DemoEnum DELETE = new DemoEnum( "1", 1, "注销", null );

    /**
     * 2-锁定
     */
    public static final DemoEnum LOCK = new DemoEnum( "2", 2, "锁定", null );

    private DemoEnum(String s, int i, String s1, String s2)
    {
        super( s, i, s1, null);
    }
}