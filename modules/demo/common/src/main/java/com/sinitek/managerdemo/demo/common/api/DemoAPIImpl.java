/**
 * File Name:    DemoAPIImpl.java
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
package com.sinitek.managerdemo.demo.common.api;

import com.sinitek.base.metadb.query.IMetaDBQuery;
import com.sinitek.base.metadb.support.AbstractMetaDBContextSupport;
import com.sinitek.managerdemo.demo.common.entity.IDemo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hy.ao
 * Date: 2015/12/14
 * Time: 14:47
 * 文件说明：demo api 实现类
 */
public class DemoAPIImpl extends AbstractMetaDBContextSupport implements IDemoAPI
{
    @Override
    public IDemo getDemoByID( int objid )
    {
        return ( IDemo ) getMetaDBContext().get( IDemo.ENTITY_NAME, objid );
    }

    @Override
    public List<IDemo> getDemoByName( String name )
    {
        IMetaDBQuery<IDemo> query = getMetaDBContext().createQuery( IDemo.ENTITY_NAME, "name=:name" );
        query.setParameter( "name", name );

        return query.getResult();
    }
}