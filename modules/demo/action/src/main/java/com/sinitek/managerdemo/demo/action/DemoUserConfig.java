package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.userconfig.ISpiritUserConfigAware;

import javax.servlet.http.HttpServletRequest;

/**
 * 控件用户配置范例
 */
public class DemoUserConfig implements ISpiritUserConfigAware
{
    /**
     * 读取用户表格控件 PageSize
     * @param tableId 表格ID
     * @param className 表格ClassName
     * @param request HttpServletRequest
     * @return pageSize
     */
    public Integer loadPageSize(String tableId, String className, HttpServletRequest request) {
        //todo 从数据库读取信息，返回Integer或null
        return null;
    }

    /**
     * 保存用户表格控件 PageSize
     * @param tableId 表格ID
     * @param className 表格ClassName
     * @param pageSize pageSize
     * @param request HttpServletRequest
     */
    public void savePageSize(String tableId, String className, Integer pageSize, HttpServletRequest request) {
        //todo 保存信息到数据库
    }
}
