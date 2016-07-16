package com.sinitek.managerdemo.demo.action;

import com.sinitek.base.metadb.*;
import net.sf.json.*;
import net.sf.json.processors.JsonValueProcessor;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Ajax调用范例
 */
public class DemoDwr
{
    public String test( Map<String, String> param, HttpServletRequest request )
    {
        return "Hello World";
    }

    /**
     * 根据objid查询demo
     * @param param
     * @param request
     * @return
     */
    public String getResult( Map<String, String> param, HttpServletRequest request )
    {
        String objid=param.get( "objid" );
        if(StringUtils.isNotBlank( objid ))
        {
            Map<String,Object> p=new HashMap<String,Object>();
            p.put( "objid",Integer.parseInt( objid ) );
            List<IMetaObject> results=new MetaDBTemplate().query( "DEMOOBJECT", "objid=:objid",p);
            if(results!=null&&results.size()==1)
            {
                JsonConfig jsonConfig = new JsonConfig();
                JsonValueProcessor jc=new JsonValueProcessor()
                {
                    private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                    public Object processArrayValue( Object o, JsonConfig jsonConfig )
                    {
                        return process(o);
                    }

                    public Object processObjectValue( String s, Object o, JsonConfig jsonConfig )
                    {
                        return process(o);
                    }
                    private Object process(Object value) {
                        try {
                            if (value!=null && (value instanceof Date || value instanceof Timestamp)) {
                                return sdf.format(value);
                            }
                            return value == null ? "" : value.toString();
                        } catch (Exception e) {
                            return "";
                        }

                    }
                };
//                jsonConfig.registerJsonValueProcessor( Date.class, jc );
                jsonConfig.registerJsonValueProcessor( Timestamp.class, jc );
                String jsonstr=JSONObject.fromObject( results.get( 0 ),jsonConfig ).toString();
                return jsonstr;
            }
            else return null;
        }
        else
            return null;
    }
}
