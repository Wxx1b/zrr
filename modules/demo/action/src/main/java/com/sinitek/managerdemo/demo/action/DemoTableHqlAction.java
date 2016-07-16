package com.sinitek.managerdemo.demo.action;

import com.sinitek.base.metadb.MetaDBTemplate;
import com.sinitek.managerdemo.demo.common.entity.IDemoObject;
import com.sinitek.spirit.webcontrol.table.ITableAware;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 表格控件Hql查询范例
 */
public class DemoTableHqlAction implements ITableAware
{
    public Object getResult(Map<String, String> map, HttpServletRequest request) throws Exception {
        return new MetaDBTemplate().createQuery( IDemoObject.ENTITY_NAME,"1=1");
    }

    public String setDefaultOrderBy(Map<String, String> map, HttpServletRequest request) {
        return "";
    }

    public static String testCustCol(Map data)
    {
        return "哈哈";
    }
}
