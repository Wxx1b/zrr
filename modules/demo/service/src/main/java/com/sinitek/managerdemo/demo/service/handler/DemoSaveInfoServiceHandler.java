/**
 * File Name:    DemoSaveInfoServiceHandler.java
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
package com.sinitek.managerdemo.demo.service.handler;

import com.sinitek.base.common.BaseException;
import com.sinitek.base.enumsupport.IEnumItem;
import com.sinitek.managerdemo.demo.common.entity.DemoImpl;
import com.sinitek.managerdemo.demo.common.entity.IDemo;
import com.sinitek.spirit.service.core.*;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 15:15
 * 文件说明：单个保存信息
 */
public class DemoSaveInfoServiceHandler extends AbstractServiceHandler
{
    public IServiceResponse handle( IServiceCoreRequest request ) throws BaseException
    {
        //获取参数
        String name = request.getString( "name" );
        Integer age = request.getInteger( "age" );
        Double income = request.getDouble( "income" );
        IEnumItem gender = request.getEnumItem( "gender" );

        //保存对象
        IDemo demo = new DemoImpl();
        demo.setAge( age );
        demo.setName( name );
        demo.setGender( gender.getEnumItemName() );
        demo.setIncome( income );

        demo.save();

        //返回结果
        SimpleServiceResponse serviceResponse = SimpleServiceResponse.createSuccessResponse( "保存成功" );

        serviceResponse.addParam( "name", name );
        serviceResponse.addParam( "objid", demo.getId() );

        return serviceResponse;
    }
}