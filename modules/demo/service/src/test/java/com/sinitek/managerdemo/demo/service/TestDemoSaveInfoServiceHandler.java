/**
 * File Name:    TestDemoSaveInfoServiceHandler.java
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
 * Time: 18:07
 * 文件说明：TODO
 */
public class TestDemoSaveInfoServiceHandler extends TestSupper
{
    public void testHandler()
    {
        SimpleServiceRequest simpleServiceRequest = new SimpleServiceRequest( "DEMO_SAVE_INFO" );
        simpleServiceRequest.addParam( "name", "test1" );
        simpleServiceRequest.addParam( "age", 12 );
        simpleServiceRequest.addParam( "income", 8000.0 );
        simpleServiceRequest.addParam( "gender", GenderEnums.GENDER_GIRL );

        IServiceResponse response = ServiceContextFactory.getInstance().getContext().handleService( simpleServiceRequest );
        //远程调用方式
        // ServiceContextClientFactory.getServiceContext().handleService( simpleServiceRequest );

        printResult( response );
    }
}