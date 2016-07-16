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
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 15:07
 * 文件说明：TODO
 */
public class DemoBatchDelTableAction implements ITableAware, ICheckBoxPluginAware
{
    @Override
    public Object getResult( Map<String, String> map, HttpServletRequest httpServletRequest ) throws Exception
    {
        return new MetaDBTemplate().query( IDemo.ENTITY_NAME, "1=1", Collections.EMPTY_MAP );
    }

    @Override
    public String setDefaultOrderBy( Map<String, String> map, HttpServletRequest httpServletRequest ) throws Exception
    {
        return null;
    }

    /**
     * 批量删除
     *
     * @param dataList           需要删除的数据内容
     * @param param              参数
     * @param httpServletRequest
     * @return
     * @throws Exception
     */
    @Override
    public Object callCheckBoxPlugin( List<Map> dataList, Map param, HttpServletRequest httpServletRequest ) throws Exception
    {
        int count = 0;
        for ( Map data : dataList )
        {
            String objid = "" + data.get( "objid" );
            IDemo demo = ( IDemo ) new MetaDBTemplate().get( IDemo.ENTITY_NAME, Integer.parseInt( objid ) );

            demo.remove();
            count++;
        }

        return "成功删除" + count + "条记录";
    }
}