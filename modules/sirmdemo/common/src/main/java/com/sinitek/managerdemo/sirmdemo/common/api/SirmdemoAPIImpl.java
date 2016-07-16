/**
 * File Name:    SirmdemoAPIImpl.java
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
 * History:      2016/7/9 0009 created by jie.wang
 */
package com.sinitek.managerdemo.sirmdemo.common.api;

import com.sinitek.base.metadb.query.IMetaDBQuery;
import com.sinitek.base.metadb.support.AbstractMetaDBContextSupport;
import com.sinitek.managerdemo.sirmdemo.common.entity.ISirmdemo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jie.wang
 * Date: 2016/7/9 0009
 * Time: 下午 1:50
 * 文件说明：TODO
 */
public class SirmdemoAPIImpl extends AbstractMetaDBContextSupport implements ISirmdemoAPI
{
    @Override
    public ISirmdemo getById( int objid )
    {
        return ( ISirmdemo ) getMetaDBContext().get( ISirmdemo.ENTITY_NAME,objid);
    }

    @Override
    public List<ISirmdemo> getByName( String name )
    {
        IMetaDBQuery<ISirmdemo> query =getMetaDBContext().createQuery( ISirmdemo.ENTITY_NAME,"name=:name" );
        query.setParameter( "name",name);
        return query.getResult();
    }
}