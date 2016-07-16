package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.interact.InteractiveMultiSelectAware;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 多选联动范例
 */
public class DemoMultiSelectInteractAction implements InteractiveMultiSelectAware
{
    public Map<String,String> getData(String[] keys, HttpServletRequest request) {
        Map<String,String> map = new HashMap<String,String>();
        for (String key : keys)
        {
            for (int i = 0; i < 10; i++)
            {
                map.put(key + "_sub" + i, key + "_val" + i);
            }
        }
        return map;
    }
}