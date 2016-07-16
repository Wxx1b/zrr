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

import com.sinitek.base.metadb.MetaDBTemplate;
import com.sinitek.base.metadb.query.IMetaDBQuery;
import com.sinitek.managerdemo.demo.common.entity.IDemo;
import com.sinitek.spirit.webcontrol.table.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 15:07
 * 文件说明：TODO
 */
public class DemoSingleDelTableAction implements ITableAware, IRadioBoxPluginAware
{
    @Override
    public Object getResult( Map<String, String> map, HttpServletRequest httpServletRequest ) throws Exception
    {
        IMetaDBQuery metaDBQuery = new MetaDBTemplate().createQuery( IDemo.ENTITY_NAME, "1=1" );
        return metaDBQuery;
    }

    @Override
    public String setDefaultOrderBy( Map<String, String> map, HttpServletRequest httpServletRequest ) throws Exception
    {
        return null;
    }

    /**
     * 单条删除
     *
     * @param data               需要删除的数据内容
     * @param param              参数
     * @param httpServletRequest
     * @return
     * @throws Exception
     */
    @Override
    public Object callRadioBoxPlugin( Map data, Map param, HttpServletRequest httpServletRequest ) throws Exception
    {
        String objid = "" + data.get( "objid" );
        IDemo demo = ( IDemo ) new MetaDBTemplate().get( IDemo.ENTITY_NAME, Integer.parseInt( objid ) );

        demo.remove();
        return "success";
    }
}