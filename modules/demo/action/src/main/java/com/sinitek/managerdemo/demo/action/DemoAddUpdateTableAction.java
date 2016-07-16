/**
 * File Name:    DemoQueryTableAction.java
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
package com.sinitek.managerdemo.demo.action;

import com.sinitek.base.metadb.*;
import com.sinitek.managerdemo.demo.common.entity.*;
import com.sinitek.managerdemo.demo.common.enums.*;
import com.sinitek.spirit.service.core.*;
import com.sinitek.spirit.service.core.impl.local.ServiceContextFactory;
import com.sinitek.spirit.webcontrol.table.ITableAware;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 15:07
 * 文件说明：TODO
 */
public class DemoAddUpdateTableAction implements ITableAware
{
    @Override
    public List<IMetaObject> getResult( Map<String, String> map, HttpServletRequest httpServletRequest ) throws Exception
    {
        List<IMetaObject> result=new MetaDBTemplate().query( IDemo.ENTITY_NAME, "1=1", Collections.emptyMap() );
        //                                             createQuery
        return result;
    }

    @Override
    public String setDefaultOrderBy( Map<String, String> map, HttpServletRequest httpServletRequest ) throws Exception
    {
        return null;
    }

    /**
     * 更新
     *
     * @param param
     * @param request
     * @throws Exception
     */
    public void addUpdate( Map<String, String> param, HttpServletRequest request ) throws Exception
    {
        String type = param.get( "type" );
        IDemo tmp;
        if ( "0".equals( type ) )
        {
            tmp = new DemoImpl();
        } else
        {
            String objid = param.get( "objid" );
            tmp = ( IDemo ) new MetaDBTemplate().get( IDemo.ENTITY_NAME, Integer.parseInt( objid ) );
        }

        final IDemo demo = tmp;
        demo.setIncome( Double.valueOf( param.get( "income_update" ) ) );
        demo.setName( param.get( "name_update" ) );
        demo.setGender( param.get( "gender_update" ) );
        demo.setAge( Integer.parseInt( param.get( "age_update" ) ) );

        new MetaDBTemplate().callExecutor( new IMetaDBTemplateExecutor()
        {
            public void doInTransaction( IMetaDBContext ctx )
            {
                demo.save();
            }
        } );
    }

    public String addUpdateServiceAlwaysException( Map<String, String> param, HttpServletRequest request )
    {
        String type = param.get( "type" );

        SimpleServiceRequest simpleServiceRequest = new SimpleServiceRequest( "DEMO_SAVE_INFO_EXCEPTION" );
        if("1".equals( type ))
            simpleServiceRequest.addParam( "objid", Integer.parseInt( param.get( "objid" ) ) );
        simpleServiceRequest.addParam( "name", param.get( "name_update" ) );
        simpleServiceRequest.addParam( "age", Integer.parseInt( param.get( "age_update" ) ) );
        simpleServiceRequest.addParam( "income", Double.valueOf( param.get( "income_update" ) ) );
        simpleServiceRequest.addParam( "gender", param.get( "gender_update" ) );

        IServiceResponse response = ServiceContextFactory.getInstance().getContext().handleService( simpleServiceRequest );
        if(!response.isSuccess())
        {
            String returncode=response.getReturnCode();
            if( AgeBusinessExceptionEnum.AGE_TOO_OLD.getEnumItemName().equals( returncode ))
                return "年龄大于60岁，操作失败";
            else if(AgeBusinessExceptionEnum.AGE_TOO_YOUNG.getEnumItemName().equals( returncode ))
                return "年龄未满18岁，操作失败";
            else if( "99999999".equals( returncode ) )
                return "未知系统异常，错误编号:"+returncode;
            else
                return "系统异常，请联系系统管理员。错误编号:"+returncode;    //  TODO message
        }
        else
            return null;
    }
}