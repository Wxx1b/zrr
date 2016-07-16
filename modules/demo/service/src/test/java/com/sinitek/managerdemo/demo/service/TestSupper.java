/**
 * File Name:    TestSupper.java
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

import com.sinitek.spirit.service.core.*;
import junit.framework.TestCase;

import java.util.Iterator;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 18:24
 * 文件说明：TODO
 */
public class TestSupper extends TestCase
{
    public void printResult( IServiceResponse serviceResponse )
    {
        System.out.println( "返回结果:\n{" );
        System.out.println( "\treturncode:" + serviceResponse.getReturnCode() );
        System.out.println( "\treturnmessage:" + serviceResponse.getReturnMessage() );

        Iterator<String> iterator = serviceResponse.getParamNames().iterator();

        while ( iterator.hasNext() )
        {
            String paramName = iterator.next();
            Object paramVal = serviceResponse.getObject( paramName );
            System.out.println( "\t" + paramName + ":" + paramVal );
        }

        while ( serviceResponse.hasNext() )
        {
            System.out.println( "\t{" );
            IParamObject paramObject = ( IParamObject ) serviceResponse.next();
            Iterator<String> paramIterator = paramObject.getParamNames().iterator();

            while ( paramIterator.hasNext() )
            {
                String paramName = paramIterator.next();
                Object paramVal = paramObject.getObject( paramName );
                System.out.println( "\t\t" + paramName + ":" + paramVal + ";" );
            }
            System.out.println( "\t}" );
        }

        System.out.println( "}" );
    }
}