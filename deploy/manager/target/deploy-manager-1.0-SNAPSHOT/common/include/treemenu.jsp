<%--
  Created by IntelliJ IDEA.
  User: HF.fay
  Date: 14-6-24
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/commonincludes.jsp" %>
<sirm:page clazz="com.sinitek.managerframework.menu.action.TreeMenuAction" method="loadPage"></sirm:page>

<SCRIPT type="text/javascript">
<!--
var setting = {
    edit: {
        enable: true,
        showRenameBtn: false,
        showRemoveBtn: false,
        renameTitle: "重命名",

        drag: {
            isCopy: false,
            isMove: true,
            prev: true,
            inner: true,
            next: true
        }
    },
    data: {
        key: {
            title: "name",
            name: "shortname"
        },
        simpleData: {
            enable: true,
            idKey: "objid",
            pIdKey: "parentid",
            rootPId: 0
        }
    },
    callback: {
        beforeDrag: beforeDrag,
        beforeDrop: beforeDrop,
        beforeRename:beforeRename,

        onClick: openUrl,
        onRename: changeNodeName,
        onRemove: removeNode,
        onDrop: dropNode
    },
    view: {
        selectedMulti: false,
        addHoverDom: addHoverDom,
        removeHoverDom: removeHoverDom
    }
};

function addHoverDom(treeId, treeNode) {
    var aObj = $("#" + treeNode.tId + "_a");
    if ($("#deleteBtn_" + treeNode.objid).length > 0) return;
    if ($("#renameBtn_" + treeNode.objid).length > 0) return;
    var editStr = "<button type='button' class='edit' id='renameBtn_" + treeNode.objid
            + "' title='重命名' onfocus='this.blur();'></button>";
    var removeStr = "<button type='button' class='remove' id='deleteBtn_" + treeNode.objid
            + "' title='删除' onfocus='this.blur();'></button>";

    var treeObj = $.fn.zTree.getZTreeObj(treeId);
    if(treeNode.renameable) {
        aObj.append(editStr);
        var btn = $("#renameBtn_" + treeNode.objid);
        if (btn) btn.bind("click", function () {
            if (treeNode.renameable == true) {
                if ("${param.onEditButtonClick}" != "") {
                    ${param.onEditButtonClick}(treeId, treeNode);
                } else {
                    beforeEditName(treeNode);
                    treeObj.editName(treeNode);
                }
            }
        });
    }

    if(treeNode.removeable) {
        aObj.append(removeStr);
        var btn = $("#deleteBtn_" + treeNode.objid);
        if (btn) btn.bind("click", function () {
            if (treeNode.removeable == true) {
                if ("${param.onRemoveButtonClick}" != "") {
                    ${param.onRemoveButtonClick}(treeId, treeNode);
                } else {
                    stk.confirm("确定删除：" + treeNode.name + "？", function () {
                        var _parentid = treeNode.parentid;
                        var _type = treeNode.type;
                        treeObj.removeNode(treeNode, true);
                        selectNode(_parentid, _type, true);
                    });
                }
            } else {
                stk.alert("该节点不能删除");
            }
        });
    }
}

function removeHoverDom(treeId, treeNode) {
    var btn = $("#renameBtn_" + treeNode.objid);
    if(btn) btn.unbind().remove();
    var btn2 = $("#deleteBtn_" + treeNode.objid);
    if(btn2) btn2.unbind().remove();
}

function removeNode(event, treeId, treeNode) {       //删除节点后
//            stk.debug(treeNode);
    var _nodeids = new Array();
    var _queue = new Array();
    _queue.push(treeNode);
    while (_queue.length > 0) {
        var _treeObj = _queue.shift();
        if (_treeObj) {
            _nodeids.push(_treeObj.objid + ":" + _treeObj.type);
            if (_treeObj.children) {
                for (var i = 0; i < _treeObj.children.length; i++) {
                    _queue.push(_treeObj.children[i]);
                }
            }
        }
    }
    stk.call({
        className: "com.sinitek.managerframework.menu.action.TreeMenuAction",
        method: 'removeNode',
        param: {
            clazz: '${clazz}',
            nodeids: _nodeids.toString()
        },
        callBack: function (result) {
            if (result != null && result != "") {
                stk.alert(result);
            }
            refreshNodesInfo();         //删除了节点， 需要更新节点数据
        },
        exceptionHandler: function (message, e) {
            stk.error(message);
        }
    });
}

function beforeEditName(treeNode){      //修改名称时预处理，输入框换成全名
    treeNode.shortname = treeNode.name;
    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    treeObj.updateNode(treeNode);
}

function beforeRename(treeId, treeNode, newName, isCancel){    //用于捕获节点编辑名称结束（Input 失去焦点 或 按下 Enter 键）之后，更新节点名称数据之前的事件回调函数，并且根据返回值确定是否允许更改名称的操作
    if(isCancel) {

    }else{      //表示确认修改操作
        if(StringUtils.isBlank(newName)){
            stk.alert("请输入节点名称");
            return false;
        }
    }
    return true;
}

function changeNodeName(event, treeId, treeNode, isCancel) {     //修改名称
//    stk.debug(treeNode);
    if(isCancel) {      //表示取消编辑操作（按下 ESC 或 使用 cancelEditName 方法）
        treeNode.shortname = treeNode.name.length > 14 ? treeNode.name.substring(0,14) + "..." : treeNode.name;
        var treeObj = $.fn.zTree.getZTreeObj(treeId);
        treeObj.updateNode(treeNode);
    }else{      //表示确认修改操作
        stk.call({
            className: "com.sinitek.managerframework.menu.action.TreeMenuAction",
            method: 'changeNodeName',
            param: {
                clazz: '${clazz}',
                objid: treeNode.objid,
                parentid: treeNode.parentid,
                name: treeNode.shortname,
                code: treeNode.code,
                sort: treeNode.sort,
                level: treeNode.level,
                icon: treeNode.icon,
                type: treeNode.type,
                renameable: treeNode.renameable,
                removeable: treeNode.removeable,
                drag: treeNode.drag
            },
            callBack: function (result) {
                if (result != null && result != "") {
                    stk.alert(result);
                }
                reLoadTree();
                selectNode(treeNode.objid, treeNode.type);
            },
            exceptionHandler: function (message, e) {
                stk.error(message);
            }
        });
    }
}

function openUrl(event, treeId, treeNode) {      //点击节点
//    stk.debug(treeNode);
    var _url = "${rightpage}";
    _url += _url.indexOf("?") != -1 ? "&id=" : "?id=";
    if(treeNode) {
        _url += (treeNode.objid) + "&type=" + treeNode.type;
    }
    else {
        _url += 0 + "&type=" + "";
    }
    $('#_listauth_iframe').attr("src", _url);
}

function beforeDrag(treeId, treeNodes) {        //拖动前
    for (var i=0,l=treeNodes.length; i<l; i++) {
        if (treeNodes[i].drag === false) {     //如果是禁止拖动的
            return false;
        }
    }
    return true;
}

function beforeDrop(treeId, treeNodes, targetNode, moveType) {      //拖动结束前
    var _level = targetNode.level;
    if (${maxlevel != -1} &&  (moveType == "inner" ? (_level >= ${not empty maxlevel ? maxlevel : 2}): (_level > ${not empty maxlevel ? maxlevel : 2}))) {
        stk.alert("超过菜单最大层数，无法移动");
        return false;
    }
    var flag = true;
    stk.call({
        className: "com.sinitek.managerframework.menu.action.TreeMenuAction",
        method: 'checkMoveNode',
        param: {
            clazz: '${clazz}',
            movetype: moveType,
            objid: treeNodes[0].objid,
            nodeparentid: treeNodes[0].parentid,
            nodename: treeNodes[0].name,
            nodecode: treeNodes[0].code,
            nodesort: treeNodes[0].sort,
            nodelevel: treeNodes[0].level,
            nodeicon: treeNodes[0].icon,
            nodetype: treeNodes[0].type,
            renameable:treeNodes[0].renameable,
            removeable:treeNodes[0].removeable,
            drag: treeNodes[0].drag,

            targetid: targetNode.objid,
            targetparentid: targetNode.parentid,
            targetname: targetNode.name,
            targetcode: targetNode.code,
            targetsort: targetNode.sort,
            targetlevel: targetNode.level,
            targeticon: targetNode.icon,
            targettype: targetNode.type,
            targetrenameable:targetNode.renameable,
            targetremoveable:targetNode.removeable,
            targetdrag:targetNode.drag
        },
        async: false,
        callBack: function (result) {
            flag = result;
            if(result == false){
                stk.alert("不能进行该移动");
            }
        },
        exceptionHandler: function (message, e) {
            stk.error(message)
        }
    });
    return flag;
}

function dropNode(event, treeId, treeNodes, targetNode, moveType) {        //拖动结束，更新节点信息
    refreshNodesInfo();
}

var _clickInt;
$(document).ready(function () {
    reLoadTree();
//    refreshNodesInfo();         //先初始化一下各节点code，sort，level
    openUrl();

    stretch();
//    $("#queryCon").bind("input propertychange",function(event){
//        if (StringUtils.isBlank($("#queryCon").stk_text())) {
//            query();
//        }
//    });

    var _query = function(){
        query();
        if(_clickInt){
            _clickInt = window.clearInterval(_clickInt);
        }
    }
    $("#queryCon").bind("keyup",function(event){
        var key = event.keyCode;
        if(key != 8 && key != 46){      //删除键 和 退格键
            return;
        }

        if(_clickInt){
            window.clearInterval(_clickInt);
            _clickInt = setInterval(_query, 300);
        }else{
            _clickInt = setInterval(_query, 300);
        }
    });


});

function stretch() {
    stretchHeight($("#_tsetauth_"), 10);
    stretchHeight($("#_listauth_iframe"), 20);
    stretchHeight($("#treeDemoDiv"), 20);
}

var stretchHeight = function (targetobj, delta) {
    var sf = function () {
        var tableWrap = $(targetobj);
        var tableOffset = tableWrap.offset();
        var documentHeight = $(window).height();
        var tableHeight = documentHeight - tableOffset.top - (delta == undefined ? 0 : delta);
        tableWrap.height(tableHeight);
    };
    sf();
    $(window).resize(function () {
        sf();
    });
};

function query() {
    var _searchname = $("#queryCon").stk_text();

    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");

    var _queue = new Array();
    var _nodelist = treeObj.getNodes();
    for (var i = 0; i < _nodelist.length; i++) {
        _queue.push(_nodelist[i]);
    }
    var showlist1 = new Array();
    var showlist2 = new Array();
    var alllist = new Array();
    while (_queue.length > 0) {
        var _node = _queue.shift();
        if (_node) {
            alllist.push(_node);
            var _name = _node.name;
            var _pyname = CnToPy.ConvertPinyinFirst(_name).toUpperCase();
            if(_name.toUpperCase().indexOf(_searchname.toUpperCase()) != -1
                    || _pyname.indexOf(_searchname.toUpperCase()) != -1 ){
                showlist1.push(_node);
                showlist2.push(_node);
            }

            if (_node.children) {
                for (var i = 0; i < _node.children.length; i++) {
                    _queue.push(_node.children[i]);
                }
            }
        }
    }
    treeObj.hideNodes(alllist);

    var _showlist = new Array();
    while(showlist1.length > 0){    //查询父节点
        var _node = showlist1.shift();
        if(_node){
            _showlist.push(_node);
        }
        var _parentnode = _node.getParentNode();
        if(_parentnode != null){
            showlist1.push(_parentnode);
        }
    }
    while(showlist2.length > 0){    //查询子节点
        var _node = showlist2.shift();
        if(_node){
            _showlist.push(_node);
        }
        if (_node.children) {
            for (var i = 0; i < _node.children.length; i++) {
                showlist2.push(_node.children[i]);
            }
        }
    }
    treeObj.showNodes(_showlist);
}

function reLoadTree() {
    stk.call({
        className: "com.sinitek.managerframework.menu.action.TreeMenuAction",
        method: 'getNodeList',
        param: {
            rootid: '${rootid}',
            roottype: '${roottype}',
            clazz: '${clazz}'
        },
        async: false,
        callBack: function (result) {
            if (result != null && result != "") {
                if(result == '[]'){
                    $("#queryCon").stk_hide();
                    $("#unauth").show();
                }
                var zTree = $.fn.zTree.init($("#treeDemo"), setting,eval(result));
                zTree.expandAll(true);
                return;
            }
        },
        exceptionHandler: function (message, e) {
            stk.error(message)
        }
    });
    query();
}

function getNodeInfo(objid, type){
    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    var nodes = treeObj.getNodesByParam("objid", objid, null);
    var node = null;
    for(var i = 0; i < nodes.length; i++){
        var _tnode = nodes[i];
        if(_tnode.type == type){
            node = _tnode;
            break;
        }
    }
    return node;
}

function selectNode(objid, type, flag){
    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    var node = getNodeInfo(objid, type);
    if(node){
        treeObj.selectNode(node);
        if(flag == undefined || flag != false){
            openUrl("", "treeDemo", node);
        }
    }else{
        openUrl();
    }
}

function getMaxLevel(){
    return "${not empty maxlevel ? maxlevel : 2}";
}

/**
 * 修改各节点数据
 *      parentid        父节点 objid
 *      sort            同级节点的序号
 *      code            父节点 code + 自身sort
 *      level           可以直接用ztree内部 level
 */
function refreshNodesInfo() {
    var _treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    var _queue = new Array();
    var _nodes = new Array();

    var _nodelist = _treeObj.getNodes();
    for (var i = 0; i < _nodelist.length; i++) {
        _queue.push(_nodelist[i]);
    }
    while (_queue.length > 0) {
        var _treeNode = _queue.shift();
        if (_treeNode) {
            var _parentNode = _treeNode.getParentNode();
            var _oldparentid = _treeNode.preParentId;
            var _oldparenttype = _treeNode.parenttype;
            var _oldsort = _treeNode.sort;
            var _oldcode = _treeNode.code;     //
            _treeNode.parentid = (_parentNode) ? _parentNode.objid : '${rootid}';
            _treeNode.preParentId = _treeNode.parentid;
            _treeNode.parenttype = (_parentNode) ? _parentNode.type : '${roottype}';
            _treeNode.sort = _treeObj.getNodeIndex(_treeNode);
            _treeNode.code = ((_parentNode) ? _parentNode.code : "") + formartcode(_treeNode.sort, 2);

            var _newparentid = _treeNode.parentid;
            var _newparenttype = _treeNode.parenttype;
            var _newsort = _treeNode.sort;
            var _newcode = _treeNode.code;

            if (_treeNode.children) {
                for (var i = 0; i < _treeNode.children.length; i++) {
                    _queue.push(_treeNode.children[i]);
                }
            }

            if(_oldparentid != _newparentid || _oldparenttype != _newparenttype || _oldsort != _newsort)
            {   // 这里还是把所有节点都传过去吧
                var _nodeinfo = {};
                _nodeinfo["objid"] = _treeNode.objid;
                _nodeinfo["parentid"] = _treeNode.parentid;
                _nodeinfo["name"] = _treeNode.name;
                _nodeinfo["code"] = _treeNode.code;
                _nodeinfo["sort"] = _treeNode.sort;
                _nodeinfo["level"] = _treeNode.level;
                _nodeinfo["icon"] = _treeNode.icon;
                _nodeinfo["type"] = _treeNode.type;
                _nodeinfo["renameable"] = _treeNode.renameable;
                _nodeinfo["removeable"] = _treeNode.removeable;
                _nodeinfo["drag"] = _treeNode.drag;
                _nodes.push(_nodeinfo);
            }
        }
    }

    stk.call({
        className: "com.sinitek.managerframework.menu.action.TreeMenuAction",
        method: 'saveNodeList',
        param: {
            nodelist: JSON.stringify(_nodes),
            clazz: '${clazz}'
        },
        callBack: function (result) {
            if (result != null && result != "") {
                stk.alert(result);
            }
        },
        exceptionHandler: function (message, e) {
            stk.error(message);
        }
    });
}

function formartcode(sort, n) {
    var len = sort.toString().length;
    while (len < n) {
        sort = "0" + sort;
        len++;
    }
    return sort;
}


function getParam(){
    return {clazz:'${clazz}', rootid:'${rootid}', roottype:'${roottype}'};
}
//授权按钮事件
function gotoAuthorizeWindow(){
    sirm.openTab(sirm.jsurl("/org/manageauthorize.jsp"), "授权管理");
}
//-->
</SCRIPT>

<ui:form>
    <table id="_tsetauth_" width="100%">
        <tr>
            <td width="250px" valign="top">
                <div style="padding-top: 5px; padding-left: 5px;">
                    <div class="search-params-bar" id="unauth" style="display:none">
                        <p style="border:#FF8080 solid 1px;background-color:#FFF2F2;padding-left:20px;margin-left:30px;width:160px;font-size: 12px">
                            您没有管理或授权权限！
                        </p>
                    </div>
                    <ui:autoComplete id="queryCon" clazz="com.sinitek.managerframework.menu.action.TreeMenuAction"
                                     showOnFocus="false" jsParam="getParam"
                                     interactFunction="query" emptyText="请输入名称或拼音首字母" width="170px"
                                     selectWidth="180px">
                        <event:oniconclick>
                            query();
                        </event:oniconclick>
                    </ui:autoComplete>
                    <c:if test="${hasGrantAuth}">
                    <ui:button text="授权" icon="ui-icon-key">
                        <event:onclick>
                            gotoAuthorizeWindow();
                        </event:onclick>
                    </ui:button>
                    </c:if>
                    <div id="treeDemoDiv" style="width: 250px; overflow: auto;">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>
                </div>
            </td>
            <td width="2" class="split-bar frbar-st1"></td>
            <td valign="top">
                <div>
                    <iframe width="100%" id="_listauth_iframe" src="" scrolling="auto"></iframe>
                </div>
            </td>
        </tr>
    </table>
</ui:form>

