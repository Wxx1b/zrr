package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.autocomplete.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 自动填充栏范例
 */
public class DemoAutoComplete implements IAutoCompleteAware
{
    public List<AutoCompleteData> match(String inputValue, Map<String, String> options, Map params, HttpServletRequest request)
    {
        List<AutoCompleteData> result = new ArrayList<AutoCompleteData>();
        for(int i = 0; i < 10; i++)
        {
            AutoCompleteData data = new AutoCompleteData(inputValue+i,"内容"+inputValue+i,"子内容");
            Map<String ,Object> orgDate = new HashMap<String ,Object>();
            orgDate.put("aaa","哈哈哈");
            data.setOrgData(orgDate);
            result.add(data);
        }
        return result;
    }
}
