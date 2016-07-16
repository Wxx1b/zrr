/**
 * lib extends and fix
 * @author 张立鑫
 */
(function (w, u) {
    $('a[href="#"],[href="##"]').click(function () {
        return false;
    });
    if (w.sirm) {
        return;
    }
    var head = document.getElementsByTagName('head')[0];
    var replaceClassToPath = function (cls, rootPath) {
        rootPath = rootPath || '/';
        return (rootPath.lastIndexOf('/') == rootPath.length - 1 ? '' : '/') + cls.replace('.', '/') + '.js';
    };
    w.sirm = $.extend({}, {
        removeElementsFromHtml : function (html, elements){
            var result = html;
            if (elements != null) {
                var container = document.createElement("div");
                container.innerHTML = html;
                for (var i = 0; i < elements.length; i++) {
                    container.innerHTML = result;
                    var eles = container.getElementsByTagName(elements[i]);
                    //alert(eles.length);
                    for (var j = eles.length - 1; j >= 0; j--) {
                        var e = eles[j];
                        e.parentNode.removeChild(e);
                    }
                    //alert(container.innerHTML);
                    result = container.innerHTML;
                }
                container = null;
            }
            return result;
        },

        removeScriptElementsFromHtml : function(html) {
            var container = document.createElement("div");
            container.innerHTML = html;

            var eles = container.getElementsByTagName("script");
            for (var j = eles.length - 1; j >= 0; j--) {
                var e = eles[j];
                if (e.src != null && e.src.length > 0) {
                    e.parentNode.removeChild(e);
                }
            }
            var result = container.innerHTML;
            container = null;

            return result;
        },

        isArray: function (arr) {
            return Object.prototype.toString.call(arr) == '[object Array]';
        },
        isString: function (str) {
            return typeof str == 'string';
        },
        isObject: function (obj) {
            return obj && typeof obj == 'object' && !sirm.isArray(obj);
        },
        isNumber: function (num) {
            return (num instanceof Number || typeof num == "number");
        },
        /**
         * get a frame head node
         * @param frame frame , if frame is a null , then frame is current frame
         */
        getHeadNode: function (frame) {
            if (frame) {
                if (typeof frame == 'string') {
                    frame = w.document.getElementById(frame);
                }
                return frame.contentWindow.document.getElementsByTagName('head')[0];
            }
            return head;
        },
        /**
         * get a frame head node as jq object
         * @param frame switch frame to append , if frame is a null , then frame is current frame
         */
        getHead: function () {
            return $(sirm.getHeadNode.apply(this, arguments));
        },
        /**
         * replace style sheet by jq selector
         * @param selector jq selector
         * @param href     link.href
         * @param scope    switch frame to append
         */
        replaceStyleSheet: function (selector, href, scope) {
            try {
                var frame;
                if (scope == 'string') {
                    frame = $(scope);
                } else if (scope.$ || scope.jQuery) {
                    frame = scope.jQuery;
                }
                if (frame && frame.find) {
                    var links = frame.find(selector);
                    for (var i = 0, link; (link = links[i]); i++) {
                        link.href = href;
                    }
                }
            } catch (e) {
            }
        },
        /***
         * create link tag and attribute rel="stylesheet" and href=your css file path
         * @param href your css file path
         * @param id    style tag only one id
         * @param frame switch frame to append , if frame is a null , then frame is current frame
         */
        createStyleSheet: function (href, id, frame) {
            var doc = (frame || w).document,
                    link = doc.createElement('link');
            link.setAttribute('rel', 'stylesheet');
            link.href = href;
            if (id) {
                link.id = id;
            }
            sirm.getHeadNode(frame).appendChild(link);
            return link;
        },
        /***
         * create style tag and fill css style
         * @param content css style .class{..} div{..}
         * @param id      style tag only one id
         * @param frame switch frame to append , if frame is a null , then frame is current frame
         */
        createStyle: function (content, id, frame) {
            var doc = (frame || w).document,
                    style = doc.createElement('style');
            if (typeof id == 'string') {
                style.id = id;
            }
            sirm.getHeadNode(frame).appendChild(style);
            if (style.styleSheet) {   //For IE
                style.styleSheet.cssText = content;
            } else {
                var css_text = doc.createTextNode(content);
                style.appendChild(css_text);
            }
            return style;
        },
        /**
         * 根据name获取cookie
         * @param name cookie名称
         */
        getCookie: function (name) {
            var arg = name + "=";
            var alen = arg.length;
            var clen = document.cookie.length;
            var i = 0;
            while (i < clen) {
                var j = i + alen;
                if (document.cookie.substring(i, j) == arg)
                    return sirm.getCookieVal(j);
                i = document.cookie.indexOf(" ", i) + 1;
                if (i == 0) break;
            }
            return null;
        },
        /**
         * 设置cookie
         * @param name
         * @param value
         * @param expires
         * @param path
         */
        setCookie: function (name, value, expires, path) {
            document.cookie = name + "=" + escape(value) +
                    ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
                    ((path == null) ? "" : ("; path=" + path));
        },

        /**
         * 删除cookie
         * @param name
         */
        deleteCookie: function (name) {
            var exp = new Date();
            exp.setTime(exp.getTime() - 1);
            var cval = sirm.getCookie(name);
            document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
        },

        getCookieVal: function (offset) {
            var endstr = document.cookie.indexOf(";", offset);
            if (endstr == -1)
                endstr = document.cookie.length;
            return unescape(document.cookie.substring(offset, endstr));
        },
        /**
         * get url parameter.can't get post method of parameter
         * @param property  parameter name
         */
        getParameter: function (property) {
            var re = new RegExp(property + "=([^\&]*)", "i"),
                    a = re.exec(w.location.search);
            if (a == null) return null;
            return a[1];
        },
        /**
         * get server context root path
         */
        getRootPath: function () {
            var curWwwPath = w.document.location.href,
                    pathName = w.document.location.pathname,
                    pos = curWwwPath.indexOf(pathName),
                    localhostPath = curWwwPath.substring(0, pos),
                    projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
            return (localhostPath + projectName);
        },
        utils: {
            equals: function (obj1, obj2) {
                if (obj1 == obj2)return true;
                if (typeof obj1 == 'string') {
                    return false;
                } else if (typeof obj1 == 'function') {
                    if (obj1.toString().equals(obj2.toString())) {
                        return true;
                    }
                    return false;
                }
                var length = 0,
                        length1 = 0;
                for (var ele in obj1) length++;
                for (var ele in obj2) length1++;
                if (length != length1) return false;
                if (obj1.constructor == obj2.constructor) {
                    for (var ele in obj1) {
                        if (!sirm.utils.equals(obj1[ele], obj2[ele])) {
                            return false;
                        }
                    }
                    return true;
                }
                return false;
            }
        },
        define: function (ns, properties) {
            sirm.ns(ns);
            ns = ns.split('.');
            var ens = w;
            for (var i = 0; i < ns.length - 1; i++) {
                ens = ens[ns[i]];
            }

            ns = ns[ns.length - 1];

            if (sirm.isObject(properties)) {
                for (var n in properties) {
                    ens[ns][n] = properties[n];
                }
            } else if (typeof properties == 'function') {
                ens[ns] = properties;
            }
            return properties;
        },
        namespace: function (ns) {
            ns = ns.split('.');
            var ens = w;
            for (var i = 0; i < ns.length; i++) {
                if (!ens[ns[i]]) {
                    ens[ns[i]] = {};
                }
                ens = ens[ns[i]];
            }
            return ens;
        },
        getClass: function (name) {
            name = name.split('.');
            var ens = w;
            for (var i = 0; i < name.length; i++) {
                if (!ens[name[i]]) {
                    return u;
                }
                ens = ens[name[i]];
            }
            return ens;
        },
        requires: function (cls, cb, sp) {
            if (sirm.isObject(cls)) {
                var rootPath = cls.rootPath;
                cls = cls.requires;
            }
            if (sirm.isArray(cls)) {
                var len = cls.length,
                        loaded = 0,
                        classes = [];
                sp = sp || w;
                for (var i = 0; i < len; i++) {
                    var _class = sirm.getClass(cls[i]);
                    if (!_class) {
                        $.getScript(replaceClassToPath(cls[i], rootPath), function () {
                            loaded++;
                            classes[classes.length] = sirm.getClass(cls[i]);
                            if (len == loaded) {
                                cb.apply(sp, classes);
                            }
                        });
                    } else {
                        loaded++;
                        classes[classes.length] = _class;
                        if (len == loaded) {
                            cb.call(sp, classes);
                        }
                    }
                }
            } else if (sirm.isString(cls)) {
                var _class = sirm.getClass(cls[i]);
                if (!_class) {
                    $.getScript(replaceClassToPath(cls, rootPath), function () {
                        _class = sirm.getClass(cls);
                        sp = sp || _class || w;
                        cb.call(sp, _class);
                    });
                } else {
                    sp = sp || _class || w;
                    cb.call(sp, _class);
                }
            }
        },
        use: function () {
            var args = Array.prototype.slice.call(arguments);
            var callback = args.pop();
            var len = args.length,
                    loaded = 0,
                    classes = [],
                    call = function () {
                        if (loaded == len) {
                            callback.apply(new function () {
                            }, classes);
                        }
                    };
            for (var i = 0; i < len; i++) {
                var cls = sirm.getClass(args[i]);
                if (cls) {
                    classes[classes.length] = cls;
                    loaded++;
                } else {
                    sirm.requires(args[i], function (cl) {
                        classes[classes.length] = cl;
                        loaded++;
                        call();
                    });
                }
                call();
            }
        },
        widget: function (cfg) {
            if (!cfg.url) {
                throw "argument have not a url config!";
            }
            if (!cfg.type) {
                cfg.type = 'iframe';
            }
            if (cfg.callbacks || cfg.callback) {
                var url = cfg.url;
                var index = url.indexOf('?');
                url = index > 0 ? url.substring(0, index) : url;
            }
            if (cfg.callbacks) {
                for (var name in cfg.callbacks) {
                    sirm.widget.addCallback(url, name, cfg.callbacks[name]);
                }
            }
            if (cfg.callback) {
                sirm.widget.addCallback(url, 'callback', cfg.callback);
            }
            if (cfg.type === 'window') {
                return STK.stk_dialog({
                    clickBgClose: false,
                    title: cfg.title || '&nbsp;',
                    width: cfg.width || 200,
                    modal: !!cfg.modal,
                    contentBoxCss: {
                        height: cfg.height || 200,
                        overflow: 'hidden'
                    },
                    objOrUrl: cfg.url
                });
            } else if (cfg.type === 'iframe') {
                var win = {};
                win.stk_show = function () {
                    var reload = false;
                    if (!win.iframe) {
                        win.iframe = $('<iframe src="' + cfg.url + '" style="display:none;width:100%;height:100%;border:none;" frameborder="0"></iframe>');
                        win.iframe.load(function () {
                            win.mask.hide();
                            win.iframe.show();
                        });
                    } else {
                        reload = true;
                    }
                    STK.stk_dialog({
                        clickBgClose: false,
                        title: cfg.title || '&nbsp;',
                        width: cfg.width || 200,
                        modal: !!cfg.modal,
                        contentBoxCss: {
                            height: cfg.height || 200,
                            overflow: 'hidden'
                        },
                        objOrUrl: win.iframe
                    });
                    var box = win.iframe.parent();
                    if (!win.mask) {
                        win.mask = $('<div style="width:100%;position:absolute;top:0;left:0;z-index:99998;"></div>')
                                .append('<div style="width:100%;height:100%; background-color:#fff;opacity:0.5;filter:Alpha(Opacity=50);"></div>')
                                .append('<div class="loading-st1" style="position:absolute; width:32px; height:32px; left:50%;top:50%;margin-left:-16px; margin-top:-16px;z-index:99999"></div>')
                                .height(box.height()).appendTo(box);
                    }
                    win.mask.show();
                    win.iframe.hide();
                    if (reload) {
                        win.iframe[0].contentWindow.location.reload();
                    }
                };
                win.stk_hide = function () {
                    if (win.iframe) {
                        win.iframe.stk_cancelDialog();
                    }
                };
                win.setUrl = function (src) {
                    win.iframe[0].src = src;
                    return win;
                };
                return win;
            }
        }, repeatstring: function (string, num) {
            var result = [];
            for (var i = 0; i < num; i++) {
                result.push(string);
            }
            return result.join("");
        }, lenstring: function (string, type) {
            var _length = 0;
            if (type == 0) {
                return string.length;
            } else if (type == 1) {
                for (var i = 0; i < string.length; i++) {
                    if (string.charCodeAt(i) >= 0x7F) {
                        _length += 2;
                    } else {
                        _length++;
                    }
                }
            }
            return _length;

        }, substring: function (string, type, length, start, ellipse) {
            var _string = [];
            var _length = 0;
            if (type == 0) { //普通截取
                if (start + length >= string.length) {
                    return string.substring(start);
                } else {
                    return string.substring(start, start + length);
                }
            } else if (type == 1) { //中文计算2长度截取
                for (var i = start; i < string.length && _length < length; i++) {
                    if (string.charCodeAt(i) >= 0x7F) {
                        _length += 2;
                    } else {
                        _length++;
                    }
                    if (length >= _length) {
                        _string.push(string.charAt(i));
                    }
                }
            }
            var _len = sirm.lenstring(string, type);
            var _ellipse = _len > length &&
                    (ellipse == null || ellipse);
            if (_ellipse) {
                _string.push("...");
            }
            return _string.join("");
        },
        // 撑满某个对象的整个高度
        stretchHeight: function (targetobj, delta) {
            var sf = function () {
                var tableWrap = $(targetobj);
                var tableOffset = tableWrap.offset();
                var documentHeight = $(document.documentElement).height();
                if ($.browser.msie) {
                    documentHeight = document.documentElement.clientHeight;
                } else {
                    documentHeight = window.innerHeight;
                }
                var tableHeight = documentHeight - tableOffset.top - (delta == undefined ? 0 : delta);
                tableWrap.height(tableHeight);
            };
            sf();
            $(window).resize(function () {
                sf();
            });
        },
        openedTabs: [],
        openTab: function (url, title, setting, callback) {
            $(document).stk_go(url, title, setting);
            var t = {url: url, title: title, setting: setting, callback: callback};
            w.sirm.openedTabs.push(t);
        },
        deamon: function () {
            var _callback = null;
            var _refresh = false;
            for (var i = w.sirm.openedTabs.length - 1; i >= 0; i--) {
                var t = w.sirm.openedTabs[i];
                var tab = $(document).stk_getTab(t.url, t.title, t.setting);
                if (tab == undefined) {
                    w.sirm.openedTabs.splice(i, 1);
                    _callback = t.callback;
                    _refresh = true;
                }
            }
            if (_refresh) {
                if (_callback != null) {
                    _callback();
                }
            }
        },
        jsurl: function (url) {
            var result = url;
            if (url != null) {
                if (url.indexOf("://") < 0) {
                    if (url.indexOf("/") == 0) {
                        result = (__contextPath == undefined ? "" : __contextPath) + url;
                    }
                }
            }

            return sirm.appendssid(result);
        },
        appendssid : function(url){
            var result = url;
            //if (url != null && url.indexOf(":") < 0 && url.indexOf("#") < 0) {
                if (result != null){
                    var re = new RegExp("_ssid_" + "=([^\&]*)", "i");
                    var a = re.exec(url);
                    if (a == null){
                        var p = url.indexOf("?");
                        if (p>=0){
                            result = result + "&_ssid_=" + sirm._ssid_;
                        }
                        else{
                            result = result + "?_ssid_=" + sirm._ssid_;
                        }
                    }
                }
//            }
            return result;
        },
        /**
         * 日期控件值
         * @param datetime
         * @param name
         */
        setDatetime_val : function(datetime, id) {
            /**验证日期格式*/
            var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
            var r = datetime.match(reg);
            if (r == null) {
                /**日期格式错误*/
                stk.info("请输入正确的日期格式");
                return false
            }
//            date赋值
            $("#" + id + "_date").stk_val(r[1] + "-" + r[3] + "-" + r[4]);
//            hour赋值
            $("#" + id + "_hour").stk_val(r[5]);
//            minute赋值
            $("#" + id + "_minutes").stk_val(r[6]);
        },
        /**
         * 设置时间
         * @param datetime
         * @param name
         */
        setDate_val : function(datetime, id) {
            /**验证日期格式*/
            var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
            var r = datetime.match(reg);
            if (r == null) {
                /**日期格式错误*/
                stk.info("请输入正确的日期格式");
                return false
            }
//            date赋值
            $("#" + id + "_date").stk_val(r[1] + "-" + r[3] + "-" + r[4]);
        },
        setHour_val : function(datetime, id) {
            /**验证日期格式*/
            var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
            var r = datetime.match(reg);
            if (r == null) {
                /**日期格式错误*/
                stk.info("请输入正确的日期格式");
                return false
            }
//            hour赋值
            $("#" + id + "_hour").stk_val(r[5]);
        },
        setMinutes_val : function(datetime, id) {
            /**验证日期格式*/
            var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
            var r = datetime.match(reg);
            if (r == null) {
                /**日期格式错误*/
                stk.info("请输入正确的日期格式");
                return false
            }
//            minute赋值
            $("#" + id + "_minutes").stk_val(r[6]);
        },
        getDatetime_val : function(id) {
//            date赋值
            var _date = $("#" + id + "_date").stk_val();
            var date = _date.split("-");
            if (date.length < 3) {
                return undefined;
            }
//            hour赋值
            var _hour = $("#" + id + "_hour").stk_val();
//            minute赋值
            var _minutes = $("#" + id + "_minutes").stk_val();
            var d = new Date();
            d.setFullYear(date[0], (date[1] - 1), date[2]);
            d.setHours(_hour);
            d.setMinutes(_minutes);
            d.setSeconds(0)
            return d;
        },
        formatmoney:function(s, id) {
//            获取光标位置
            var split = s.split(".");
            var l = split[0].split("").reverse();
            var r = "";
            if (split.length > 1) {
                r = split[1];
            }
//            if (s.indexOf(".") != -1 && s.indexOf(".") != (s.length - 1)) {
//                s = parseFloat((s + "")) + "";
//            }
            t = "";
            for (i = 0; i < l.length; i++) {
                t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
            }
            var captival = t.split("").reverse().join("");
            if (split.length > 1) {
                captival += "." + r;
            }
            $("#" + id).stk_val(captival);
            var post = this.getPositionForInput(document.getElementById(id));
            this.setCursorPosition(document.getElementById(id), post);
        },
        formatinputtomoney:function(id) {
            $("#"+id).keyup(function(){
                var val = $(this).val();
                val = val.replaceAll("\,", "");
                sirm.formatmoney(val,id);
            });
        },
        getmoney:function(id) {
//            获取光标位置
            var s = $("#" + id).stk_val();
            s = s.replaceAll("\,", "");
            return parseFloat(s);
        },
//单行文本框
        getPositionForInput:function (ctrl) {
            var CaretPos = 0;
            if (document.selection) { // IE Support
                ctrl.focus();
                var Sel = document.selection.createRange();
                Sel.moveStart('character', -ctrl.value.length);
                CaretPos = Sel.text.length;
            } else if (ctrl.selectionStart || ctrl.selectionStart == '0') {// Firefox support
                CaretPos = ctrl.selectionStart;
            }
            return (CaretPos);
        },
//多行文本框
        getPositionForTextArea:function (ctrl) {
            var CaretPos = 0;
            if (document.selection) {// IE Support
                ctrl.focus();
                var Sel = document.selection.createRange();
                var Sel2 = Sel.duplicate();
                Sel2.moveToElementText(ctrl);
                var CaretPos = -1;
                while (Sel2.inRange(Sel)) {
                    Sel2.moveStart('character');
                    CaretPos++;
                }
            } else if (ctrl.selectionStart || ctrl.selectionStart == '0') {// Firefox support
                CaretPos = ctrl.selectionStart;
            }
            return (CaretPos);
        },
//设置光标位置函数
        setCursorPosition:function (ctrl, pos) {
            if (ctrl.setSelectionRange) {
                ctrl.focus();
                ctrl.setSelectionRange(pos, pos);
            }
            else if (ctrl.createTextRange) {
                var range = ctrl.createTextRange();
                range.collapse(true);
                range.moveEnd('character', pos);
                range.moveStart('character', pos);
                range.select();
            }
        },
        encodestr: function (str) {
            return encodeURI(encodeURI(str));
        },
        formatAsHtml : function(str){
            if (str != null){
                return str.replace(/ /, "&nbsp;")
                    .replace(/</, "&lt;")
                    .replace(/>/, "&gt;")
                    .replace(/\n/, "<br/>");
            }
            else{
                return "";
            }
        }
    });

    sirm.ns = sirm.namespace;
    sirm.ns('sirm.callbacks');
    sirm.widget.addCallback = function (url, name, fn) {
        var callbacks = sirm.callbacks[url] || (sirm.callbacks[url] = {});
        callbacks[name] = fn;
    };

    sirm.widget.fireCallback = function (url, name, params) {
        if (sirm.callbacks[url] && typeof sirm.callbacks[url][name] === 'function') {
            return sirm.callbacks[url][name].apply(this, sirm.isArray(params) ? params : [params]);
        }
    };


//dom ready event
    $(function () {
        $('form input[type="text"]:only-child').keypress(function (e) {
            if (e.which == 13) {
                return false;
            }
        });
    });
})
        (window, undefined);
//kindeditor
(function () {
    if (window.KE) {
        KE.scriptPath = (window.__contextPath || '') + '/framework/kindeditor/';
        $.extend(KE.setting, {
            skinsPath: KE.scriptPath + 'skins/',
            pluginsPath: KE.scriptPath + 'plugins/'
        });
    }
})();
/**
 * file uploader
 */
(function (s, w) {
    if (w.plupload) {
        plupload.guidPrefix = 'sirm-';
    }
    var uploaderTpl = [
        '<div id="${containerId}" class="upload-box" style="overflow:hidden">',
        '<input type="hidden" name="uploader" value="${baseId}"/>',
        '<div class="clearfix upload-btn">',
        '<a id="${buttonId}" href="#"><b class="icon-add"></b>新增文件</a>',
        '</div>',
        '<ul>',
        '</ul>',
        '</div>'
    ].join('');
    var progressTpl = [
        '<span class="pro-bar">',
        '<span class="pro-inner" style="width:0%"></span>',
        '</span>',
        '<span class="failure"></span>',
        ].join('');
    var fileItemTpl = [
        '<li id="${id}" class="fileitem clearfix">',
        '<b class="icon-st47"></b>',
        '<span class="filename">${name}</span>',
        '<span class="filesize">(${size})</span>',
        progressTpl,
        '<a class="retry" style="display:none;margin-right:5px" href="#">重试</a>',
        '<a class="deletefile" href="#">删除</a>',
        '</li>'
    ].join('');
    var hiddenItemTpl = '<input type="hidden" name="${fileIdName}" value="${fileId}"/><input type="hidden" name="${fileId}" value="${fileName}"/>';
    s.ns('sirm.io').uploader = function (el, uploaderId, multi, filters, params, maxSize, max_retries, chunkSize) {
        if (sirm.isString(el)) {
            el = $(el);
        }
        if (arguments.length === 2) {
            if (typeof uploaderId === 'boolean') {
                multi = uploaderId;
                uploaderId = null;
            }
        } else {
            multi = typeof multi === 'undefined' ? true : multi;
        }
        chunkSize = chunkSize || 1024;
        var baseId = uploaderId || plupload.guid(),
                boxId = 'uploader-' + baseId,
                complete = true,
                buttonId = 'uploader-browse-button-' + baseId,
                uploaderEl = el.append(
                        uploaderTpl.replace('${containerId}', boxId)
                                .replace('${buttonId}', buttonId)
                                .replace('${baseId}', baseId)
                        ),
                hiddenNameEl = uploaderEl.find('input[value="' + baseId + '"]'),
                progressBars = {},
                getProgressBar = function (id) {
                    return progressBars[id] || (progressBars[id] = uploaderEl.find('#fileItem-' + id + ' .pro-inner'));
                },
                getProgressBarWrap = function (id) {
                    var bar = getProgressBar(id);
                    return bar && bar.parent && bar.parent();
                },
                uploader = new plupload.Uploader({
                    runtimes : 'html5,flash,silverlight,html4',
                    url: (w.__contextPath || '') + '/uploader/upload.action',
                    max_file_size: maxSize || '1024mb',
                    chunk_size: (chunkSize / 1024) + 'mb',
                    unique_names: true,
                    multiple_queues: true,
                    multipart: true,
                    multi_selection: multi,
                    flash_swf_url: (w.__contextPath || '') + '/sirm/js/plugins/plupload/js/Moxie.swf',
                    silverlight_xap_url: (w.__contextPath || '') + '/sirm/js/plugins/plupload/js/Moxie.xap',
                    browse_button: buttonId,
                    container: document.getElementById(boxId),
                    drop_element: uploaderEl[0],
                    filters: filters || {},
                    max_retries: max_retries || 1000,
                    multipart_params: $.extend(params, {uploaderId: baseId}),
                    file_data_name: 'upload',
                    headers: {
                        chunkSize: chunkSize
                    }
                }),
                fileList = uploaderEl.find('ul');
        uploader.uploaderId = baseId;
        // delete action
        fileList.delegate('a.deletefile', 'click', function () {
            var fileItem = this.parentNode;
            var fileId = fileItem.id.replace('fileItem-', '');
            var file = uploader.getFile(fileId);
            if (file) {
                uploader.removeFile(file);
            } else {
                uploader.trigger('FilesRemoved', [
                    {id: fileId}
                ]);
            }
            return false;
        });

        uploader.bind('Init',function(up){
            if(up.runtime === "html4"){
                $('#'+buttonId).parent().append('<span style="color:red;margin-left:10px;">未安装flash，这将无法支持断点续传</span>');
            }
        });

        fileList.delegate('a.retry', 'click', function () {
            this.style.display='none';
            this.previousSibling.style.display='none';
            this.previousSibling.previousSibling.style.display='';
            var fileItem = this.parentNode;
            var fileId = fileItem.id.replace('fileItem-', '');
            var file = uploader.getFile(fileId);
            if (file) {
                file.status = plupload.QUEUED;
            }
            doStop();
            doStart(1);
            return false;
        });
        //bind event
        uploader.bind('FilesAdded', function (up, files) {
            if (files.length > 0) {

                if (multi === false) {
                    fileList.empty();
                }

                if (this.isComplete()) {
                    complete = false;
                }

                uploader.addDisplayFile(files);

                //auto start upload
                doStart(1400);
            }
        });

        var doStart = function (dely) {
            if (uploader.state === plupload.STOPPED) {
                setTimeout(function () {
                    if (uploader.state === plupload.STOPPED) {
                        uploader.start();
                    }
                }, dely);
                if (multi === false) {
                    uploader.disableAddFile(true);
                }
            }
        };

        var onRemoved = function () {
            if (uploader.total.queued > 0) {
                doStart(140);
            } else {
                if (!uploader.isComplete()) {
                    uploader.trigger('UploadComplete', uploader, uploader.files);
                }
            }
        };
        var doStop = function () {
            if (uploader.state === plupload.STARTED || uploader.state === plupload.UPLOADING) {
                uploader.stop();
            }
        };

        var getHiddenItemTpl = function (file) {
            return hiddenItemTpl.replace('${fileIdName}', baseId).replace(/\$\{fileId\}/g, file.id).replace('${fileName}', file.name);
        };

        uploader.bind('FilesRemoved', function (up, files) {
            if (files.length === uploader.total.queued) {
                doStop();
            }
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                if (progressBars[file.id]) {
                    doStop();
                }
                var fileItem = fileList.find('#fileItem-' + file.id);
                fileItem.animate({
                    height: 0,
                    opacity: 0
                }, 500, function () {
                    fileItem.remove();
                    delete progressBars[file.id];
                    if (i === files.length) {
                        onRemoved();
                    }
                });
            }
        });

        uploader.bind('UploadProgress', function (up, file) {
            var bar = getProgressBar(file.id);
            bar && bar.css('width', file.percent + '%');
        });
        var err = function (bp, e) {
            var error = bp.css('display', 'none').next().css('display', '')
                .html(e.code === plupload.FILE_SIZE_ERROR ? '文件大小超过' + plupload.formatSize(uploader.settings.max_file_size) : '上传失败，请重试！')
            if(e.code !== plupload.FILE_SIZE_ERROR){
                error.next().css('display', '');
            }
        };
        uploader.bind('FileUploaded', function (up, file, res) {
            var bp = getProgressBarWrap(file.id);
            try {
                $.parseJSON(res.response.replace(/^\s*<pre[^>]*>/, '').replace(/<\/pre>\s*$/, ''));
                $(getHiddenItemTpl(file)).appendTo(bp.parent());
                bp.animate({
                    width: 0,
                    opacity: 0
                }, 500, function () {
                    bp.remove();
                });
            } catch (e) {
                err(bp, e);
            }
        });

        uploader.bind('BeforeUpload', function () {
            complete = false;
        });

        uploader.bind('UploadComplete', function () {
            complete = true;

            if (multi === false) {
                uploader.splice(0, uploader.files.length - 1);
                setTimeout(function () {
                    uploader.disableAddFile(false);
                }, 1500);
            }
        });

        uploader.bind('Error', function (up, e) {
            var bp = getProgressBarWrap(e.file.id);
            err(bp, e);
        });

        uploader.init();

        uploader.isStop = function () {
            return uploader.state === plupload.STOPPED;
        };

        uploader.isComplete = function () {
            return complete;
        };

        uploader.clear = function () {
            uploader.stop();
            uploader.splice();
            fileList.empty();
            hiddenNameEl.val(baseId);
            return this;
        };

        uploader.addDisplayFile = function (files) {
            if (sirm.isObject(files)) {
                files = [files];
            }
            if (sirm.isArray(files)) {
                var html = [];
                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    var tpl = fileItemTpl;
                    if ((!sirm.isNumber(file.loaded) || file.loaded === file.size) && file.size != 0) {
                        tpl = fileItemTpl.replace(progressTpl, getHiddenItemTpl(file));
                    }
                    tpl = tpl.replace('${id}', 'fileItem-' + file.id)
                            .replace('${name}', file.link ?
                            '<a href="' + file.link + '"' + (file.target ? ' target="' + file.target + '"' : '') + '>'
                                    + file.name + '</a>' : file.name)
                            .replace('${size}', plupload.formatSize(file.size));
                    if (file.canDelete === false) {
                        tpl = tpl.replace('<a class="deletefile" href="#">删除</a>', '');
                    }
                    html[html.length] = tpl;
                }
                html = $(html.join(''));
                html.css('display', 'none');
                fileList.append(html);
                html.fadeIn(500, function(){
                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        if(file.size === 0) {
                            uploader.trigger('Error', {
                                code : -1,
                                message : '文件大小必须大于0',
                                file : file
                            });
                        }
                    }
                });
            }
            return this;
        };

        uploader.disableAddFile = function (bool) {
            uploader.disableBrowse(bool);
            return this;
        };

        uploader.appendFileItemDisplay = function (fileId, appendHtml) {
            var file = uploader.getDisplayFile(fileId);
            if (file != null) {
                $(appendHtml).appendTo(file.dom);
            }
        };

        uploader.getDisplayFileList = function () {
            var lis = document.getElementsByName(uploader.uploaderId),
                    files = [];
            for (var i = 0; i < lis.length; i++) {
                var dom = lis[i],
                        id = dom.value,
                        name = document.getElementsByName(id)[0].value;
                files[i] = {id: id, name: name, dom: dom};
            }
            return files;
        };

        uploader.getDisplayFile = function (fileId) {
            var input = document.getElementsByName(fileId)[0];
            return input != null ? {id: fileId, name: input.value, dom: input.parentNode} : null;
        };

        uploader.stkValidator = function (minSize) {
            if (minSize && uploader.getDisplayFileList().length < minSize) {
                return '请至少选择[' + minSize + ']个附件!';
            }
            if (!uploader.isComplete()) {
                return '请等待附件上传完成!';
            }
            return true;
        };

        uploader.fileremoved = function(callback){
            this.bind("FilesRemoved",function(up,files){
                if(files[0].status==5){
                    callback(up,files);
                }
            });
        };

        return uploader;
    };
})(sirm, window);
/***
 * form utils
 */
(function (w, s) {
    s.form = {};
    s.form.checker = $.extend({}, {
        checkInputContent:function (selector, maxLength) {
            var el = $(selector);
            var dl = el.next("div");

            var html = $("<div class='strlentooltip' style='color:red'>最多还可输入<label>" + maxLength + "</label>个字符！</div>");
            var currentCount = html.find('label');
            if (dl.attr("class") == undefined){
                el.after(html);
                el.bind('validate', function (e) {
                    var text = el.val();
                    // 46 - delete ascii码 8 - backspace ascii码
                    if (e.which != 8 && e.which != 46) {
                        if (text.length > maxLength) {
                            el.val(text.substring(0, maxLength));
                            return false;
                        }
                    }
                    currentCount.text(maxLength - text.length);
                });

                el.keyup(function (e) {
                    el.trigger('validate');
                });
                var form = el.parents('form').first();
                if (form.length > 0) {
                    form.bind('reset', function () {
                        el.val('');
                        el.trigger('validate');
                    });
                }
            }
            el.trigger('validate');
        }
    });
})(window, sirm);
/***
 * table utils
 */
(function (w, s) {
    sirm.table = {};
    sirm.table.utils = $.extend({}, {
        setHeader: function (table, index, cfg) {
            table = $(table);
            var header;
            if (Object.prototype.toString.apply(index) == '[object Array]') {

                var selector = '';

                for (var i = 0; i < index.length; i++) {
                    if (selector) {
                        selector += ', ';
                    }
                    if (typeof index[i] == 'object') {
                        selector += 'tr:eq(' + index[i].y + ')>th:eq(' + index[i].x + ')';
                    } else {
                        selector += 'tr>th:eq(' + index[i] + ')';
                    }
                }

                header = table.find(selector);
            } else if (typeof index == 'object') {
                header = table.find('tr:eq(' + index.y + ')>th:eq(' + index.x + ')');
            } else {
                header = table.find('tr>th:eq(' + index + ')');
            }
            if (header.length > 0) {
                if (cfg.attr) {
                    if (Object.prototype.toString.apply(cfg.attr) == '[object Array]') {
                        header.attr.apply(header, cfg.attr);
                    } else {
                        header.attr(cfg.attr);
                    }
                }
                if (typeof cfg.html == 'string') {
                    header.html(cfg.html);
                }
                if (cfg.style) {
                    if (Object.prototype.toString.apply(cfg.attr) == '[object Array]') {
                        header.css.apply(header, cfg.style);
                    } else {
                        header.css(cfg.style);
                    }
                }
            }
        }
    });

})(window, sirm);

/***
 * add method to '$.fn' , JQ extends
 * @author 张立鑫
 */
(function (w, u) {
    var ID_INDEX = 0;
    $.fn.extend({
        /**
         * show in any frame ,  for example: $('#window').stk_showIn(window.top,{title:'top window'})
         * @param frame frame ,can't be null
         * @args...   a lot of more arguments
         */
        stk_showIn: function (frame) {
            if (!frame) {
                return;
            }
            if (typeof frame === 'string') {
                frame = w.$(frame);
            }
            var body;
            if (frame.selector && frame.length < 1) {
                return;
            } else if ((frame.contentWindow || frame).eval && frame == (frame.contentWindow || frame).eval('this')) {
                body = frame.document.body;
            } else if (frame.selector) {
                body = frame.content().find('body');
            }
            var self = ((frame.$ ? frame.$(body) : null) || frame).find(this.selector);
            if (self.length < 1) {
                this.parent().clone().appendTo(body);
                self = ((frame.$ ? frame.$(body) : null) || frame).find(this.selector);
            }
            var args = Array.prototype.slice.call(arguments, 0);
            args.splice(0, 1);
            self.stk_show.apply(self, args);
        },
        /**
         * show in top frame,That is the outermost first.jsp
         * @args...   Parameters are the same as stk_show
         */
        stk_showInTop: function () {
            var args = Array.prototype.slice.call(arguments, 0);
            args.splice(0, 0, w.top);
            this.stk_showIn.apply(this, args);
        },
        stk_checkInputContent: function (maxLength) {
            sirm.form.checker.checkInputContent(this, maxLength);
        },
        stk_checkerReset: function (type) {
            //TODO  switch type to do...

            this.keyup();
        },
        stk_validateForm: function () {
            this.find(':input').trigger('validate');
        },
        /**
         * 帮绑定一个券商选择器
         * @param readOnly 是否将节点变为只读
         */
        stk_bindSelector: function (clazz, param, multiple, hiddenName, readOnly, height) {
            if (document.getElementById('sirm-broker-style-sheets') == null) {
                var head = document.getElementsByTagName('head')[0],
                        style = document.createElement('style'),
                        cssContent = '.stk-analyst-label,.stk-broker-label{margin-right:15px;}.stk-analyst-item,.stk-broker-item{padding:10px;text-align:center;}.stk-analyst-item-first,.stk-broker-item-first{margin-top:40px;}.stk-analyst-button,.stk-broker-button{margin:0 5px;}.stk-broker-name,.stk-broker-name-label{display:inline-block;position:absolute;right:225px;}.stk-broker-name{right:auto;left:175px;}.stk-broker-selector{position:absolute;background:#fff;}';
                head.appendChild(style);
                style.id = 'sirm-broker-style-sheets';
                if (style.styleSheet) {   //For IE
                    style.styleSheet.cssText = cssContent;
                } else {
                    var css_text = document.createTextNode(cssContent);
                    style.appendChild(css_text);
                }
            }
            if (this[0].brokerSelector) {
                return this[0].brokerSelector;
            }
            if (readOnly !== false) {
                this[0].readOnly = true;
            }
            var me = this, iconBtn = me.prev().find('.ui-icon');

            if (iconBtn.length == 1) {
                iconBtn.click(function () {
                    me.click();
                });
            }

            me.click(function (e) {
                if (e.target !== me[0]) {
                    return;
                }
                if (!me[0].brokerSelector) {
                    var options = {
                        clazz: clazz,
                        multiple: (multiple || false) + '',
                        cellWidth: '150px'
                    },
                            selector = me[0].brokerSelector = $(
                                    '<div id="stk_brokerSelector_' + (++ID_INDEX) + '" style="width:500px" class="stk-input-search-extra-st1 stk-broker-selector">' +
                                            '<div class="stk-child-bar">' +
                                            '<b class="stk-button-icon stk-child-close" style="right:15px"></b>' +
                                            '</div>' +
                                            '<div name="tab" class="stk-child-nav"></div>' +
                                            '<div name="content" style="width:100%;height:"+(height==undefine ? 300 : height)+"px;overflow-y:auto;overflow-x:hidden;"></div>' +
                                            '<div name="buttonGroup" style="text-align:center;width:100%"></div>' +
                                            '</div>').appendTo('body'),

                            melp = me.parent(),
                            melpos = me.offset();
                    $(window).unload(function () {
                        me[0].brokerSelector = null;
                    });
                    selector.css("left", melpos.left - 1);
                    selector.css("top", melpos.top + me.outerHeight() + 1);
                    if (!multiple) {
                        var hiddenName = hiddenName || (me.name || 'broker') + 'Id',
                                hidden = melp.find('input[name="' + hiddenName + '"]'),
                                hidden = hidden.length > 0 ? hidden : $('<input type="hidden" name="' + hiddenName + '">');
                        melp.append(hidden);
                        me.change(function () {
                            var text = me.val();
                            if (!text || text.trim().length < 1) {
                                hidden.val('');
                            }
                        });
                    }
                    if (typeof(param) == "function") {
                        param = param();
                    }
                    selector.bgiframe();
                    selector.mousedown(function () {
                        return false;
                    });
                    selector.find('.stk-child-bar').click(function () {
                        selector.hide()
                    });

                    (selector.refresh = function () {
                        SpiritSelectorAction.genLetterSelector(options, param, {
                            callback: function (result) {
                                stk.letterSelector.init(selector[0].id, result, options);
                                if (!multiple) {
                                    var a = selector.find('div[name=content] span a[onclick][multiple][dataid]');
                                    a.removeAttr('onclick');
                                    a.click(function () {

                                        hidden.val(this.getAttribute('dataid'));
                                        me.val(this.innerHTML);
                                        selector.hide();
                                        var d = {};
                                        d[this.getAttribute('dataid')] = this.innerHTML;
                                        me.trigger('change', d);
                                        return false;
                                    });
                                } else {
                                    var button = selector.find('div[name="buttonGroup"] button'),
                                            getData = function () {
                                                var data = {};
                                                $.each(selector.find("input[name!='classify']:checked"), function (i, n) {
                                                    data[$(n).val()] = $(n).next().text();
                                                });
                                                return data;
                                            };
                                    button.removeAttr('onclick');
                                    button.click(function () {
                                        var data = getData();
                                        me.stk_emptyOptions();
                                        me.stk_addOptions(data);
                                        selector.hide();
                                        var b = me.find('b.stk-button-icon.stk-child-close');
                                        b.removeAttr('onclick');
                                        b.one('click', function () {
                                            var p = this.parentNode;
                                            p.parentNode.removeChild(p);
                                            var data = {},
                                                    values = me.stk_val();
                                            me.find('span').each(function (i, n) {
                                                data[values[i]] = n.innerHTML;
                                            });
                                            me.trigger('change', data);
                                        });
                                        me.trigger('change', data);
                                    });
                                }
                                selector.oldHeight = selector.height();
                            }
                        });
                    })();
                }
                var selector = me[0].brokerSelector;
                if (selector.css('display') == 'none') {
                    selector.show(200);
                }
                $(document).one('mousedown', function () {
                    selector.hide(200);
                });
            });
            return me[0].brokerSelector;
        },
        stk_setWindowTitle: function (title) {
            this.parent().parent().prev().children('span').html(title)
        }
    });
})(window, undefined);
/***
 * fix changeTheme function reload page
 * @author 张立鑫
 */
(function (w, u) {
//<link type="text/css" href="${contextPath}/framework/css/${themeName}/jquery-ui.css" rel="stylesheet" />
//<link type="text/css" href="${contextPath}/framework/css/${themeName}/jquery-plugin.css" rel="stylesheet" />
//<link type="text/css" href="${contextPath}/framework/css/${themeName}/stk.css" rel="stylesheet" />
    var cssPath = '/framework/css/' ,
            selectorBase = 'link[href*=';

    function replaceStyleSheet(name, frame) {
        if (frame) {
            try {
                var themeTag = frame.$(selectorBase + '"' + cssPath + frame.__themeName + '/"]');
                themeTag.each(function () {
                    this.href = this.href.replace(new RegExp(cssPath + frame.__themeName, 'g'), cssPath + name);
                });
                frame.__themeName = name;
                for (var i = 0, iframe; (iframe = (frame.contentWindow || frame).frames[i]); i++) {
                    replaceStyleSheet(name, iframe);
                }
            } catch (e) {
            }
        }
    }


    sirm.changeTheme = function (name) {
        $.get((w.__contextPath || '') + '/theme/change.action', {theme: name}, function () {
            replaceStyleSheet(name, w.top);

            var skinList = w.top.$('div.skinlist ul'),
                    btn = skinList.find('li.' + name),
                    li = skinList.find('li');
            li.each(function (i, el) {
                el.className = el.className.replace(/Select/g, '');
            });
            btn.removeClass(name);
            btn.addClass(name + 'Select');
        });
    };
})(window, undefined);
/***
 * fix ui:table afterQuery event and beforeQuery event
 *
 * eg:
 *   $('#brokerViewTable').bind('afterQuery',function(e,data,el){
 *       alert(data);
 *   });
 *   $('#brokerViewTable').bind('beforeQuery',function(e,el){
 *       alert('beforeQuery');
 *   });
 * @author 张立鑫
 */
(function (w) {
    if (!w.stk) {
        return;
    }
    var genTable = stk.table.genTable;
    stk.table.genTable = function (config, result, callBack) {
        var cb = function (result) {
            var el = $('#' + config.id);
            el.trigger('afterQuery', [result, el]);
            callBack.call(this, result);
        };
        genTable.call(this, config, result, cb);
    };
    SpiritTableAction.init = function (p0, p1, p2, p3, p4, callback) {
        var el = $('#' + arguments[0].id);
        el.trigger('beforeQuery', [el]);
        return dwr.engine._execute(SpiritTableAction._path, 'SpiritTableAction', 'init', arguments);
    };
    var query = stk.table.query;
    stk.table.query = function (config, callBack) {
        if ($.isReady) {
            query.call(this, config, callBack);
        } else {
            $(function () {
                query.call(this, config, callBack);
            });
        }
    }
})(window);
// Copyright: Hiroshi Ichikawa <http://gimite.net/en/>
// License: New BSD License
// Reference: http://dev.w3.org/html5/websockets/
// Reference: http://tools.ietf.org/html/draft-hixie-thewebsocketprotocol

(function () {

    if (!window.swfobject)return;

    if ((window.WebSocket || window.MozWebSocket) && !window.WEB_SOCKET_FORCE_FLASH) return;

    window.WEB_SOCKET_SWF_LOCATION = 'sirm/resources/flex/WebSocketMain.swf';

    var logger;
    if (window.WEB_SOCKET_LOGGER) {
        logger = WEB_SOCKET_LOGGER;
    } else if (window.console && window.console.log && window.console.error) {
        // In some environment, console is defined but console.log or console.error is missing.
        logger = window.console;
    } else {
        logger = {log: function () {
        }, error: function () {
        }};
    }

    // swfobject.hasFlashPlayerVersion("10.0.0") doesn't work with Gnash.
    if (swfobject.getFlashPlayerVersion().major < 10) {
        logger.error("Flash Player >= 10.0.0 is required.");
        return;
    }
    if (location.protocol == "file:") {
        logger.error(
                "WARNING: web-socket-js doesn't work in file:///... URL " +
                        "unless you set Flash Security Settings properly. " +
                        "Open the page via Web server i.e. http://...");
    }

    /**
     * This class represents a faux web socket.
     * @param {string} url
     * @param {array or string} protocols
     * @param {string} proxyHost
     * @param {int} proxyPort
     * @param {string} headers
     */
    WebSocket = function (url, protocols, proxyHost, proxyPort, headers) {
        var self = this;
        self.__id = WebSocket.__nextId++;
        WebSocket.__instances[self.__id] = self;
        self.readyState = WebSocket.CONNECTING;
        self.bufferedAmount = 0;
        self.__events = {};
        if (!protocols) {
            protocols = [];
        } else if (typeof protocols == "string") {
            protocols = [protocols];
        }
        // Uses setTimeout() to make sure __createFlash() runs after the caller sets ws.onopen etc.
        // Otherwise, when onopen fires immediately, onopen is called before it is set.
        self.__createTask = setTimeout(function () {
            WebSocket.__addTask(function () {
                self.__createTask = null;
                WebSocket.__flash.create(
                        self.__id, url, protocols, proxyHost || null, proxyPort || 0, headers || null);
            });
        }, 0);
    };

    /**
     * Send data to the web socket.
     * @param {string} data  The data to send to the socket.
     * @return {boolean}  True for success, false for failure.
     */
    WebSocket.prototype.send = function (data) {
        if (this.readyState == WebSocket.CONNECTING) {
            throw "INVALID_STATE_ERR: Web Socket connection has not been established";
        }
        // We use encodeURIComponent() here, because FABridge doesn't work if
        // the argument includes some characters. We don't use escape() here
        // because of this:
        // https://developer.mozilla.org/en/Core_JavaScript_1.5_Guide/Functions#escape_and_unescape_Functions
        // But it looks decodeURIComponent(encodeURIComponent(s)) doesn't
        // preserve all Unicode characters either e.g. "\uffff" in Firefox.
        // Note by wtritch: Hopefully this will not be necessary using ExternalInterface.  Will require
        // additional testing.
        var result = WebSocket.__flash.send(this.__id, encodeURIComponent(data));
        if (result < 0) { // success
            return true;
        } else {
            this.bufferedAmount += result;
            return false;
        }
    };

    /**
     * Close this web socket gracefully.
     */
    WebSocket.prototype.close = function () {
        if (this.__createTask) {
            clearTimeout(this.__createTask);
            this.__createTask = null;
            this.readyState = WebSocket.CLOSED;
            return;
        }
        if (this.readyState == WebSocket.CLOSED || this.readyState == WebSocket.CLOSING) {
            return;
        }
        this.readyState = WebSocket.CLOSING;
        WebSocket.__flash.close(this.__id);
    };

    /**
     * Implementation of {@link <a href="http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-registration">DOM 2 EventTarget Interface</a>}
     *
     * @param {string} type
     * @param {function} listener
     * @param {boolean} useCapture
     * @return void
     */
    WebSocket.prototype.addEventListener = function (type, listener, useCapture) {
        if (!(type in this.__events)) {
            this.__events[type] = [];
        }
        this.__events[type].push(listener);
    };

    /**
     * Implementation of {@link <a href="http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-registration">DOM 2 EventTarget Interface</a>}
     *
     * @param {string} type
     * @param {function} listener
     * @param {boolean} useCapture
     * @return void
     */
    WebSocket.prototype.removeEventListener = function (type, listener, useCapture) {
        if (!(type in this.__events)) return;
        var events = this.__events[type];
        for (var i = events.length - 1; i >= 0; --i) {
            if (events[i] === listener) {
                events.splice(i, 1);
                break;
            }
        }
    };

    /**
     * Implementation of {@link <a href="http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-registration">DOM 2 EventTarget Interface</a>}
     *
     * @param {Event} event
     * @return void
     */
    WebSocket.prototype.dispatchEvent = function (event) {
        var events = this.__events[event.type] || [];
        for (var i = 0; i < events.length; ++i) {
            events[i](event);
        }
        var handler = this["on" + event.type];
        if (handler) handler.apply(this, [event]);
    };

    /**
     * Handles an event from Flash.
     * @param {Object} flashEvent
     */
    WebSocket.prototype.__handleEvent = function (flashEvent) {

        if ("readyState" in flashEvent) {
            this.readyState = flashEvent.readyState;
        }
        if ("protocol" in flashEvent) {
            this.protocol = flashEvent.protocol;
        }

        var jsEvent;
        if (flashEvent.type == "open" || flashEvent.type == "error") {
            jsEvent = this.__createSimpleEvent(flashEvent.type);
        } else if (flashEvent.type == "close") {
            jsEvent = this.__createSimpleEvent("close");
            jsEvent.wasClean = flashEvent.wasClean ? true : false;
            jsEvent.code = flashEvent.code;
            jsEvent.reason = flashEvent.reason;
        } else if (flashEvent.type == "message") {
            var data = decodeURIComponent(flashEvent.message);
            jsEvent = this.__createMessageEvent("message", data);
        } else {
            throw "unknown event type: " + flashEvent.type;
        }

        this.dispatchEvent(jsEvent);

    };

    WebSocket.prototype.__createSimpleEvent = function (type) {
        if (document.createEvent && window.Event) {
            var event = document.createEvent("Event");
            event.initEvent(type, false, false);
            return event;
        } else {
            return {type: type, bubbles: false, cancelable: false};
        }
    };

    WebSocket.prototype.__createMessageEvent = function (type, data) {
        if (document.createEvent && window.MessageEvent && !window.opera) {
            var event = document.createEvent("MessageEvent");
            event.initMessageEvent("message", false, false, data, null, null, window, null);
            return event;
        } else {
            // IE and Opera, the latter one truncates the data parameter after any 0x00 bytes.
            return {type: type, data: data, bubbles: false, cancelable: false};
        }
    };

    /**
     * Define the WebSocket readyState enumeration.
     */
    WebSocket.CONNECTING = 0;
    WebSocket.OPEN = 1;
    WebSocket.CLOSING = 2;
    WebSocket.CLOSED = 3;

    WebSocket.__flash = null;
    WebSocket.__instances = {};
    WebSocket.__tasks = [];
    WebSocket.__nextId = 0;

    /**
     * Load a new flash security policy file.
     * @param {string} url
     */
    WebSocket.loadFlashPolicyFile = function (url) {
        WebSocket.__addTask(function () {
            WebSocket.__flash.loadManualPolicyFile(url);
        });
    };

    /**
     * Loads WebSocketMain.swf and creates WebSocketMain object in Flash.
     */
    WebSocket.__initialize = function () {
        if (WebSocket.__flash) return;

        if (WebSocket.__swfLocation) {
            // For backword compatibility.
            window.WEB_SOCKET_SWF_LOCATION = WebSocket.__swfLocation;
        }
        if (!window.WEB_SOCKET_SWF_LOCATION) {
            logger.error("[WebSocket] set WEB_SOCKET_SWF_LOCATION to location of WebSocketMain.swf");
            return;
        }
        if (!window.WEB_SOCKET_SUPPRESS_CROSS_DOMAIN_SWF_ERROR && !WEB_SOCKET_SWF_LOCATION.match(/(^|\/)WebSocketMainInsecure\.swf(\?.*)?$/) &&
                WEB_SOCKET_SWF_LOCATION.match(/^\w+:\/\/([^\/]+)/)) {
            var swfHost = RegExp.$1;
            if (location.host != swfHost) {
                logger.error(
                        "[WebSocket] You must host HTML and WebSocketMain.swf in the same host " +
                                "('" + location.host + "' != '" + swfHost + "'). " +
                                "See also 'How to host HTML file and SWF file in different domains' section " +
                                "in README.md. If you use WebSocketMainInsecure.swf, you can suppress this message " +
                                "by WEB_SOCKET_SUPPRESS_CROSS_DOMAIN_SWF_ERROR = true;");
            }
        }
        var container = document.createElement("div");
        container.id = "webSocketContainer";
        // Hides Flash box. We cannot use display: none or visibility: hidden because it prevents
        // Flash from loading at least in IE. So we move it out of the screen at (-100, -100).
        // But this even doesn't work with Flash Lite (e.g. in Droid Incredible). So with Flash
        // Lite, we put it at (0, 0). This shows 1x1 box visible at left-top corner but this is
        // the best we can do as far as we know now.
        container.style.position = "absolute";
        if (WebSocket.__isFlashLite()) {
            container.style.left = "0px";
            container.style.top = "0px";
        } else {
            container.style.left = "-100px";
            container.style.top = "-100px";
        }
        var holder = document.createElement("div");
        holder.id = "webSocketFlash";
        container.appendChild(holder);
        document.body.appendChild(container);
        // See this article for hasPriority:
        // http://help.adobe.com/en_US/as3/mobile/WS4bebcd66a74275c36cfb8137124318eebc6-7ffd.html
        swfobject.embedSWF(
                WEB_SOCKET_SWF_LOCATION,
                "webSocketFlash",
                "1" /* width */,
                "1" /* height */,
                "10.0.0" /* SWF version */,
                null,
                null,
        {hasPriority: true, swliveconnect: true, allowScriptAccess: "sameDomian"},
                null,
                          function (e) {
                              if (!e.success) {
                                  logger.error("[WebSocket] swfobject.embedSWF failed");
                              }
                          });
    };

    /**
     * Called by Flash to notify JS that it's fully loaded and ready
     * for communication.
     */
    WebSocket.__onFlashInitialized = function () {
        // We need to set a timeout here to avoid round-trip calls
        // to flash during the initialization process.
        setTimeout(function () {
            WebSocket.__flash = document.getElementById("webSocketFlash");
            WebSocket.__flash.setCallerUrl(location.href);
            WebSocket.__flash.setDebug(!!window.WEB_SOCKET_DEBUG);
            for (var i = 0; i < WebSocket.__tasks.length; ++i) {
                WebSocket.__tasks[i]();
            }
            WebSocket.__tasks = [];
        }, 0);
    };

    /**
     * Called by Flash to notify WebSockets events are fired.
     */
    WebSocket.__onFlashEvent = function () {
        setTimeout(function () {
            try {
                // Gets events using receiveEvents() instead of getting it from event object
                // of Flash event. This is to make sure to keep message order.
                // It seems sometimes Flash events don't arrive in the same order as they are sent.
                var events = WebSocket.__flash.receiveEvents();
                for (var i = 0; i < events.length; ++i) {
                    WebSocket.__instances[events[i].webSocketId].__handleEvent(events[i]);
                }
            } catch (e) {
                logger.error(e);
            }
        }, 0);
        return true;
    };

    // Called by Flash.
    WebSocket.__log = function (message) {
        logger.log(decodeURIComponent(message));
    };

    // Called by Flash.
    WebSocket.__error = function (message) {
        logger.error(decodeURIComponent(message));
    };

    WebSocket.__addTask = function (task) {
        if (WebSocket.__flash) {
            task();
        } else {
            WebSocket.__tasks.push(task);
        }
    };

    /**
     * Test if the browser is running flash lite.
     * @return {boolean} True if flash lite is running, false otherwise.
     */
    WebSocket.__isFlashLite = function () {
        if (!window.navigator || !window.navigator.mimeTypes) {
            return false;
        }
        var mimeType = window.navigator.mimeTypes["application/x-shockwave-flash"];
        if (!mimeType || !mimeType.enabledPlugin || !mimeType.enabledPlugin.filename) {
            return false;
        }
        return mimeType.enabledPlugin.filename.match(/flashlite/i) ? true : false;
    };

    if (!window.WEB_SOCKET_DISABLE_AUTO_INITIALIZATION) {
        if (window.addEventListener) {
            window.addEventListener("load", function () {
                WebSocket.__initialize();
            }, false);
        } else {
            window.attachEvent("onload", function () {
                WebSocket.__initialize();
            });
        }
    }

})();
/***
 * socket io
 */
(function (w, s) {
    s.io = sirm.ns('sirm.io');
    var socket = function (url, params) {
        var me = this,
                events = {},
                actions = {},
                ms = socket.modules,
                m,
                defaultParams = {
//                 protocols, proxyHost, proxyPort, headers
                };

        me.lastSendTime = 0;
        me.lastMessageTime = 0;
        me.connected = false;
        for (var p in params) {
            defaultParams[p] = params[p];
        }

        params = defaultParams;


        for (var i = 0; i < ms.priority.length; i++) {
            var n = ms.priority[i];
            m = ms[n];
            if (m) {
                if (w.WebSocket === m || m === w.MozWebSocket || m.initialize || (m.__initialize && m.__initialize())) {
                    me['use' + n] = true;
                    break;
                }
            }
        }

        me.addEvents = function () {
            var len = arguments.length;
            for (var i = 0; i < len; i++) {
                var ename = arguments[i];
                if (typeof ename == 'string' && !events[ename]) {
                    events[ename] = [];
                }
            }
        };

        me.fireEvent = function (name) {
            var event = events[name] || [],
                    len = event.length;
            for (var j = 0; i < len; j++) {
                len--;
                var e = event[j],
                        scope = e.scope,
                        argLen = arguments.length;
                if (argLen > 1) {
                    var args = [];
                    for (var i = 1; i < argLen; i++) {
                        args[i - 1] = arguments[i];
                    }
                    e.fn.apply(scope, args);
                } else {
                    e.fn.call(scope);
                }
                if (e.single) {
                    event.splice(j, 1);
                    j--;
                }
            }
        };

        me.addEventListener = function (name, fn, single, scope) {
            if (typeof name == 'object') {
                scope = name.scope;
                if (typeof scope != 'function') {
                    delete name.scope;
                }
                for (var n in name) {
                    me.addEventListener(n, name[n], scope);
                }
            } else {
                if (!events[name]) {
                    return;
                }
                events[name].push({
                    fn: fn,
                    single: (single === true),
                    scope: scope || me
                });
            }
        };

        me.removeEventListener = function (name, fn, single, scope) {
            var e = events[name];
            if (!e) {
                return;
            }
            var len = e.length,
                    listener = {
                        fn: fn,
                        single: (single === true),
                        scope: scope || me
                    };
            while (len) {
                len--;
                var eo = e[len];
                if (eo.fn === listener.fn && eo.single === listener.single && eo.scope === listener.scope) {
                    e.splice(len, 1);
                    return eo;
                }
            }
        };
        //触发所有服务端方法回调
        me.fireActionBack = function (e) {
            try {
                var backMessage = $.evalJSON(e.data),
                        action = actions[backMessage.action],
                        event = {};
                $.extend(event, e);
                event.data = backMessage.data;
                if (action) {
                    for (var i = 0; i < action.length; i++) {
                        var ac = action[i];
                        ac.fn.call(ac.scope, event, me);
                        if (ac.single) {
                            action.splice(i, 1);
                            i--;
                        }
                    }
                }
            } catch (e) {
            }
        };
        me.on = me.addEventListener;
        me.un = me.removeEventListener;
        //初始化数据源方法
        //添加相关事件
        me.addEvents('connect', 'connected', 'message', 'disconnect', 'disconnected', 'error');
        /****
         * 添加一个在onmessage回调时执行的方法回调
         */
        me.addActionBack = function (action, fn, single, scope) {
            if (!actions[action]) {
                actions[action] = [];
            }
            actions[action].push({
                fn: fn,
                single: !(single === false),
                scope: scope || me
            });
        };
        /****
         *  移除一个onmessage方法回调
         */
        me.removeActionBack = function (action, fn, single, scope) {
            var act = {
                fn: fn,
                single: !(single === false),
                scope: scope || me
            },
                    ac = actions[action] || [],
                    len = ac.length;
            while (len) {
                len--;
                var resac = ac[len];
                if (resac.fn === act.fn && resac.single === act.single && resac.scope === act.scope) {
                    ac.splice(len, 1);
                    return resac;
                }
            }
        };

        me.send = function (data) {
            if (!me.connected) {
                return false;
            }
            var ds = me.dataSource;
            if (typeof data == 'string') {
                me.lastSendTime = new Date().getTime();
                return ds.send(data);
            } else if (typeof data == 'object') {
                var callback = data.callback,
                        action = data.action,
                        message = data.message || {};
                if (!action) {
                    return;
                }
                if (callback && typeof callback == 'function') {
                    // 回调
                    me.addActionBack(action, callback, data.single, data.scope);
                }
                if (typeof message == 'object') {
                    message.action = action;
                    message = $.toJSON(message);
                }
                return me.send(message);
            }
            return false;
        };

        me.connect = function () {
            if (me.dataSource) {
                return me.dataSource;
            }
            me.fireEvent('connect', me, url);
            var ws = me.dataSource = new m(url);
            ws.onopen = function (e) {
                if (ws.readyState === 1) {
                    me.connected = true;
                    me.fireEvent('connected', e, me, url);
                }
            };
            ws.onmessage = function (e) {
                me.lastMessageTime = new Date().getTime();
                me.fireActionBack(e);
                me.fireEvent('message', e, me);
            };
            ws.onclose = function (e) {
                me.connected = false;
                me.fireEvent('disconnected', e, me);
            };
            ws.onerror = function (e) {
                me.fireEvent('error', e, me);
            };
        };
        me.disconnect = function () {
            me.fireEvent('disconnect', me.dataSource);
            me.dataSource.close();
        };

    };
    socket.modules = {
        Native: w['MozWebSocket' in window ? 'MozWebSocket' : ( "WebSocket" in window ? 'WebSocket' : null )],
        priority: ['Native', 'FlashSocket', 'COMET']
    };
    s.io.Socket = socket;

    setInterval(sirm.deamon, 500);
})(window, sirm);



/**
 * calendar
 */
(function (s, w) {
    s.ns('sirm.ui').calendar = function (selector, params, dataurl, selecteventHandler) {
        var me = this;
        var cldroptions = {
            header: {
                left: 'prev,next',
                center: 'title',
                right: 'agendaDay,agendaWeek,month'
            },
            defaultView: 'month',
            editable: false,
            selectable: true,
            selectHelper: true,
            currentTimezone: 'Asia/Chongqing',
            monthNames:['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
            monthNamesShort:['01月','02月','03月','04月','05月','06月','07月','08月','09月','10月','11月','12月'],
            dayNames:['周日','周一','周二','周三','周四','周五','周六'],
            dayNamesShort:['日','一','二','三','四','五','六'],
            buttonText:{
                agendaDay:'天',
                agendaWeek:'周',
                month:'月'
            },
            titleFormat :{
                month: 'yyyy年 MMMM',                             // September 2009
                week: "yyyy年   MM月 dd日[ yyyy]{ '&#8212;'[ MM月] dd日}",
                day: 'yyyy年MM月dd日 dddd'
            },
            allDayText:'全天',
            select: selecteventHandler,
            events: dataurl
        };
        if (params != null){
            if (params.year != undefined && params.month != undefined && params.date != undefined){
                cldroptions["year"] = params.year;
                cldroptions["month"] = params.month;
                cldroptions["date"] = params.date;
            }
        }
        var _cldr = $(selector);
        me.cldr = _cldr.fullCalendar(cldroptions);
        if (me.refresh == undefined){
            me.refresh = function(){
                $(me.cldr).fullCalendar('refetchEvents');
            }
        }
        //return _cldr.fullCalendar(cldroptions);
    };

    s.ns('sirm.ui').worker = function(){
        var me = this;
        if (me.urls == undefined){
            me.urls = [];
        }

        if (me.load == undefined){
            me.load = function(actions){
                for(var i = 0; i < actions.length; i++){
                    var action = actions[i];
                    if (action.url != undefined){
                        $.ajax({
                            url : action.url,
                            async : false,
                            success : function(data){
                                $("body").append(data);
                            }
                        });
                    }
                }
            }
        }

        if (me.callback == undefined){
            me.callback = function(workOption){
                var callback = workOption.callback;
                if (callback != undefined){
                    if(typeof callback=="string"){
                        if (callback.indexOf("(") >= 0){
                            eval(callback);
                        }
                        else{
                            eval(callback + "()");
                        }
                    }
                    else{
                        callback();
                    }
                }
            }
        }

        if (me.action == undefined){
            me.action = function(workOption){
                var showtype = workOption.showtype;
                var url = workOption.url;
                if (url == undefined){
                    stk.alert("请指定URL!");
                    return;
                }

                if (showtype == "tab"){
                    sirm.openTab(url, workOption.title, {}, function(){
                        me.callback(workOption);
                    });
                }
                else{
                    me.callback(workOption);
                }
            }
        }
    };
})(sirm, window);