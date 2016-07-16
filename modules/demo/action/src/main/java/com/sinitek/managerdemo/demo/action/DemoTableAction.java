package com.sinitek.managerdemo.demo.action;

import com.sinitek.base.metadb.MetaDBTemplate;
import com.sinitek.base.metadb.query.IMetaDBQuery;
import com.sinitek.managerdemo.demo.common.entity.IDemoObject;
import com.sinitek.spirit.webcontrol.table.ITableAware;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 表格控件范例
 */
public class DemoTableAction implements ITableAware
{
    public Object getResult( Map<String, String> map, HttpServletRequest request ) throws Exception
    {
        IMetaDBQuery result=new MetaDBTemplate().createQuery( IDemoObject.ENTITY_NAME, "1=1" );
        return result;

    }

    public String setDefaultOrderBy( Map<String, String> map, HttpServletRequest request )
    {
        return "";
    }

    public static String testCustCol( Map data, HttpServletRequest request )
    {
        if ( Boolean.valueOf( true ) == request.getAttribute( "__on_export_excel__" ) )
        {
            return "哈哈";
        } else
        {
            return "<a href='#' title='测试自定义tip'>哈哈</a>";
        }
    }
}
