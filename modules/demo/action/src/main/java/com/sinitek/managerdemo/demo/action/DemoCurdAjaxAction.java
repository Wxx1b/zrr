package com.sinitek.managerdemo.demo.action;

import com.sinitek.base.metadb.*;
import com.sinitek.base.metadb.query.IMetaDBQuery;
import com.sinitek.managerdemo.demo.common.entity.*;
import com.sinitek.spirit.webcontrol.table.*;
import com.sinitek.spirit.webcontrol.utils.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 增删查改范例
 */
public class DemoCurdAjaxAction implements ITableAware, ICheckBoxPluginAware
{
    public Object getResult(Map<String, String> map, HttpServletRequest request) throws Exception {
        Map<String, String> paras = new HashMap<String, String>();
        StringBuilder sql = new StringBuilder("1 = 1");

        QueryUtils.buildLike( "DemoString", map.get( "DemoString" ), sql, paras );
        QueryUtils.buildEqual( "DemoInteger", map.get( "DemoInteger" ), sql, paras );
        QueryUtils.buildEqual( "DemoEnum", map.get( "DemoEnum" ) == null ? null : new Integer( map.get( "DemoEnum" ) ), sql, paras );

        IMetaDBQuery query = new MetaDBTemplate().createQuery("DEMOOBJECT",sql.toString());
        if (!paras.isEmpty())
        {
            query.setParameters(paras);
        }
        return query;
    }

    public String setDefaultOrderBy(Map<String, String> map, HttpServletRequest request) {
        return "";
    }

    public static void addUpdate(Map<String,String> param, HttpServletRequest request) throws Exception
    {
        String type = param.get( "type" );
        if ( "0".equals( type ) )
        {
            //添加
            final IDemoObject o = new DemoObjectImpl();
            o.setDemoString( param.get( "DemoString" ) );
            o.setDemoDate( FormatUtils.stringToDate( param.get( "DemoDate" ), "yyyy-MM-dd" ) );
            if ( param.get( "DemoEnum" ) != null )
            {
                o.setDemoEnumEnumValue( new Integer( param.get( "DemoEnum" ) ) );
            }
            o.setDemoInteger( FormatUtils.stringToInteger( param.get( "DemoInteger" ) ) );
            if ( param.get( "DemoEntity" ) != null )
            {
                o.setDemoForeignEntityValue( new Integer( param.get( "DemoEntity" ) ) );
            }

            new MetaDBTemplate().callExecutor( new IMetaDBTemplateExecutor()
            {
                public void doInTransaction( IMetaDBContext ctx )
                {
                    o.save();
                }
            } );
        }
        else
        {
            //修改
            String objid = param.get( "objid" );
            final IDemoObject o = ( IDemoObject ) new MetaDBTemplate().get( IDemoObject.ENTITY_NAME, new Integer( objid ) );
            o.setDemoString( param.get( "DemoString" ) );
            o.setDemoDate( FormatUtils.stringToDate( param.get( "DemoDate" ), "yyyy-MM-dd" ) );
            if ( param.get( "DemoEnum" ) != null )
            {
                o.setDemoEnumEnumValue( new Integer( param.get( "DemoEnum" ) ) );
            }
            o.setDemoInteger( FormatUtils.stringToInteger( param.get( "DemoInteger" ) ) );
            if ( param.get( "DemoEntity" ) != null )
            {
                o.setDemoForeignEntityValue( new Integer( param.get( "DemoEntity" ) ) );
            }
            new MetaDBTemplate().callExecutor( new IMetaDBTemplateExecutor()
            {
                public void doInTransaction( IMetaDBContext ctx )
                {
                    o.save();
                }
            } );
        }
    }

    public Object callCheckBoxPlugin(final List<Map> data, Map param, HttpServletRequest request)
    {
        new MetaDBTemplate().callExecutor(new IMetaDBTemplateExecutor() {
            public void doInTransaction(IMetaDBContext ctx) {
                for (Map o : data)
                {
                    String objid = (String) o.get("objid");
                    IDemoObject demoObject = ( IDemoObject ) new MetaDBTemplate().get( IDemoObject.ENTITY_NAME, new Integer(objid));
                    demoObject.delete();
                }
            }
        });
        return true;
    }
}