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
import com.sinitek.spirit.webcontrol.table.ITableAware;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 15:07
 * 文件说明：TODO
 */
public class DemoQueryTableMultiAction implements ITableAware
{
    @Override
    public Object getResult( Map<String, String> map, HttpServletRequest httpServletRequest ) throws Exception
    {
        StringBuilder _sql = new StringBuilder( " 1=1 " );
        Map<String, Object> params = new HashMap<String, Object>();

        String name = map.get( "name" );
        String gender = map.get( "gender" );
        if ( StringUtils.isNotBlank( name ) )
        {
            _sql.append( " and name like :name" );
            params.put( "name", "%" + name + "%" );
        }
        if ( StringUtils.isNotBlank( gender ) )
        {
            _sql.append( " and gender = :gender" );
            params.put( "gender", gender );
        }

        IMetaDBQuery metaDBQuery = new MetaDBTemplate().createQuery( IDemo.ENTITY_NAME, _sql.toString() );
        metaDBQuery.setParameters( params );

        return metaDBQuery;
    }

    @Override
    public String setDefaultOrderBy( Map<String, String> map, HttpServletRequest httpServletRequest ) throws Exception
    {
        return null;
    }
}