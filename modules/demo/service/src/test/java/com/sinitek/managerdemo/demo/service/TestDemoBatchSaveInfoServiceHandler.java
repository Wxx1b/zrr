/**
 * File Name:    TestDemoBatchSaveInfoServiceHandler.java
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
package com.sinitek.managerdemo.demo.service;

import com.sinitek.managerdemo.demo.common.enums.GenderEnums;
import com.sinitek.spirit.service.core.*;
import com.sinitek.spirit.service.core.impl.local.ServiceContextFactory;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 18:06
 * 文件说明：TODO
 */
public class TestDemoBatchSaveInfoServiceHandler extends TestSupper
{
    public void testHandler()
    {
        SimpleServiceRequest simpleServiceRequest = new SimpleServiceRequest( "DEMO_BATCH_SAVE_INFO" );

        SimpleParamObject simpleParamObject = new SimpleParamObject();
        simpleParamObject.addParam( "name", "test1" );
        simpleParamObject.addParam( "age", 12 );
        simpleParamObject.addParam( "income", 8000 );
        simpleParamObject.addParam( "gender", GenderEnums.GENDER_GIRL );

        simpleServiceRequest.addRecord( simpleParamObject );

        IServiceResponse response = ServiceContextFactory.getInstance().getContext().handleService( simpleServiceRequest );

        printResult( response );


    }
}