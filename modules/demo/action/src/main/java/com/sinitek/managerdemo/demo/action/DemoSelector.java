package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.selector.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 选择器范例
 */
public class DemoSelector implements IClassifiedSelectorAware,ILetterSelectorAware
{

    public List<ClassifiedObject> genClassifiedSelector(Map<String, String> options, Map params, HttpServletRequest request) throws Exception
    {
        List<ClassifiedObject> result = new ArrayList<ClassifiedObject>();
        for (int i = 0; i < 5; i++) {
            ClassifiedObject object = new ClassifiedObject(""+i,"分类"+i);
            for (int j = 0; j < 10; j++) {
                object.add(new SelectorData(i+"_" +j, "内容很长很长很长很长很长"+i+"_"+j));
            }
            result.add(object);
        }
        return result;
    }

    public List<SelectorData> genLetterSelector(Map<String, String> options, Map params, HttpServletRequest request) throws Exception {
        List<SelectorData> result = new ArrayList<SelectorData>();
        for (int i = 0; i < 50; i++) {
            result.add(new SelectorData(i+"", getChinese(i)));
        }
        return result;
    }

    private String getChinese(long seed) throws Exception {
        String str;
        int highPos, lowPos;
        seed = new Date().getTime() + seed;
        Random random = new Random(seed);
        highPos = (176 + Math.abs(random.nextInt(39)));
        lowPos = 161 + Math.abs(random.nextInt(93));
        byte[] b = new byte[2];
        b[0] = (new Integer(highPos)).byteValue();
        b[1] = (new Integer(lowPos)).byteValue();
        str = new String(b, "GB2312");
        return str;
    }
}
