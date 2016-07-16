package com.sinitek.managerdemo.demo.action;

import com.sinitek.spirit.webcontrol.chart.IChartAware;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 图表控件范例
 */
public class DemoChart implements IChartAware
{
    public Object getChartResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Object result = null;
        if("line".equals(options.get("name")))
            result = getLineResult(options,params,request);
        else if("area".equals(options.get("name")))
            result = getAreaResult(options,params,request);
        else if("area_percent".equals(options.get("name")))
            result = getAreaPercentResult(options,params,request);
        else if("bar".equals(options.get("name")))
            result = getBarResult(options,params,request);
        else if("column".equals(options.get("name")))
            result = getColumnResult(options,params,request);
        else if("column_rotation".equals(options.get("name")))
            result = getColumnRotationResult(options,params,request);
        else if("pie".equals(options.get("name")))
            result = getPieResult(options,params,request);
        else if("pie_donut".equals(options.get("name")))
            result = getPieDonutResult(options,params,request);
        else if("line_icon".equals(options.get("name")))
            result = getLineIconResult(options, params, request);
        else if("scatter".equals(options.get("name")))
            result = getScatterResult(options, params, request);
        return result;
    }

    Object getLineResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Map result = new HashMap();
        List data = new ArrayList();

        Map map1 = new HashMap();
        map1.put("name","上海");
        map1.put("data",new Double[]{7.0, 6.9, 9.5, 14.5, 18.2, 25.5, 30.2, 32.5, 29.3, 20.3, 13.9, 9.6});

        Map map2 = new HashMap();
        map2.put("name","北京");
        map2.put("data",new Double[]{-7.0, -6.9, 3.5, 8.5, 12.2, 20.5, 28.2, 30.5, 24.3, 12.2, 4.9, 0.6});

        data.add(map1);
        data.add(map2);

        result.put("data",data);
        return result;
    }

    Object getLineIconResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Map result = new HashMap();
        List data = new ArrayList();

        Map map1 = new HashMap();
        map1.put("name","上海");
        Map sun = JSONObject.fromObject( "{y: 32.5,marker: {symbol: 'url(" + request.getContextPath() + "/framework/css/common/images/icon/sun.png)'}}" );
        map1.put("data",new Object[]{7.0, 6.9, 9.5, 14.5, 18.2, 25.5, 30.2,sun , 29.3, 20.3, 13.9, 9.6});

        Map map2 = new HashMap();
        map2.put("name","北京");
        Map snow = JSONObject.fromObject( "{y: -7.0,marker: {symbol: 'url(" + request.getContextPath() + "/framework/css/common/images/icon/snow.png)'}}" );
        map2.put("data",new Object[]{snow, -6.9, 3.5, 8.5, 12.2, 20.5, 28.2, 30.5, 24.3, 12.2, 4.9, 0.6});

        data.add(map1);
        data.add(map2);

        result.put("data",data);
        return result;
    }

    Object getAreaResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Map result = new HashMap();
        List data = new ArrayList();

        Map map1 = new HashMap();
        map1.put("name","美国");
        map1.put("data",new Integer[]{null, null, null, null, null, 6 , 11, 32, 110, 235, 369, 640,
            1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
            27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
            26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
            24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
            22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
            10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104});

        Map map2 = new HashMap();
        map2.put("name","俄罗斯");
        map2.put("data",new Integer[]{null, null, null, null, null, null, null , null , null ,null,
         5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,
         4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,
         15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,
         33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,
         35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
         21000, 20000, 19000, 18000, 18000, 17000, 16000});

        data.add(map1);
        data.add(map2);

        result.put("data",data);
        return result;
    }

    Object getAreaPercentResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Map result = new HashMap();
        List data = new ArrayList();

        Map map1 = new HashMap();
        map1.put("name","亚洲");
        map1.put("data",new Integer[]{502, 635, 809, 947, 1402, 3634, 5268});

        Map map2 = new HashMap();
        map2.put("name","非洲");
        map2.put("data",new Integer[]{106, 107, 111, 133, 221, 767, 1766});

        Map map3 = new HashMap();
        map3.put("name","欧洲");
        map3.put("data",new Integer[]{163, 203, 276, 408, 547, 729, 628});

        Map map4 = new HashMap();
        map4.put("name","美洲");
        map4.put("data",new Integer[]{18, 31, 54, 156, 339, 818, 1201});

        Map map5 = new HashMap();
        map5.put("name","大洋洲");
        map5.put("data",new Integer[]{2, 2, 2, 6, 13, 30, 46});

        data.add(map1);
        data.add(map2);
        data.add(map3);
        data.add(map4);
        data.add(map5);

        result.put("data",data);
        result.put("categories",new String[]{"1750", "1800", "1850", "1900", "1950", "1999", "2050"});
        return result;
    }

    Object getBarResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Map result = new HashMap();
        List data = new ArrayList();

        Map map1 = new HashMap();
        map1.put("name","1800年");
        map1.put("data",new Integer[]{107,31,635,203,2});

        Map map2 = new HashMap();
        map2.put("name","1900年");
        map2.put("data",new Integer[]{133,156,497,408,6});

        Map map3 = new HashMap();
        map3.put("name","2008年");
        map3.put("data",new Integer[]{973,194,4054,732,34});

        data.add(map1);
        data.add(map2);
        data.add(map3);

        result.put("data",data);
        return result;
    }

    Object getColumnResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Map result = new HashMap();
        List data = new ArrayList();

        Map map1 = new HashMap();
        map1.put("name","东京");
        map1.put("data",new Double[]{49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4});

        Map map2 = new HashMap();
        map2.put("name","纽约");
        map2.put("data",new Double[]{83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3});

        Map map3 = new HashMap();
        map3.put("name","伦敦");
        map3.put("data",new Double[]{48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2});

        data.add(map1);
        data.add(map2);
        data.add(map3);

        result.put("data",data);
        return result;
    }

    Object getColumnRotationResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Map result = new HashMap();

        result.put("data",new Double[]{49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4});
        return result;
    }

    Object getPieResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        List result = new ArrayList();

        Map map1 = new HashMap();
        map1.put("name","Firefox");
        map1.put("y",21.71);

        Map map2 = new HashMap();
        map2.put("name","IE");
        map2.put("y",54.27);

        Map map3 = new HashMap();
        map3.put("name","Safari");
        map3.put("y",7.28);

        Map map4 = new HashMap();
        map4.put("name","Opera");
        map4.put("y",3.30);

        Map map5 = new HashMap();
        map5.put("name","Others");
        map5.put("y",0.9);

        Map map6 = new HashMap();
        map6.put("name","Chrome");
        map6.put("y",12.52);

        result.add(map1);
        result.add(map2);
        result.add(map3);
        result.add(map4);
        result.add(map5);
        result.add(map6);

        return result;
    }

    Object getPieDonutResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        Map result = new HashMap();

        List result2008 = new ArrayList();

        Map map1 = new HashMap();
        map1.put("name","Firefox");
        map1.put("y",21.71);
        map1.put("color","#4572A7");

        Map map2 = new HashMap();
        map2.put("name","IE");
        map2.put("y",54.27);
        map2.put("color","#AA4643");

        Map map3 = new HashMap();
        map3.put("name","Safari");
        map3.put("y",7.28);
        map3.put("color","#89A54E");

        Map map4 = new HashMap();
        map4.put("name","Opera");
        map4.put("y",3.30);
        map4.put("color","#80699B");

        Map map5 = new HashMap();
        map5.put("name","Others");
        map5.put("y",0.9);
        map5.put("color","#3D96AE");

        Map map6 = new HashMap();
        map6.put("name","Chrome");
        map6.put("y",12.52);
        map6.put("color","#DB843D");

        result2008.add(map1);
        result2008.add(map2);
        result2008.add(map3);
        result2008.add(map4);
        result2008.add(map5);
        result2008.add(map6);

        List result2010 = new ArrayList();

        Map map7 = new HashMap();
        map7.put("name","Firefox");
        map7.put("y",31.71);
        map7.put("color","#4572A7");

        Map map8 = new HashMap();
        map8.put("name","IE");
        map8.put("y",46.27);
        map8.put("color","#AA4643");

        Map map9 = new HashMap();
        map9.put("name","Safari");
        map9.put("y",5.28);
        map9.put("color","#89A54E");

        Map map10 = new HashMap();
        map10.put("name","Opera");
        map10.put("y",0.30);
        map10.put("color","#80699B");

        Map map11 = new HashMap();
        map11.put("name","Others");
        map11.put("y",0.9);
        map11.put("color","#3D96AE");

        Map map12 = new HashMap();
        map12.put("name","Chrome");
        map12.put("y",15.52);
        map12.put("color","#DB843D");

        result2010.add(map7);
        result2010.add(map8);
        result2010.add(map9);
        result2010.add(map10);
        result2010.add(map11);
        result2010.add(map12);

        result.put("data2008",result2008);
        result.put("data2010",result2010);
        return result;
    }

    Object getScatterResult(Map<String, String> options, Map params, HttpServletRequest request)
    {
        //数据过多，仅用js做范例
        return null;
    }
}
