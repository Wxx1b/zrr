package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.interact.InteractiveSelectAware;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 单选联动范例
 */
public class DemoSelectInteractAction implements InteractiveSelectAware
{
    public Map<String,String> getData(String key, HttpServletRequest request) {
        Map<String,String> map = new LinkedHashMap <String,String>();
        for(int i = 0; i < 10; i++)
        {
            map.put(key+"_sub"+i,key+"_val"+i);
        }
        return map;
    }
}