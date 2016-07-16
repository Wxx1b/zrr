package com.sinitek.managerdemo.demo.action;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 表单提交范例
 */
public class DemoFormAction{
    public static String test(Map<String,String> param, HttpServletRequest request)
    {
        String t1 = param.get("t1");
        return "提交了t1:"+t1;
    }

    public static Map init(Map<String,String> param, HttpServletRequest request)
    {
        Map result = new HashMap();

        //自造数据
        String objid = param.get("objid");
        if("1111".equals(objid))
        {
            result.put("demostring","获得成功");
        }
        return result;
    }
}