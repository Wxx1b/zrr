package com.sinitek.managerdemo.demo.action;

import com.sinitek.base.metadb.*;
import com.sinitek.base.metadb.query.IMetaDBQuery;
import com.sinitek.managerdemo.demo.common.entity.IDemoObject;
import com.sinitek.spirit.webcontrol.table.*;
import com.sinitek.spirit.webcontrol.utils.QueryUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

public class DemoCurdAction implements ITableAware, ICheckBoxPluginAware
{
    public Object getResult(Map<String, String> map, HttpServletRequest request) throws Exception
    {
        Map paras = new HashMap<String, String>();
        StringBuilder wherestr=new StringBuilder(" where 1=1 ");
//        StringBuilder sql = new StringBuilder("select * from (SELECT * FROM DEMOOBJECT) where 1=1");

        //Entityname
        QueryUtils.buildEqual( "Entityname", map.get( "Entityname" ), wherestr, paras );
        //Updatetimestamp
        if(StringUtils.isNotBlank(map.get("Updatetimestamp")))
        {
            SimpleDateFormat updatetimestampTime = new SimpleDateFormat("yyyy-MM-dd");
            QueryUtils.buildEqual( "Updatetimestamp", updatetimestampTime.parse( map.get( "Updatetimestamp" ) ), wherestr, paras );
        }
        //Demodate
        if(StringUtils.isNotBlank(map.get("Demodate")))
        {
            SimpleDateFormat demodateTime = new SimpleDateFormat("yyyy-MM-dd");
            QueryUtils.buildEqual( "Demodate", demodateTime.parse( map.get( "Demodate" ) ), wherestr, paras );
        }
        //Demointeger
        if(StringUtils.isNotBlank(map.get("Demointeger")))
        {
            QueryUtils.buildEqual( "Demointeger", Integer.valueOf( map.get( "Demointeger" ) ), wherestr, paras );
        }
        //Demoforeign
        if(StringUtils.isNotBlank(map.get("Demoforeign")))
        {
            QueryUtils.buildEqual( "Demoforeign", Integer.valueOf( map.get( "Demoforeign" ) ), wherestr, paras );
        }
        //Objid
        if(StringUtils.isNotBlank(map.get("Objid")))
        {
            QueryUtils.buildEqual( "Objid", Integer.valueOf( map.get( "Objid" ) ), wherestr, paras );
        }
        //Demoenum
        if(StringUtils.isNotBlank(map.get("Demoenum")))
        {
            QueryUtils.buildEqual( "Demoenum", Integer.valueOf( map.get( "Demoenum" ) ), wherestr, paras );
        }
        //Version
        if(StringUtils.isNotBlank(map.get("Version")))
        {
            QueryUtils.buildEqual( "Version", Integer.valueOf( map.get( "Version" ) ), wherestr, paras );
        }
        //Createtimestamp
        if(StringUtils.isNotBlank(map.get("Createtimestamp")))
        {
            SimpleDateFormat createtimestampTime = new SimpleDateFormat("yyyy-MM-dd");
            QueryUtils.buildEqual( "Createtimestamp", createtimestampTime.parse( map.get( "Createtimestamp" ) ), wherestr, paras );
        }
        //Demostring
        QueryUtils.buildEqual( "Demostring", map.get( "Demostring" ), wherestr, paras );
        IMetaDBQuery result = new MetaDBTemplate().createQuery( IDemoObject.ENTITY_NAME, wherestr.toString() );
        if (!paras.isEmpty())
        {
            result.setParameters(paras);
        }
        return result;
    }

    public String setDefaultOrderBy(Map<String, String> map, HttpServletRequest request) {
        return "";
    }


    @SuppressWarnings("StatementWithEmptyBody")
    public static void addUpdate(final Map<String,String> map, HttpServletRequest request) {
        String type = map.get( "type" );
        if ( "0".equals( type ) )
        {
            //todo:添加
        }
        else
        {
            //todo:修改
        }
    }

    public Object callCheckBoxPlugin(final List<Map> data, Map param, HttpServletRequest request)
    {
        new MetaDBTemplate().callExecutor(new IMetaDBTemplateExecutor() {
            @SuppressWarnings("StatementWithEmptyBody")
            public void doInTransaction(IMetaDBContext ctx) {
                for (Map o : data)
                {
                    //todo:删除
                }
            }
        });
        return true;
    }
}