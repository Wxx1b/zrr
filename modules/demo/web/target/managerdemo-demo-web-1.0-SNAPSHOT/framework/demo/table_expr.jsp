<%@ page import="org.springframework.web.util.HtmlUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/head.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>表格控件</title>
    <%@ include file="../include/innerHead.jsp" %>
    <%@ include file="demoHead.html" %>
    <style type="text/css">
        .list li
        {
            padding-bottom:10px;
        }
    </style>
</head>
<body>
<!-- 主要内容 -->
<div class="ui-state-highlight" style="padding:0.5em"><b>&nbsp;表格控件:表达式 - ui:table/ui:col</b></div>
<layout:tabs>
<layout:tab title="范例">
<%session.setAttribute("sessionKey","sessionValue");%>
<ui:table id="testTable" actionClass="com.sinitek.spirit.webcontrol.demo.DemoTableAction" pageSize="10">
    <ui:col property="DemoString" title="修改字符串">
        demostring + "~~~~延长"
    </ui:col>
    <ui:col title="判断">
        demostring.indexOf("你好啊")>-1?"命中":"未命中"
    </ui:col>
    <ui:col title="超链接">
        "<a href='#' onclick=alert('ok')>"+demostring+"</a>"
    </ui:col>
    <ui:col title="调静态方法">
        @org.apache.commons.lang3.StringUtils@reverse(demostring)
    </ui:col>
    <ui:col title="调普通方法">
        new com.sinitek.spirit.webcontrol.common.CommonAction().getNowDate()
    </ui:col>
    <ui:col title="获取Session值">
        session.getAttribute("sessionKey")
    </ui:col>
    <ui:colNumber property="DemoInteger" title="公式" isMoney="true" afterText="(元)">
        demointeger/100 - 1000
    </ui:colNumber>
</ui:table>
补充：ognl表达式目前可使用session，request，rowNum(行号),colNum(列号),result(所有结果集map)，所以demostring可替代为result.demostring
<layout:VSpacing height="20px"/>

    <layout:fieldSet title="源码" collapsible="true" collapsed="true">
    <pre name="code" class="html">
<%out.print( HtmlUtils.htmlEscape("< %session.setAttribute(\"sessionKey\",\"sessionValue\");% >\n" +
        "<ui:table id=\"testTable\" actionClass=\"com.sinitek.spirit.webcontrol.demo.DemoTableAction\" pageSize=\"10\">\n" +
        "    <ui:col property=\"DemoString\" title=\"修改字符串\">\n" +
        "        demostring + \"~~~~延长\"\n" +
        "    </ui:col>\n" +
        "    <ui:col title=\"判断\">\n" +
        "        demostring.indexOf(\"你好啊\")>-1?\"命中\":\"未命中\"\n" +
        "    </ui:col>\n" +
        "    <ui:col title=\"超链接\">\n" +
        "        \"<a href='#' onclick=alert('ok')>\"+demostring+\"</a>\"\n" +
        "    </ui:col>\n" +
        "    <ui:col title=\"调静态方法\">\n" +
        "        @org.apache.commons.lang3.StringUtils@reverse(demostring)\n" +
        "    </ui:col>\n" +
        "    <ui:col title=\"调普通方法\">\n" +
        "        new com.sinitek.spirit.webcontrol.common.CommonAction().getNowDate()\n" +
        "    </ui:col>\n" +
        "    <ui:col title=\"获取Session值\">\n" +
        "        session.getAttribute(\"sessionKey\")\n" +
        "    </ui:col>\n" +
        "    <ui:colNumber property=\"DemoInteger\" title=\"公式\" isMoney=\"true\" afterText=\"(元)\">\n" +
        "        demointeger/100 - 1000\n" +
        "    </ui:colNumber>\n" +
        "</ui:table>"));%>
    </pre>
    <pre name="code" class="java">
<%out.print( HtmlUtils.htmlEscape("public class DemoTableAction implements ITableAware{\n" +
"    public Object getResult(Map<String, String> map, HttpServletRequest request) throws Exception {\n" +
"        StringBuilder sql = new StringBuilder(\"select t.*,CAST(t.demodate AS TIMESTAMP) as demoTime from DemoObject t where 1 = 1\");\n" +
"        return new MetaDBTemplate().createSqlQuery( sql.toString());\n" +
"    }\n" +
"\n" +
"    public String setDefaultOrderBy(Map<String, String> map, HttpServletRequest request) {\n" +
"        return \"\";\n" +
"    }\n" +
"    \n" +
"    public static String testCustCol(Map data)\n" +
"    {\n" +
"        return \"哈哈\";\n" +
"    }\n" +
"}"));%>
    </pre>
    </layout:fieldSet>
</layout:tab>
<layout:tab title="Table参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_component.jsp" %>
    <%@ include file="params/param_table.jsp" %>
</layout:tab>
<layout:tab title="Col参数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="params/param_col.jsp" %>
</layout:tab>
<layout:tab title="事件">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="event/event_component.jsp" %>
    <%@ include file="event/event_table.jsp" %>
</layout:tab>
<layout:tab title="函数">
    <font color="red">带*表示功能尚未实现</font>
    <%@ include file="function/func_component.jsp" %>
    <%@ include file="function/func_table.jsp" %>
</layout:tab>
<layout:tab title="表达式文档">
  <pre>
      Ognl表达式简介

      OGNL是Object Graph Navigation Language的缩写，与JSP，JSF相比，OGNL是一种功能非常强大的针对Java的表达式语言（EL），它可用来读取和更新Java对象的属性。
      OGNL可以用在以下方面：
      - 用做数据绑定语言用来绑定GUI元素（textfield, combobox等）到模型对象
      - 用做数据源语言用来映射数据库表到表模型对象
      - 用做数据绑定语言用来绑定web组件到数据模型
      - 提供类似Jakarta Commons BeanUtils所提供的功能（读取Java对象的属性）
      OGNL表达式语法：
      Java标准类型：
      bool类型：true，false
      int类型：10, 0xABCD等
      long类型：100L
      float类型：1.0, 0.5F等
      double类型：0.01D
      char类型：'A', '\uFFFF'等
      字符串类型：’Hello World!’
      null

      OGNL独自类型：
      例：10.01B，相当于java.math.BigDecimal
      例：100000H，相当于java.math.BigInteger

      OGNL表达式中能使用的操作符号：
      OGNL表达式中能使用的操作符基本跟Java里的操作符一样，除了能使用 +, -, *, /, ++, --, ==, !=, = 等操作符之外，还能使用 mod, in, not in等

      变量的引用：
      使用方法：#变量名
      例：#this, #user.name

      对静态方法或变量的访问：
      @mypkg.MyClass@myVar
      @mypkg.MyClass@myMethod()

      读取变量值：
      例：user.address.countryName

      方法调用：
      例：user.getName()

      对象的创建：
      new java.net.URL("http://localhost/")

      List表达式例：
      {"green", "red", "blue"}

      Map表达式例：
      #@{"key1" : "value1", "key2" : "value2", "key3" : "value3"}
      对map引用，例：map.key1

      OGNL特性：
      1，一个OGNL	表达式的基本组成是：navigation chain。组成如下：
          Properity name
          Method calls
          Array Indices
          如：name.toCharArray()[0].numericValue.toString()
          name.toCharArray()转化为数组;
          numericValue相当于Character类的getNumericValue()方法:static int getNumericValue(char ch);

      2，简化JavaBeans的get/set机制
          如：public Object getAttribute(String name)
              public void setAttribute(String name, Object value)
          简化为：session.attribute[“foo”]

      3，OGNL有一个简化变量机制（在变量前加符号#），所有OGNL变量在整个表达式里是全局的。
          如：#var
              #var = 99
              listeners.size().( #this > 100 ? 2 * #this : 20 + #this ) 调用listeners的size()并与100比较。

      4，chain subexpressions
          如：headline.parent.(ensureLoaded(), name)
              headline.parent<-root object
              ensureLoaded()被root object调用，然后set/get name property。

      5，Maps
          可以这样创建一个Map：
          #@{“foo”: “foo value”, “bar”: “bar value” }
          #@java.util.LinkedHashMap@{“foo”: “foo value”, “bar”: “bar value” }

      6，Projecting Across Collections
          从一个Collection中的每一个元素里提取或调用相同的方法或property，然后将结果储存为一个新的collection，称为projection。
          Listeners.{delegate} 返回一个List，这个List是listeners中所有delegate的集合。
          Objects.{#this instanceof String ? #this : #this.toString} 创建一个新的List，并将Object List中所有元素转换为String,存入新的List。

      7，检查List的第一和最后一个元素。
          Listeners.{?ture}[0] 这样可以检测，但是如果是一个空List，就会发生ArrayIndexOutOfBoundsException。为防止这种情况，可以用下面方式检测第一个和最后一个元素：
          Objects.{^#this instanceof String} 第一个元素
          Objects.{$#this instanceof String} 最后一个元素

      8，调用静态方法
          @Class@method(args)
          如果Class不指明，默认为java.lang.Math
          也可以用实例化的方式来调用静态方法。
          同样，调用静态成员变量的方法为：@Class@field

      9，#fact(30H) <-注意与#fact.(30H)的区别。
          如果一个OGNL表达式在括号前没有逗号，那么OGNL会把第一表达式的结果作为另一个表达式来赋值，而括号中表达式的结果会作为root object指向那个表达式。
          如：#fact(30H) <- 查找fact 变量，将这个变量解析为一个OGNL表达式，使用30H作为该表达式的root object。
          fact(30H) <-令人混淆的用法，OGNL可能会将其作为一个方法调用。
          (fact)(30H) <-调用fact方法。

      10，虚拟Lambda表达式（Pseudo-Lambda Expression）
          OGNL有一个简化的Lambda表达式句法，能够让你写一些简单功能。需要注意的是，所有OGNL变量是全局范围的。
          如：#fact=:[#this<=1 ? 1 : #this*#fact(#this-1)],#fact(30H)
              这是一个OGNL表达式，声明一个递归功能函数，然后调用它。[]中的是Lambda表达式， #this变量指向的是初始化30H的表达式。OGNL将Lambda表达式作为常量来处理。Lambda表达式的值是一个OGNL使用的AST。

      11， 虚拟 Properties集合（Pseudo-Properties）
          OGNL将集合中的一些特殊Properties变为可利用，因为集合并不遵循JavaBean模式的命名规则。
      Collection	Special Properties
      Collection (被Map,List,Set继承)	Size
      isEmpty
      List	iterator
      Map	keys
      values
      注意：这些properties附加size 和 isEmpty，不同于索引形式访问Maps， 如someMap[“size”]从Map中获得 “size”key，而someMap.size得到Map的大小
      Set	iterator
      Iterater	naxt
      hasNext
      Enumeration	next
      hasNext
      nextElemet
      hasMoreElement

      12，Operators不同于Java
          OGNL operator伪造于JAVA，并有相似的工作机制，下面是与JAVA不同的地方。
      1）	comma(, )或序列Operator，来源于C, 逗号被用来分隔两个表达式，第二个表达式的值是这个comma表达式的值。
      如：ensureLoaded(), name
              调用ensureLoaded()方法，然后get/set name property
          2) 用 {} 来构造List
              如：{null, true, false }
          3) in operator (或 not in , in的相反)，这是用来检测某个值是否在集合中。
              如：name in { null, “Untitled “ } || name

      13，getting value 与 setting value。
          并不是所有能够get的值都可以set。
          如：names[0].location   <-这是一个set表达式。
      names[0].length+1  <-这个表达式不能set，因为他不能解析为一个object，而仅仅是一个是单的计算。

      14，将Object强制转换为各种类Tpye。
      1）	转换Objects为Boolean
      ?	如果Object是一个Boolean，获得值并返回；
      ?	如果Object是一个Number，它的双精度浮点数将与 0 比较，非 0 处理为false， 0处理为ture；
      ?	如果Object是Character，仅当其值为非0时为ture；
      ?	其它的Object，仅当其值为非0时为ture；
      2）	转换Object为Numbers
      数字运算符试图将其参数处理为numbers。基本的原始类型封装类（Integer, Double等，包括被处理为Integer的Character和Boolean），和java.math包的 “big” numeric classes（BigInteger和BigDecimal），被认可的特殊数字类型。某个类的一个对象，OGNL解析这个对象的string值为一个number。
      数字运算符通过两个参数并使用下面的算法，以决定运算结果的转换类型。如果结果超出给定类型，那么这个类型的实际结果范围可能很广。
      ?	如果两个参数都是同一个类型，那么结果将尽可能为同一个类型。
      ?	如果其中一个参数不是认可的数字类型（Float, Double,或BigDecimal），则结果会是两个参数中的最大范围类型。
      ?	如果两个参数是real number的近似值 (Float, Double, 或BigDecimal)，则结果为两个参数中的最大范围类型。
      ?	如果两个参数都是integers (Boolean, Byte, Character, Short, Integers, Long 或 BigInteger )，则结果为两个参数中的最大范围类型。
      ?	如果一个参数为real type 而另一个参数为integer type， 结果将会是real type，如果integer小于 “int”，结果将会是BigDecimal，如果integer是BigInteger，或者大于real type和Double。
      3）	转换Object 为Integers
      运算符仅操作integers，比如位操作符，将其参数处理为numbers, 除了BigDecimals和BigIntegers被处理为BigIntegers，其它所有的numbers被处理为Longs。对于BigInteger情况，处理结果仍然保持为Biginteger，对于Long情况，结果被处理为与参数相同的类型。
      4）	转换Objects为Collections
      projection和selection operators（ e1.{e2}和e1.{?e2} ）,和 in 运算符，都将它们的其中一个参数处理为一个collection并遍历。根据参数的不同，有不同的处理方式。
      ?	Java arrays从头至尾遍历。
      ?	Java.util.Colleciton的成员通过遍历它们的iterations来实现遍历。
      ?	Java.util.Map的成员通过遍历它们的iterators越过他们的value来实现遍历。
      ?	java.util.Iterator和java.util.Enumeration的成员通过iterate它们来实现遍历。
      ?	java.lang.Number的成员遍历的方式为：从0开始，返回的integers小于给予的number。
      所有其它objects被处理为单独的collections，包括它们自己。

      OGNL官方首页：
      http://www.ognl.org/
  </pre>

</layout:tab>
</layout:tabs>
</body>
</html>