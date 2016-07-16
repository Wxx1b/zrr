package com.sinitek.managerdemo.sirmdemo.actions;

import com.sinitek.base.metadb.*;
import com.sinitek.base.metadb.query.IMetaDBQuery;
import com.sinitek.managerdemo.sirmdemo.common.entity.*;
import com.sinitek.managerframework.base.action.SirmAction;
import com.sinitek.spirit.webcontrol.table.*;
import com.sinitek.spirit.webcontrol.utils.*;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.text.*;
import java.util.*;
import java.util.Date;


/**
 * 增删查改范例
 */
public class SirmdemoAction extends SirmAction implements ITableAware, ICheckBoxPluginAware, ITableBatch
{

    public Object getResult( Map<String, String> map, HttpServletRequest request ) throws Exception
    {
        Map<String, String> paras = new HashMap<String, String>();
        StringBuilder sql = new StringBuilder( "1 = 1" );

        QueryUtils.buildLike( "productid", map.get( "productid" ), sql, paras );
        QueryUtils.buildLike( "productname", map.get( "productname" ), sql, paras );
        QueryUtils.buildLike( "category", map.get( "category" ), sql, paras );

        IMetaDBQuery query = new MetaDBTemplate().createQuery( "SIRMDEMO", sql.toString() );
        if ( !paras.isEmpty() )
        {
            query.setParameters( paras );
        }
        return query;
    }

    /**
     * 根据objid查询结果
     *
     * @param
     * @param
     * @return
     */
    public Object getResultByObjid( Map<String, String> map, HttpServletRequest request )
    {
    String objid =map.get( "objid" );
    ISirmdemo demo = ( ISirmdemo ) new MetaDBTemplate().get( ISirmdemo.ENTITY_NAME, new Integer( objid ) );
    return demo;
}


    public String setDefaultOrderBy( Map<String, String> map, HttpServletRequest request )
    {
        return "";
    }


    public static void addUpdate( Map<String, String> param, HttpServletRequest request ) throws Exception
    {
        String type = param.get( "type" );
        if ( "0".equals( type ) )
        {
            //添加
            final ISirmdemo o = new SirmdemoImpl();
            //根据当前时间自动生成产品编号 产品编号唯一
            String productid = new SimpleDateFormat( "yyyyMMddHHmmss" ).format( new Date() );
            o.setPRODUCTID( productid + "" + new Random().nextInt( 10 ) );
            o.setPRODUCTNAME( param.get( "productname" ) );
            o.setQUANTITY( FormatUtils.stringToInteger( param.get( "quantity" ) ) );
            o.setCATEGORY( FormatUtils.stringToInteger( param.get( "categoryEnum" ) ) );
            if ( param.get( "productprice" ) != null && !"".equals( param.get( "productprice" ) ) )
            {
                o.setPRODUCTPRICE( Double.parseDouble( param.get( "productprice" ) ) );

            }

            o.setORIGIN( param.get( "origin" ) );
            o.setPRODUCTDATE( param.get( "productdate" ) );
            o.setDESPERATION( param.get( "desperation" ).replaceAll( "< ","<" ).replaceAll( "/ >","/>" ) );

            new MetaDBTemplate().callExecutor( new IMetaDBTemplateExecutor()
            {
                public void doInTransaction( IMetaDBContext ctx )
                {
                    o.save();
                }
            } );
        } else
        {
            //修改
            String objid = param.get( "objid" );
            final ISirmdemo o = ( ISirmdemo ) new MetaDBTemplate().get( ISirmdemo.ENTITY_NAME, new Integer( objid ) );
            o.setPRODUCTNAME( param.get( "productname" ) );
            o.setQUANTITY( FormatUtils.stringToInteger( param.get( "quantity" ) ) );
            o.setCATEGORY( FormatUtils.stringToInteger( param.get( "categoryEnum" ) ) );
            if ( param.get( "productprice" ) != null && !"".equals( param.get( "productprice" ) ) )
            {
                o.setPRODUCTPRICE( Double.parseDouble( param.get( "productprice" ) ) );

            }

            o.setORIGIN( param.get( "origin" ) );
            o.setPRODUCTDATE( param.get( "productdate" ) );

            o.setDESPERATION( param.get( "desperation" ).replaceAll( "< ","<" ).replaceAll( "/ >","/>" ) );

            new MetaDBTemplate().callExecutor( new IMetaDBTemplateExecutor()
            {
                public void doInTransaction( IMetaDBContext ctx )
                {
                    o.save();
                }
            } );
        }
    }

    public Object callCheckBoxPlugin( final List<Map> data, Map param, HttpServletRequest request )
    {
        new MetaDBTemplate().callExecutor( new IMetaDBTemplateExecutor()
        {
            public void doInTransaction( IMetaDBContext ctx )
            {
                for ( Map o : data )
                {
                    String objid = ( String ) o.get( "objid" );
                    ISirmdemo demo = ( ISirmdemo ) new MetaDBTemplate().get( ISirmdemo.ENTITY_NAME, new Integer( objid ) );
                    demo.delete();
                }
            }
        } );
        return true;
    }

    /**
     * 将查询出来的结果转换
     *
     * @param list
     * @param map
     * @param httpServletRequest
     * @return
     * @throws Exception
     */
    @Override
    public List tableBatch( List list, Map map, HttpServletRequest httpServletRequest ) throws Exception
    {
        for ( Object o : list )
        {

            Map<String, Object> resultMap = ( Map<String, Object> ) o;
            StringBuffer productdate = new StringBuffer( ( String ) resultMap.get( "productdate" ) );
            if( StringUtils.isNotBlank( productdate.toString() ))
            {
                productdate.replace( 4, 5, "年" );
                productdate.replace( 7, 8, "月" );
                productdate.replace( 10, 11, "日" );
                resultMap.put( "chineseDate", productdate );
            }
        }

        return list;

    }
}