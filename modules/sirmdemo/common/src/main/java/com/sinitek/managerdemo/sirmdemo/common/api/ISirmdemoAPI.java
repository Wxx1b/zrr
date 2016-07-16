/**
 * File Name:    ISirmdemoAPI.java
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
 * History:      2016/7/9 0009 created by jie.wang
 */
package com.sinitek.managerdemo.sirmdemo.common.api;

import com.sinitek.base.common.api.ICommonAPI;
import com.sinitek.managerdemo.sirmdemo.common.entity.ISirmdemo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jie.wang
 * Date: 2016/7/9 0009
 * Time: 下午 1:43
 * 文件说明：TODO
 */
public interface ISirmdemoAPI extends ICommonAPI
{
    /**
     * 通过id 获取sirmdemo信息
     * @param objid
     * @return
     */
    public ISirmdemo getById(int objid);

    public List<ISirmdemo> getByName(String name);
}
