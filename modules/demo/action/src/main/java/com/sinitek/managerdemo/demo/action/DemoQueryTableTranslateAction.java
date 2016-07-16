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
public class DemoQueryTableTranslateAction implements ITableAware, ITableBatch
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

    @Override
    public List tableBatch( List list, Map map, HttpServletRequest httpServletRequest ) throws Exception
    {
        for ( Object o : list )
        {
            Map<String, Object> resultMap = ( Map<String, Object> ) o;
            String name = ( String ) resultMap.get( "name" );

            resultMap.put( "axis", "axis_" + name );
        }

        return list;
    }
}