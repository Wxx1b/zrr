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
import com.sinitek.managerdemo.demo.common.entity.*;
import com.sinitek.spirit.service.core.*;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 15:15
 * 文件说明：批量进行保存
 */
public class DemoBatchSaveInfoServiceHandler extends AbstractServiceHandler
{
    public IServiceResponse handle( IServiceCoreRequest request ) throws BaseException
    {
        //返回结果
        SimpleServiceResponse serviceResponse = SimpleServiceResponse.createSuccessResponse( "保存成功" );

        int count = 0;

        //获取参数
        while ( request.hasNext() )
        { //循环的方式获取list参数
            IParamObject paramObject = ( IParamObject ) request.next();
            String name = paramObject.getString( "name" );
            String gender = paramObject.getString( "gender" );
            Integer age = paramObject.getInteger( "age" );
            Double income = paramObject.getDouble( "income" );

            //保存对象
            IDemo demo = new DemoImpl();
            demo.setAge( age );
            demo.setName( name );
            demo.setGender( gender );
            demo.setIncome( income );

            demo.save();

            //list结果集组装
            SimpleParamObject resultParamObject = new SimpleParamObject();
            resultParamObject.addParam( "name", name );
            resultParamObject.addParam( "objid", demo.getId() );

            serviceResponse.addRecord( resultParamObject );
            count++;
        }
        serviceResponse.addParam( "count", count );

        return serviceResponse;
    }
}