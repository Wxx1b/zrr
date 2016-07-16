package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.table.ITableAware;
import org.apache.commons.collections.map.CaseInsensitiveMap;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 表格控件返回List范例
 */
public class DemoTableListAction implements ITableAware
{
    public Object getResult( Map<String, String> map, HttpServletRequest request ) throws Exception
    {
        List list = new ArrayList();
        for ( int i = 0; i < 3000; i++ )
        {
            Map obj = new CaseInsensitiveMap();
            obj.put( "DemoString", "String" + i );
            obj.put( "DemoInteger", i );
            obj.put( "DemoDate", new Date() );
            list.add( obj );
        }

        return list;
    }

    //暂时无用
    public String setDefaultOrderBy( Map<String, String> map, HttpServletRequest request )
    {
        return "";
    }
}