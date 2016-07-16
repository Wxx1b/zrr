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
import com.sinitek.base.common.api.CommonAPIFactory;
import com.sinitek.managerdemo.demo.common.api.IDemoAPI;
import com.sinitek.managerdemo.demo.common.entity.IDemo;
import com.sinitek.spirit.service.core.*;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 15:15
 * 文件说明：TODO
 */
public class DemoQueryInfoServiceHandler extends AbstractServiceHandler
{
    public IServiceResponse handle( IServiceCoreRequest request ) throws BaseException
    {
        //获取参数
        Integer objid = request.getInteger( "objid" );
        String name = request.getString( "name" );

        IDemoAPI demoAPI = ( IDemoAPI ) CommonAPIFactory.getInstance().getCommonAPI( IDemoAPI.class );
        List<IDemo> demos;
        if(objid!=null)
        {
            IDemo demo=demoAPI.getDemoByID( objid );
            demos= Arrays.asList(demo);
        }
        else
            demos = demoAPI.getDemoByName( name );

        //返回结果
        SimpleServiceResponse serviceResponse = SimpleServiceResponse.createSuccessResponse( "查询成功" );

        for ( IDemo demo : demos )
        {
            SimpleParamObject simpleParamObject = new SimpleParamObject();

            simpleParamObject.addParam( "objid", demo.getId() );
            simpleParamObject.addParam( "name", demo.getName() );
            simpleParamObject.addParam( "age", demo.getAge() );
            simpleParamObject.addParam( "income", demo.getIncome() );
            simpleParamObject.addParam( "gender", demo.getGender() );

            serviceResponse.addRecord( simpleParamObject );
        }
        serviceResponse.addParam( "count", demos.size() );

        return serviceResponse;
    }
}