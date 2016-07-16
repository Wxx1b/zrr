/**
 * File Name:    IDemoAPI.java
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
package com.sinitek.managerdemo.demo.common.api;

import com.sinitek.base.common.api.ICommonAPI;
import com.sinitek.managerdemo.demo.common.entity.IDemo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 14:47
 * 文件说明：demo api
 */
public interface IDemoAPI extends ICommonAPI
{
    /**
     * 通过id 获取demo信息
     *
     * @param objid
     * @return
     */
    public IDemo getDemoByID( int objid );

    /**
     * 通过姓名查找实体
     *
     * @param name
     * @return
     */
    public List<IDemo> getDemoByName( String name );
}