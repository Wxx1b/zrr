package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.table.ITableAware;
import org.apache.commons.collections.map.CaseInsensitiveMap;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 表格控件范例
 */
public class DemoTableListCustAction implements ITableAware
{
    @SuppressWarnings("UnusedDeclaration")
    public Object getResult(Map<String, String> map, HttpServletRequest request) throws Exception {
        List list = new ArrayList();
        //可从map获取pageSize和pageNum，如下
        Integer pageSize = new Integer(map.get( "__pageSize" ));
        Integer pageNum = new Integer(map.get( "__pageNum" ));
        for ( int i = 1; i <= 10; i++ )
        {
            Map obj = new CaseInsensitiveMap();
            obj.put( "objid",(pageNum)*10+i );
            obj.put( "DemoString", "String" + (pageNum)*10+i );
            obj.put( "DemoInteger", i );
            obj.put( "DemoDate", new Date() );
            list.add( obj );
        }
        //必须告诉控件总共多少行数据，如下
        map.put( "__allRow", "100" );
        return list;
    }

    public String setDefaultOrderBy(Map<String, String> map, HttpServletRequest request) {
        return "";
    }
}
