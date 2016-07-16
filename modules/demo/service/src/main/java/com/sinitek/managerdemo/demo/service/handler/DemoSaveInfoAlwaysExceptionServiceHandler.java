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


import com.sinitek.base.common.*;
import com.sinitek.base.common.api.CommonAPIFactory;
import com.sinitek.base.enumsupport.IEnumItem;
import com.sinitek.managerdemo.demo.common.api.IDemoAPI;
import com.sinitek.managerdemo.demo.common.entity.*;
import com.sinitek.managerdemo.demo.common.enums.AgeBusinessExceptionEnum;
import com.sinitek.spirit.service.core.*;

/**
 * Created with IntelliJ IDEA.
 * User: jc.xue
 * Date: 2016/05/10
 * Time: 13:05
 * 文件说明：单个保存信息，必定抛出异常
 */
public class DemoSaveInfoAlwaysExceptionServiceHandler extends AbstractServiceHandler
{
    public IServiceResponse handle( IServiceCoreRequest request ) throws BaseException
    {
        //获取参数
        Integer objid=request.getInteger( "objid" );
        String name = request.getString( "name" );
        Integer age = request.getInteger( "age" );
        Double income = request.getDouble( "income" );
        IEnumItem gender = request.getEnumItem( "gender" );

        if(age<18)
            throw new BusinessException( AgeBusinessExceptionEnum.AGE_TOO_YOUNG);
        else if(age>60)
            throw new BusinessException( AgeBusinessExceptionEnum.AGE_TOO_OLD);

        //保存对象
        IDemo demo;
        if(objid!=null)
        {
            IDemoAPI demoAPI = ( IDemoAPI ) CommonAPIFactory.getInstance().getCommonAPI( IDemoAPI.class );
            demo=demoAPI.getDemoByID( objid );
        }
        else
            demo= new DemoImpl();
        demo.setAge( age );
        demo.setName( name );
        demo.setGender( gender.getEnumItemName() );
        demo.setIncome( income );

//        demo.save();

        //  假设异常
        if(1==1)
            throw new NullPointerException( "假异常" );

        //返回结果
        SimpleServiceResponse serviceResponse = SimpleServiceResponse.createSuccessResponse( "保存成功" );

        serviceResponse.addParam( "name", name );
        serviceResponse.addParam( "objid", demo.getId() );

        return serviceResponse;
    }
}