/*! Copyright (c) 2013 Brandon Aaron (http://brandon.aaron.sh)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Version: 3.1.12
 *
 * Requires: jQuery 1.2.2+
 */
!function (a) {
    "function" == typeof define && define.amd ? define(["jquery"], a) : "object" == typeof exports ? module.exports = a : a(jQuery)
}(function (a) {
    function b(b) {
        var g = b || window.event, h = i.call(arguments, 1), j = 0, l = 0, m = 0, n = 0, o = 0, p = 0;
        if (b = a.event.fix(g), b.type = "mousewheel", "detail"in g && (m = -1 * g.detail), "wheelDelta"in g && (m = g.wheelDelta), "wheelDeltaY"in g && (m = g.wheelDeltaY), "wheelDeltaX"in g && (l = -1 * g.wheelDeltaX), "axis"in g && g.axis === g.HORIZONTAL_AXIS && (l = -1 * m, m = 0), j = 0 === m ? l : m, "deltaY"in g && (m = -1 * g.deltaY, j = m), "deltaX"in g && (l = g.deltaX, 0 === m && (j = -1 * l)), 0 !== m || 0 !== l) {
            if (1 === g.deltaMode) {
                var q = a.data(this, "mousewheel-line-height");
                j *= q, m *= q, l *= q
            } else if (2 === g.deltaMode) {
                var r = a.data(this, "mousewheel-page-height");
                j *= r, m *= r, l *= r
            }
            if (n = Math.max(Math.abs(m), Math.abs(l)), (!f || f > n) && (f = n, d(g, n) && (f /= 40)), d(g, n) && (j /= 40, l /= 40, m /= 40), j = Math[j >= 1 ? "floor" : "ceil"](j / f), l = Math[l >= 1 ? "floor" : "ceil"](l / f), m = Math[m >= 1 ? "floor" : "ceil"](m / f), k.settings.normalizeOffset && this.getBoundingClientRect) {
                var s = this.getBoundingClientRect();
                o = b.clientX - s.left, p = b.clientY - s.top
            }
            return b.deltaX = l, b.deltaY = m, b.deltaFactor = f, b.offsetX = o, b.offsetY = p, b.deltaMode = 0, h.unshift(b, j, l, m), e && clearTimeout(e), e = setTimeout(c, 200), (a.event.dispatch || a.event.handle).apply(this, h)
        }
    }

    function c() {
        f = null
    }

    function d(a, b) {
        return k.settings.adjustOldDeltas && "mousewheel" === a.type && b % 120 === 0
    }

    var e, f, g = ["wheel", "mousewheel", "DOMMouseScroll", "MozMousePixelScroll"], h = "onwheel"in document || document.documentMode >= 9 ? ["wheel"] : ["mousewheel", "DomMouseScroll", "MozMousePixelScroll"], i = Array.prototype.slice;
    if (a.event.fixHooks)for (var j = g.length; j;)a.event.fixHooks[g[--j]] = a.event.mouseHooks;
    var k = a.event.special.mousewheel = {
        version: "3.1.12", setup: function () {
            if (this.addEventListener)for (var c = h.length; c;)this.addEventListener(h[--c], b, !1); else this.onmousewheel = b;
            a.data(this, "mousewheel-line-height", k.getLineHeight(this)), a.data(this, "mousewheel-page-height", k.getPageHeight(this))
        }, teardown: function () {
            if (this.removeEventListener)for (var c = h.length; c;)this.removeEventListener(h[--c], b, !1); else this.onmousewheel = null;
            a.removeData(this, "mousewheel-line-height"), a.removeData(this, "mousewheel-page-height")
        }, getLineHeight: function (b) {
            var c = a(b), d = c["offsetParent"in a.fn ? "offsetParent" : "parent"]();
            return d.length || (d = a("body")), parseInt(d.css("fontSize"), 10) || parseInt(c.css("fontSize"), 10) || 16
        }, getPageHeight: function (b) {
            return a(b).height()
        }, settings: {adjustOldDeltas: !0, normalizeOffset: !0}
    };
    a.fn.extend({
        mousewheel: function (a) {
            return a ? this.bind("mousewheel", a) : this.trigger("mousewheel")
        }, unmousewheel: function (a) {
            return this.unbind("mousewheel", a)
        }
    })
});
//json
(function ($) {
    $.toJSON = function (o) {
        if (typeof(JSON) == "object" && JSON.stringify) {
            return JSON.stringify(o)
        }
        var type = typeof(o);
        if (o === null) {
            return "null"
        }
        if (type == "undefined") {
            return undefined
        }
        if (type == "number" || type == "boolean") {
            return o + ""
        }
        if (type == "string") {
            return $.quoteString(o)
        }
        if (type == "object") {
            if (typeof o.toJSON == "function") {
                return $.toJSON(o.toJSON())
            }
            if (o.constructor === Date) {
                var month = o.getUTCMonth() + 1;
                if (month < 10) {
                    month = "0" + month
                }
                var day = o.getUTCDate();
                if (day < 10) {
                    day = "0" + day
                }
                var year = o.getUTCFullYear();
                var hours = o.getUTCHours();
                if (hours < 10) {
                    hours = "0" + hours
                }
                var minutes = o.getUTCMinutes();
                if (minutes < 10) {
                    minutes = "0" + minutes
                }
                var seconds = o.getUTCSeconds();
                if (seconds < 10) {
                    seconds = "0" + seconds
                }
                var milli = o.getUTCMilliseconds();
                if (milli < 100) {
                    milli = "0" + milli
                }
                if (milli < 10) {
                    milli = "0" + milli
                }
                return '"' + year + "-" + month + "-" + day + "T" + hours + ":" + minutes + ":" + seconds + "." + milli + 'Z"'
            }
            if (o.constructor === Array) {
                var ret = [];
                for (var i = 0; i < o.length; i++) {
                    ret.push($.toJSON(o[i]) || "null")
                }
                return "[" + ret.join(",") + "]"
            }
            var pairs = [];
            for (var k in o) {
                var name;
                var type = typeof k;
                if (type == "number") {
                    name = '"' + k + '"'
                } else {
                    if (type == "string") {
                        name = $.quoteString(k)
                    } else {
                        continue
                    }
                }
                if (typeof o[k] == "function") {
                    continue
                }
                var val = $.toJSON(o[k]);
                pairs.push(name + ":" + val)
            }
            return "{" + pairs.join(", ") + "}"
        }
    };
    $.evalJSON = function (src) {
        if (typeof(JSON) == "object" && JSON.parse) {
            return JSON.parse(src)
        }
        return eval("(" + src + ")")
    };
    $.secureEvalJSON = function (src) {
        if (typeof(JSON) == "object" && JSON.parse) {
            return JSON.parse(src)
        }
        var filtered = src;
        filtered = filtered.replace(/\\["\\\/bfnrtu]/g, "@");
        filtered = filtered.replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]");
        filtered = filtered.replace(/(?:^|:|,)(?:\s*\[)+/g, "");
        if (/^[\],:{}\s]*$/.test(filtered)) {
            return eval("(" + src + ")")
        } else {
            throw new SyntaxError("Error parsing JSON, source is not valid.")
        }
    };
    $.quoteString = function (string) {
        if (string.match(_escapeable)) {
            return '"' + string.replace(_escapeable, function (a) {
                    var c = _meta[a];
                    if (typeof c === "string") {
                        return c
                    }
                    c = a.charCodeAt();
                    return "\\u00" + Math.floor(c / 16).toString(16) + (c % 16).toString(16)
                }) + '"'
        }
        return '"' + string + '"'
    };
    var _escapeable = /["\\\x00-\x1f\x7f-\x9f]/g;
    var _meta = {"\b": "\\b", "\t": "\\t", "\n": "\\n", "\f": "\\f", "\r": "\\r", '"': '\\"', "\\": "\\\\"}
})(jQuery);
//clock
(function (a) {
    if (typeof STKClock == "undefined") {
        STKClock = new Object()
    }
    a.extend(a.fn, {
        calendarClock: function (b) {
            var c = a(this);
            c.html(STKClock.formatCalendarClock(b));
            window.setInterval(function () {
                if (b && b.date) {
                    b.date.setTime(b.date.getTime() + 1000)
                }
                c.html(STKClock.formatCalendarClock(b))
            }, 1000)
        }
    });
    a.extend(STKClock, {
        formatCalendarClock: function (o) {
            var b = a.extend({dateTimeFormat: "yyyy-MM-dd HH:mm:ss", date: new Date()}, o);
            var j = b.date.getFullYear();
            var m = b.date.getYear();
            var k = b.date.getMonth();
            var d = b.date.getDate();
            var n = b.date.getDay();
            var h = b.date.getHours();
            var g = b.date.getMinutes();
            var c = b.date.getSeconds();
            var f = b.date.getMilliseconds();
            var l = (h < 11.5) ? "AM" : "PM";
            var e = (h < 11.5) ? h : (h % 12);
            var i = b.dateTimeFormat.toString().replace(/yyyy/g, j).replace(/yy/g, m).replace(/MM/g, (((k + 1) < 10) ? "0" : "") + (k + 1)).replace(/M/g, (k + 1)).replace(/dd/g, ((d < 10) ? "0" : "") + d).replace(/d/g, d).replace(/HH/g, ((h < 10) ? "0" : "") + h).replace(/H/g, h).replace(/hh/g, ((e < 10) ? "0" : "") + e).replace(/h/g, e).replace(/mm/g, ((g < 10) ? "0" : "") + g).replace(/m/g, g).replace(/ss/g, ((c < 10) ? "0" : "") + c).replace(/s/g, c).replace(/S/g, f).replace(/TT/g, l.toUpperCase()).replace(/tt/g, l.toLowerCase()).replace(/T/g, l.charAt(0).toUpperCase()).replace(/t/g, l.charAt(0).toLowerCase());
            return i
        }
    })
})(jQuery);
/*
 * Poshy Tip jQuery plugin v1.2
 * http://vadikom.com/tools/poshy-tip-jquery-plugin-for-stylish-tooltips/
 * Copyright 2010-2013, Vasil Dinkov, http://vadikom.com/
 */
(function (e) {
    var a = [], d = /^url\(["']?([^"'\)]*)["']?\);?$/i, c = /\.png$/i, b = !!window.createPopup && document.documentElement.currentStyle.minWidth == "undefined";

    function f() {
        e.each(a, function () {
            this.refresh(true)
        })
    }

    e(window).resize(f);
    e.Poshytip = function (h, g) {
        this.$elm = e(h);
        this.opts = e.extend({}, e.fn.poshytip.defaults, g);
        this.$tip = e(['<div class="', this.opts.className, '">', '<div class="tip-inner tip-bg-image"></div>', '<div class="tip-arrow tip-arrow-top tip-arrow-right tip-arrow-bottom tip-arrow-left"></div>', "</div>"].join("")).appendTo(document.body);
        this.$arrow = this.$tip.find("div.tip-arrow");
        this.$inner = this.$tip.find("div.tip-inner");
        this.disabled = false;
        this.content = null;
        this.init()
    };
    e.Poshytip.prototype = {
        init: function () {
            a.push(this);
            var g = this.$elm.attr("title");
            this.$elm.data("title.poshytip", g !== undefined ? g : null).data("poshytip", this);
            if (this.opts.showOn != "none") {
                this.$elm.bind({
                    "mouseenter.poshytip": e.proxy(this.mouseenter, this),
                    "mouseleave.poshytip": e.proxy(this.mouseleave, this)
                });
                switch (this.opts.showOn) {
                    case"hover":
                        if (this.opts.alignTo == "cursor") {
                            this.$elm.bind("mousemove.poshytip", e.proxy(this.mousemove, this))
                        }
                        if (this.opts.allowTipHover) {
                            this.$tip.hover(e.proxy(this.clearTimeouts, this), e.proxy(this.mouseleave, this))
                        }
                        break;
                    case"focus":
                        this.$elm.bind({
                            "focus.poshytip": e.proxy(this.showDelayed, this),
                            "blur.poshytip": e.proxy(this.hideDelayed, this)
                        });
                        break
                }
            }
        }, mouseenter: function (g) {
            if (this.disabled) {
                return true
            }
            this.$elm.attr("title", "");
            if (this.opts.showOn == "focus") {
                return true
            }
            this.showDelayed()
        }, mouseleave: function (g) {
            if (this.disabled || this.asyncAnimating && (this.$tip[0] === g.relatedTarget || jQuery.contains(this.$tip[0], g.relatedTarget))) {
                return true
            }
            if (!this.$tip.data("active")) {
                var h = this.$elm.data("title.poshytip");
                if (h !== null) {
                    this.$elm.attr("title", h)
                }
            }
            if (this.opts.showOn == "focus") {
                return true
            }
            this.hideDelayed()
        }, mousemove: function (g) {
            if (this.disabled) {
                return true
            }
            this.eventX = g.pageX;
            this.eventY = g.pageY;
            if (this.opts.followCursor && this.$tip.data("active")) {
                this.calcPos();
                this.$tip.css({left: this.pos.l, top: this.pos.t});
                if (this.pos.arrow) {
                    this.$arrow[0].className = "tip-arrow tip-arrow-" + this.pos.arrow
                }
            }
        }, show: function () {
            if (this.disabled || this.$tip.data("active")) {
                return
            }
            this.reset();
            this.update();
            if (!this.content) {
                return
            }
            this.display();
            if (this.opts.timeOnScreen) {
                this.hideDelayed(this.opts.timeOnScreen)
            }
        }, showDelayed: function (g) {
            this.clearTimeouts();
            this.showTimeout = setTimeout(e.proxy(this.show, this), typeof g == "number" ? g : this.opts.showTimeout)
        }, hide: function () {
            if (this.disabled || !this.$tip.data("active")) {
                return
            }
            this.display(true)
        }, hideDelayed: function (g) {
            this.clearTimeouts();
            this.hideTimeout = setTimeout(e.proxy(this.hide, this), typeof g == "number" ? g : this.opts.hideTimeout)
        }, reset: function () {
            this.$tip.queue([]).detach().css("visibility", "hidden").data("active", false);
            this.$inner.find("*").poshytip("hide");
            if (this.opts.fade) {
                this.$tip.css("opacity", this.opacity)
            }
            this.$arrow[0].className = "tip-arrow tip-arrow-top tip-arrow-right tip-arrow-bottom tip-arrow-left";
            this.asyncAnimating = false
        }, update: function (j, k) {
            if (this.disabled) {
                return
            }
            var i = j !== undefined;
            if (i) {
                if (!k) {
                    this.opts.content = j
                }
                if (!this.$tip.data("active")) {
                    return
                }
            } else {
                j = this.opts.content
            }
            var h = this, g = typeof j == "function" ? j.call(this.$elm[0], function (l) {
                h.update(l)
            }) : j == "[title]" ? this.$elm.data("title.poshytip") : j;
            if (this.content !== g) {
                this.$inner.empty().append(g);
                this.content = g
            }
            this.refresh(i)
        }, refresh: function (h) {
            if (this.disabled) {
                return
            }
            if (h) {
                if (!this.$tip.data("active")) {
                    return
                }
                var k = {left: this.$tip.css("left"), top: this.$tip.css("top")}
            }
            this.$tip.css({left: 0, top: 0}).appendTo(document.body);
            if (this.opacity === undefined) {
                this.opacity = this.$tip.css("opacity")
            }
            var l = this.$tip.css("background-image").match(d), m = this.$arrow.css("background-image").match(d);
            if (l) {
                var i = c.test(l[1]);
                if (b && i) {
                    this.$tip.css("background-image", "none");
                    this.$inner.css({margin: 0, border: 0, padding: 0});
                    l = i = false
                } else {
                    this.$tip.prepend('<table class="tip-table" border="0" cellpadding="0" cellspacing="0"><tr><td class="tip-top tip-bg-image" colspan="2"><span></span></td><td class="tip-right tip-bg-image" rowspan="2"><span></span></td></tr><tr><td class="tip-left tip-bg-image" rowspan="2"><span></span></td><td></td></tr><tr><td class="tip-bottom tip-bg-image" colspan="2"><span></span></td></tr></table>').css({
                        border: 0,
                        padding: 0,
                        "background-image": "none",
                        "background-color": "transparent"
                    }).find(".tip-bg-image").css("background-image", 'url("' + l[1] + '")').end().find("td").eq(3).append(this.$inner)
                }
                if (i && !e.support.opacity) {
                    this.opts.fade = false
                }
            }
            if (m && !e.support.opacity) {
                if (b && c.test(m[1])) {
                    m = false;
                    this.$arrow.css("background-image", "none")
                }
                this.opts.fade = false
            }
            var o = this.$tip.find("> table.tip-table");
            if (b) {
                this.$tip[0].style.width = "";
                o.width("auto").find("td").eq(3).width("auto");
                var n = this.$tip.width(), j = parseInt(this.$tip.css("min-width")), g = parseInt(this.$tip.css("max-width"));
                if (!isNaN(j) && n < j) {
                    n = j
                } else {
                    if (!isNaN(g) && n > g) {
                        n = g
                    }
                }
                this.$tip.add(o).width(n).eq(0).find("td").eq(3).width("100%")
            } else {
                if (o[0]) {
                    o.width("auto").find("td").eq(3).width("auto").end().end().width(document.defaultView && document.defaultView.getComputedStyle && parseFloat(document.defaultView.getComputedStyle(this.$tip[0], null).width) || this.$tip.width()).find("td").eq(3).width("100%")
                }
            }
            this.tipOuterW = this.$tip.outerWidth();
            this.tipOuterH = this.$tip.outerHeight();
            this.calcPos();
            if (m && this.pos.arrow) {
                this.$arrow[0].className = "tip-arrow tip-arrow-" + this.pos.arrow;
                this.$arrow.css("visibility", "inherit")
            }
            if (h && this.opts.refreshAniDuration) {
                this.asyncAnimating = true;
                var p = this;
                this.$tip.css(k).animate({
                    left: this.pos.l,
                    top: this.pos.t
                }, this.opts.refreshAniDuration, function () {
                    p.asyncAnimating = false
                })
            } else {
                this.$tip.css({left: this.pos.l, top: this.pos.t})
            }
        }, display: function (h) {
            var i = this.$tip.data("active");
            if (i && !h || !i && h) {
                return
            }
            this.$tip.stop();
            if ((this.opts.slide && this.pos.arrow || this.opts.fade) && (h && this.opts.hideAniDuration || !h && this.opts.showAniDuration)) {
                var n = {}, m = {};
                if (this.opts.slide && this.pos.arrow) {
                    var l, g;
                    if (this.pos.arrow == "bottom" || this.pos.arrow == "top") {
                        l = "top";
                        g = "bottom"
                    } else {
                        l = "left";
                        g = "right"
                    }
                    var k = parseInt(this.$tip.css(l));
                    n[l] = k + (h ? 0 : (this.pos.arrow == g ? -this.opts.slideOffset : this.opts.slideOffset));
                    m[l] = k + (h ? (this.pos.arrow == g ? this.opts.slideOffset : -this.opts.slideOffset) : 0) + "px"
                }
                if (this.opts.fade) {
                    n.opacity = h ? this.$tip.css("opacity") : 0;
                    m.opacity = h ? 0 : this.opacity
                }
                this.$tip.css(n).animate(m, this.opts[h ? "hideAniDuration" : "showAniDuration"])
            }
            h ? this.$tip.queue(e.proxy(this.reset, this)) : this.$tip.css("visibility", "inherit");
            if (i) {
                var j = this.$elm.data("title.poshytip");
                if (j !== null) {
                    this.$elm.attr("title", j)
                }
            }
            this.$tip.data("active", !i)
        }, disable: function () {
            this.reset();
            this.disabled = true
        }, enable: function () {
            this.disabled = false
        }, destroy: function () {
            this.reset();
            this.$tip.remove();
            delete this.$tip;
            this.content = null;
            this.$elm.unbind(".poshytip").removeData("title.poshytip").removeData("poshytip");
            a.splice(e.inArray(this, a), 1)
        }, clearTimeouts: function () {
            if (this.showTimeout) {
                clearTimeout(this.showTimeout);
                this.showTimeout = 0
            }
            if (this.hideTimeout) {
                clearTimeout(this.hideTimeout);
                this.hideTimeout = 0
            }
        }, calcPos: function () {
            var n = {l: 0, t: 0, arrow: ""}, h = e(window), k = {
                l: h.scrollLeft(),
                t: h.scrollTop(),
                w: h.width(),
                h: h.height()
            }, p, j, m, i, q, g;
            if (this.opts.alignTo == "cursor") {
                p = j = m = this.eventX;
                i = q = g = this.eventY
            } else {
                var o = this.$elm.offset(), l = {
                    l: o.left,
                    t: o.top,
                    w: this.$elm.outerWidth(),
                    h: this.$elm.outerHeight()
                };
                p = l.l + (this.opts.alignX != "inner-right" ? 0 : l.w);
                j = p + Math.floor(l.w / 2);
                m = p + (this.opts.alignX != "inner-left" ? l.w : 0);
                i = l.t + (this.opts.alignY != "inner-bottom" ? 0 : l.h);
                q = i + Math.floor(l.h / 2);
                g = i + (this.opts.alignY != "inner-top" ? l.h : 0)
            }
            switch (this.opts.alignX) {
                case"right":
                case"inner-left":
                    n.l = m + this.opts.offsetX;
                    if (this.opts.keepInViewport && n.l + this.tipOuterW > k.l + k.w) {
                        n.l = k.l + k.w - this.tipOuterW
                    }
                    if (this.opts.alignX == "right" || this.opts.alignY == "center") {
                        n.arrow = "left"
                    }
                    break;
                case"center":
                    n.l = j - Math.floor(this.tipOuterW / 2);
                    if (this.opts.keepInViewport) {
                        if (n.l + this.tipOuterW > k.l + k.w) {
                            n.l = k.l + k.w - this.tipOuterW
                        } else {
                            if (n.l < k.l) {
                                n.l = k.l
                            }
                        }
                    }
                    break;
                default:
                    n.l = p - this.tipOuterW - this.opts.offsetX;
                    if (this.opts.keepInViewport && n.l < k.l) {
                        n.l = k.l
                    }
                    if (this.opts.alignX == "left" || this.opts.alignY == "center") {
                        n.arrow = "right"
                    }
            }
            switch (this.opts.alignY) {
                case"bottom":
                case"inner-top":
                    n.t = g + this.opts.offsetY;
                    if (!n.arrow || this.opts.alignTo == "cursor") {
                        n.arrow = "top"
                    }
                    if (this.opts.keepInViewport && n.t + this.tipOuterH > k.t + k.h) {
                        n.t = i - this.tipOuterH - this.opts.offsetY;
                        if (n.arrow == "top") {
                            n.arrow = "bottom"
                        }
                    }
                    break;
                case"center":
                    n.t = q - Math.floor(this.tipOuterH / 2);
                    if (this.opts.keepInViewport) {
                        if (n.t + this.tipOuterH > k.t + k.h) {
                            n.t = k.t + k.h - this.tipOuterH
                        } else {
                            if (n.t < k.t) {
                                n.t = k.t
                            }
                        }
                    }
                    break;
                default:
                    n.t = i - this.tipOuterH - this.opts.offsetY;
                    if (!n.arrow || this.opts.alignTo == "cursor") {
                        n.arrow = "bottom"
                    }
                    if (this.opts.keepInViewport && n.t < k.t) {
                        n.t = g + this.opts.offsetY;
                        if (n.arrow == "bottom") {
                            n.arrow = "top"
                        }
                    }
            }
            this.pos = n
        }
    };
    e.fn.poshytip = function (h) {
        if (typeof h == "string") {
            var g = arguments, l = h;
            Array.prototype.shift.call(g);
            if (l == "destroy") {
                this.die ? this.die("mouseenter.poshytip").die("focus.poshytip") : e(document).undelegate(this.selector, "mouseenter.poshytip").undelegate(this.selector, "focus.poshytip")
            }
            return this.each(function () {
                var m = e(this).data("poshytip");
                if (m && m[l]) {
                    m[l].apply(m, g)
                }
            })
        }
        var j = e.extend({}, e.fn.poshytip.defaults, h);
        if (!e("#poshytip-css-" + j.className)[0]) {
            e(['<style id="poshytip-css-', j.className, '" type="text/css">', "div.", j.className, "{visibility:hidden;position:absolute;top:0;left:0;}", "div.", j.className, " table.tip-table, div.", j.className, " table.tip-table td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;vertical-align:middle;}", "div.", j.className, " td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:", j.bgImageFrameSize, "px;width:", j.bgImageFrameSize, "px;overflow:hidden;}", "div.", j.className, " td.tip-right{background-position:100% 0;}", "div.", j.className, " td.tip-bottom{background-position:100% 100%;}", "div.", j.className, " td.tip-left{background-position:0 100%;}", "div.", j.className, " div.tip-inner{background-position:-", j.bgImageFrameSize, "px -", j.bgImageFrameSize, "px;}", "div.", j.className, " div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}", "</style>"].join("")).appendTo("head")
        }
        if (j.liveEvents && j.showOn != "none") {
            var i, k = e.extend({}, j, {liveEvents: false});
            switch (j.showOn) {
                case"hover":
                    i = function () {
                        var m = e(this);
                        if (!m.data("poshytip")) {
                            m.poshytip(k).poshytip("mouseenter")
                        }
                    };
                    this.live ? this.live("mouseenter.poshytip", i) : e(document).delegate(this.selector, "mouseenter.poshytip", i);
                    break;
                case"focus":
                    i = function () {
                        var m = e(this);
                        if (!m.data("poshytip")) {
                            m.poshytip(k).poshytip("showDelayed")
                        }
                    };
                    this.live ? this.live("focus.poshytip", i) : e(document).delegate(this.selector, "focus.poshytip", i);
                    break
            }
            return this
        }
        return this.each(function () {
            new e.Poshytip(this, j)
        })
    };
    e.fn.poshytip.defaults = {
        content: "[title]",
        className: "tip-yellow",
        bgImageFrameSize: 10,
        showTimeout: 500,
        hideTimeout: 100,
        timeOnScreen: 0,
        showOn: "hover",
        liveEvents: false,
        alignTo: "cursor",
        alignX: "right",
        alignY: "top",
        offsetX: -22,
        offsetY: 18,
        keepInViewport: true,
        allowTipHover: true,
        followCursor: false,
        fade: true,
        slide: true,
        slideOffset: 8,
        showAniDuration: 300,
        hideAniDuration: 300,
        refreshAniDuration: 200
    }
})(jQuery);
/*!
 * jquery.event.drag - v2.2.2
 * Copyright (c) 2010 Three Dub Media - http://threedubmedia.com
 * Open Source MIT License - http://threedubmedia.com/code/license
 *
 * https://github.com/richardscarrott/jquery.threedubmedia
 */
// Created: 2008-06-04
// Updated: 2012-05-21
// Updated: 2013-01-08
// Updated: 2013-02-25 (richardscarrott)
// REQUIRES: jquery 1.8+

(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery'], factory);
    } else if (typeof exports === 'object') {
        // Node. Does not work with strict CommonJS, but
        // only CommonJS-like environments that support module.exports,
        // like Node.
        factory(require('jquery'));
    } else {
        // Browser globals
        factory(root.jQuery);
    }
}(this, function ($) {

// add the jquery instance method
    $.fn.drag = function (str, arg, opts) {
        // figure out the event type
        var type = typeof str == "string" ? str : "";
        // figure out the event handler...
        var fn = $.isFunction(str) ? str : $.isFunction(arg) ? arg : null;
        // fix the event type
        if (type.indexOf("drag") !== 0) {
            type = "drag" + type;
        }
        // were options passed
        opts = ( str == fn ? arg : opts ) || {};
        // trigger or bind event handler
        return fn ? this.bind(type, opts, fn) : this.trigger(type);
    };

// local refs (increase compression)
    var $event = $.event;
    var $special = $event.special;
// configure the drag special event
    var drag = $special.drag = {

        // these are the default settings
        defaults: {
            which: 1, // mouse button pressed to start drag sequence
            distance: 1, // distance dragged before dragstart
            not: ':input', // selector to suppress dragging on target elements
            handle: null, // selector to match handle target elements
            relative: false, // true to use "position", false to use "offset"
            drop: true, // false to suppress drop events, true or selector to allow
            click: false, // false to suppress click events after dragend (no proxy)
            axis: null // "x" or "y" to indicate which axis the drag event is interested in and consequently whether
            // scrolling on touch devices will be prevented
        },

        // the key name for stored drag data
        datakey: "dragdata",

        // prevent bubbling for better performance
        noBubble: true,

        // count bound related events
        add: function (obj) {
            // read the interaction data
            var data = $.data(this, drag.datakey),
            // read any passed options
                opts = obj.data || {};
            // count another realted event
            data.related += 1;
            // extend data options bound with this event
            // don't iterate "opts" in case it is a node
            $.each(drag.defaults, function (key, def) {
                if (opts[key] !== undefined) {
                    data[key] = opts[key];
                }
            });
        },

        // forget unbound related events
        remove: function () {
            $.data(this, drag.datakey).related -= 1;
        },

        // configure interaction, capture settings
        setup: function () {
            // check for related events
            if ($.data(this, drag.datakey)) {
                return;
            }
            // initialize the drag data with copied defaults
            var data = $.extend({related: 0}, drag.defaults);
            // store the interaction data
            $.data(this, drag.datakey, data);
            // bind the mousedown event, which starts drag interactions
            $event.add(this, "touchstart mousedown MSPointerDown", drag.init, data);
            // prevent image dragging in IE...
            if (this.attachEvent) {
                this.attachEvent("ondragstart", drag.dontstart);
            }
        },

        // destroy configured interaction
        teardown: function () {
            var data = $.data(this, drag.datakey) || {};
            // check for related events
            if (data.related) {
                return;
            }
            // remove the stored data
            $.removeData(this, drag.datakey);
            // remove the mousedown event
            $event.remove(this, "touchstart mousedown MSPointerDown", drag.init);
            // enable text selection
            drag.textselect(true);
            // un-prevent image dragging in IE...
            if (this.detachEvent) {
                this.detachEvent("ondragstart", drag.dontstart);
            }
        },

        // initialize the interaction
        init: function (event) {
            // sorry, only one touch at a time
            if (drag.touched) {
                return;
            }
            // the drag/drop interaction data
            var dd = event.data, results;
            // check the which directive
            if (event.which != 0 && dd.which > 0 && event.which != dd.which) {
                return;
            }
            // check for suppressed selector
            if ($(event.target).is(dd.not)) {
                return;
            }
            // check for handle selector
            if (dd.handle && !$(event.target).closest(dd.handle, event.currentTarget).length) {
                return;
            }

            drag.touched = (event.type == 'touchstart' || event.type == 'MSPointerDown') ? this : null;
            drag.touchedMSPointer = event.type == 'MSPointerDown';
            dd.propagates = 1;
            dd.mousedown = this;
            dd.interactions = [drag.interaction(this, dd)];
            dd.target = event.target;
            dd.pageX = event.pageX;
            dd.pageY = event.pageY;
            dd.startEvent = event;
            dd.dragging = null;
            // handle draginit event...
            results = drag.hijack(event, "draginit", dd);
            // early cancel
            if (!dd.propagates) {
                return;
            }
            // flatten the result set
            results = drag.flatten(results);
            // insert new interaction elements
            if (results && results.length) {
                dd.interactions = [];
                $.each(results, function () {
                    dd.interactions.push(drag.interaction(this, dd));
                });
            }
            // remember how many interactions are propagating
            dd.propagates = dd.interactions.length;
            // locate and init the drop targets
            if (dd.drop !== false && $special.drop) {
                $special.drop.handler(event, dd);
            }
            // disable text selection
            drag.textselect(false);
            // bind additional events...
            if (drag.touchedMSPointer) {
                $event.add(document, "MSPointerMove MSPointerUp MSPointerCancel", drag.handler, dd);
            } else if (drag.touched) {
                $event.add(drag.touched, "touchmove touchend", drag.handler, dd);
            } else {
                $event.add(document, "mousemove mouseup", drag.handler, dd);
            }
            // helps prevent text selection or scrolling
            if (!drag.touched || dd.live)
                return false;
        },

        // returns an interaction object
        interaction: function (elem, dd) {
            var offset = $(elem)[dd.relative ? "position" : "offset"]() || {top: 0, left: 0};
            return {
                drag: elem,
                drop: null,
                callback: new drag.callback(),
                droppable: [],
                offset: offset,
                proxy: null,
                results: [],
                cancelled: false
            };
        },

        // handle drag-releatd DOM events
        handler: function (event) {
            // read the data before hijacking anything
            var dd = event.data;
            // handle various events
            switch (event.type) {
                // mousemove, check distance, start dragging
                case !dd.dragging && 'touchmove':
                case !dd.dragging && 'MSPointerMove':
                    event.preventDefault();
                    dd.startEvent.preventDefault();
                //! fall through!
                case !dd.dragging && 'mousemove':
                    //  drag tolerance, x² + y² = distance²
                    if (Math.pow(event.pageX - dd.pageX, 2) + Math.pow(event.pageY - dd.pageY, 2) < Math.pow(dd.distance, 2)) {
                        break; // distance tolerance not reached
                    }
                    event.target = dd.target; // force target from "mousedown" event (fix distance issue)
                    // make sure dragstart event carries the coordinates, etc. from the original mousedown/touchstart that started the drag:
                    var start_event = new jQuery.Event(dd.startEvent.type, dd.startEvent);
                    // forget the event result from when it was used in draginit, for recycling
                    delete start_event.result;
                    drag.hijack(start_event, "dragstart", dd); // trigger "dragstart"
                    if (dd.propagates) {   // "dragstart" not rejected
                        dd.dragging = true; // activate interaction
                    }
                //! fall through!
                // mousemove, dragging
                case 'MSPointerMove':
                case 'touchmove':
                    if (dd.axis === 'x') {
                        if (Math.abs(event.pageX - dd.pageX) >= Math.abs(event.pageY - dd.pageY)) {
                            event.preventDefault();
                        }
                    }
                    else if (dd.axis === 'y') {
                        if (Math.abs(event.pageX - dd.pageX) <= Math.abs(event.pageY - dd.pageY)) {
                            event.preventDefault();
                        }
                    }
                    else {
                        event.preventDefault();
                    }
                case 'mousemove':
                    if (dd.dragging) {
                        // trigger "drag"
                        drag.hijack(event, "drag", dd);
                        if (dd.propagates) {
                            // manage drop events
                            if (dd.drop !== false && $special.drop) {
                                $special.drop.handler(event, dd); // "dropstart", "dropend"
                            }
                            break; // "drag" not rejected, stop
                        }
                        event.type = "mouseup"; // helps "drop" handler behave
                    }
                // mouseup, stop dragging
                case 'MSPointerUp':
                case 'MSPointerCancel':
                case 'touchend':
                case 'mouseup':
                default:
                    if (drag.touchedMSPointer) {
                        $event.remove(document, "MSPointerMove MSPointerUp MSPointerCancel", drag.handler); // remove touch events
                    } else if (drag.touched && !drag.touchedMSPointer) {
                        $event.remove(drag.touched, "touchmove touchend", drag.handler); // remove touch events
                    } else {
                        $event.remove(document, "mousemove mouseup", drag.handler); // remove page events
                    }
                    if (dd.dragging) {
                        if (dd.drop !== false && $special.drop) {
                            $special.drop.handler(event, dd); // "drop"
                        }
                        drag.hijack(event, "dragend", dd); // trigger "dragend"
                    }
                    drag.textselect(true); // enable text selection
                    // if suppressing click events...
                    if (dd.click === false && dd.dragging) {
                        $.data(dd.mousedown, "suppress.click", event.timeStamp || (event.originalEvent && event.originalEvent.timeStamp) || (new Date().getTime() + 5));
                    }
                    dd.dragging = drag.touched = drag.touchedMSPointer = false; // deactivate element
                    break;
            }
        },

        // re-use event object for custom events
        //
        // Note: hijack() is expected to *always* return an Array, even if only an empty one!
        hijack: function (event, type, dd, x, elem) {
            // not configured
            if (!dd) {
                return [];
            }
            // remember the original event and type
            var orig = {
                    event: event.originalEvent,
                    type: event.type
                },
            // is the event drag related or drog related?
                mode = type.indexOf("drop") ? "drag" : "drop",
            // iteration vars
                i = x || 0,
                ia, $elems, callback,
                len = !isNaN(x) ? x : dd.interactions.length;
            // modify the event type
            event.type = type;
            // remove the original event
            event.originalEvent = null;
            // initialize the results
            dd.results = [];
            // handle each interacted element
            do {
                if (ia = dd.interactions[i]) {
                    // validate the interaction
                    if (type !== "dragend" && ia.cancelled) {
                        continue;
                    }
                    // set the dragdrop properties on the event object
                    callback = drag.properties(event, dd, ia);
                    // prepare for more results
                    ia.results = [];
                    // handle each element
                    $(elem || ia[mode] || dd.droppable).each(function (p, subject) {
                        var result;
                        // identify drag or drop targets individually
                        callback.target = subject;
                        // force propagation of the custom event
                        event.isPropagationStopped = function () {
                            return false;
                        };
                        event.isImmediatePropagationStopped = function () {
                            return false;
                        };
                        // handle the event
                        result = subject ? $event.dispatch.call(subject, event, callback) : null;
                        // stop the drag interaction for this element
                        if (result === false) {
                            if (mode === "drag") {
                                ia.cancelled = true;
                                dd.propagates -= 1;
                            }
                            if (type === "drop") {
                                ia[mode][p] = null;
                            }
                        }
                        // assign any dropinit elements
                        else if (type === "dropinit") {
                            ia.droppable.push(drag.element(result) || subject);
                        }
                        // accept a returned proxy element
                        if (type === "dragstart") {
                            ia.proxy = $(drag.element(result) || ia.drag)[0];
                        }
                        // remember this result
                        ia.results.push(drag.element(result) || subject);
                        // forget the event result, for recycling
                        delete event.result;
                        // break on cancelled handler
                        if (type !== "dropinit") {
                            return result;
                        }
                        return true;
                    });
                    // flatten the results
                    dd.results[i] = drag.flatten(ia.results);
                    // accept a set of valid drop targets
                    if (type === "dropinit") {
                        ia.droppable = drag.flatten(ia.droppable);
                    }
                    // locate drop targets
                    if (type === "dragstart" && !ia.cancelled) {
                        callback.update();
                    }
                }
            } while (++i < len);
            // restore the original event & type
            event.type = orig.type;
            event.originalEvent = orig.event;
            // return all handler results
            return drag.flatten(dd.results);
        },

        // extend the callback object with drag/drop properties...
        properties: function (event, dd, ia) {
            var obj = ia.callback;
            // elements
            obj.drag = ia.drag;
            obj.proxy = ia.proxy || ia.drag;
            // starting mouse position
            obj.startX = dd.pageX;
            obj.startY = dd.pageY;
            // current distance dragged
            obj.deltaX = event.pageX - dd.pageX;
            obj.deltaY = event.pageY - dd.pageY;
            // original element position
            obj.originalX = ia.offset.left;
            obj.originalY = ia.offset.top;
            // adjusted element position
            obj.offsetX = obj.originalX + obj.deltaX;
            obj.offsetY = obj.originalY + obj.deltaY;
            // assign the drop targets information
            obj.drop = drag.flatten(( ia.drop || [] ).slice());
            obj.available = drag.flatten(( ia.droppable || [] ).slice());
            return obj;
        },

        // Determine if the argument is an element or jquery instance and only pass it through when it is, otherwise produce `undefined` instead
        element: function (arg) {
            if (arg && ( arg.jquery || arg.nodeType === 1 )) {
                return arg;
            }
            return undefined;
        },

        // flatten nested jquery objects and arrays into a single dimension array
        flatten: function (arr) {
            return $.map(arr, function (member) {
                return member && member.jquery ? $.makeArray(member) :
                    member && member.length ? drag.flatten(member) : member;
            });
        },

        // toggles text selection attributes ON (true) or OFF (false)
        textselect: function (bool) {
            $(document)[bool ? "unbind" : "bind"]("selectstart", drag.dontstart)
                .css("MozUserSelect", bool ? "" : "none");
            // .attr("unselectable", bool ? "off" : "on" )
            document.unselectable = bool ? "off" : "on";
        },

        // suppress "selectstart" and "ondragstart" events
        dontstart: function () {
            return false;
        },

        // a callback instance contructor
        callback: function () {
        }
    };

// callback methods
    drag.callback.prototype = {
        update: function () {
            if ($special.drop && this.available.length) {
                $.each(this.available, function (i) {
                    $special.drop.locate(this, i);
                });
            }
        }
    };

    if (!$special.click) {
        $special.click = {};
    }

    var $clickPreDispatch = $special.click.preDispatch;

    $special.click.preDispatch = function (event) {

        // Hook to allow supression of clicks after a drag.
        var evt_ts = (event.timeStamp || (event.originalEvent && event.originalEvent.timeStamp) || (new Date().getTime()) ) - 50;
        if ($.data(this, "suppress.click") >= evt_ts) {
            $.removeData(this, "suppress.click");
            return false;
        }

        if ($clickPreDispatch) {
            return $clickPreDispatch.apply(this, arguments);
        }
    };


// event fix hooks for MS pointer (IE10) events...
    var msPointerHooks =
        $event.fixHooks.MSPointerMove =
            $event.fixHooks.MSPointerUp =
                $event.fixHooks.MSPointerDown = {
                    props: "clientX clientY pageX pageY screenX screenY".split(" "),
                    filter: function (event, orig) {
                        if (orig) {
                            $.each(msPointerHooks.props, function (i, prop) {
                                event[prop] = orig[prop];
                            });
                        }
                        return event;
                    }
                };

// event fix hooks for touch events...
    var touchHooks =
        $event.fixHooks.touchstart =
            $event.fixHooks.touchmove =
                $event.fixHooks.touchend =
                    $event.fixHooks.touchcancel = {
                        props: "clientX clientY pageX pageY screenX screenY".split(" "),
                        filter: function (event, orig) {
                            if (orig) {
                                var touched = ( orig.touches && orig.touches[0] )
                                    || ( orig.changedTouches && orig.changedTouches[0] )
                                    || null;
                                // iOS webkit: touchstart, touchmove, touchend
                                if (touched) {
                                    $.each(touchHooks.props, function (i, prop) {
                                        event[prop] = touched[prop];
                                    });
                                }
                            }
                            return event;
                        }
                    };

// share the same special event configuration with related events...
    $special.draginit = $special.dragstart = $special.dragend = drag;

}));		// UMD wrapper end
/*!
 * jquery.event.drag.live - v 2.2.2
 * Copyright (c) 2010 Three Dub Media - http://threedubmedia.com
 * Open Source MIT License - http://threedubmedia.com/code/license
 */
// Created: 2010-06-07
// Updated: 2012-05-21
// REQUIRES: jquery 1.8+, event.drag 2.2.2+

(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery', 'jquery.event.drag'], factory);
    } else if (typeof exports === 'object') {
        // Node. Does not work with strict CommonJS, but
        // only CommonJS-like environments that support module.exports,
        // like Node.
        factory(require('jquery'), require('jquery.event.drag'));
    } else {
        // Browser globals
        factory(root.jQuery);
    }
}(this, function ($) {

// local refs (increase compression)
    var $event = $.event;
// ref the special event config
    var drag = $event.special.drag;
// old drag event add method
    var origadd = drag.add;
// old drag event teardown method
    var origteardown = drag.teardown;

// allow events to bubble for delegation
    drag.noBubble = false;

// the namespace for internal live events
    drag.livekey = "livedrag";

// new drop event add method
    drag.add = function (obj) {
        // call the old method
        origadd.apply(this, arguments);
        // read the data
        var data = $.data(this, drag.datakey);
        // bind the live "draginit" delegator
        if (!data.live && obj.selector) {
            data.live = true;
            $event.add(this, "draginit." + drag.livekey, drag.delegate);
        }
    };

// new drop event teardown method
    drag.teardown = function () {
        // call the old method
        origteardown.apply(this, arguments);
        // read the data
        var data = $.data(this, drag.datakey) || {};
        // bind the live "draginit" delegator
        if (data.live) {
            // remove the "live" delegation
            $event.remove(this, "draginit." + drag.livekey, drag.delegate);
            data.live = false;
        }
    };

// identify potential delegate elements
    drag.delegate = function (event) {
        // local refs
        var elems = [], target,
        // element event structure
            events = ($._data || $.data)(this, "events") || {};
        // query live events
        $.each(events || [], function (key, arr) {
            // no event type matches
            if (key.indexOf("drag") !== 0) {
                return;
            }
            $.each(arr || [], function (i, obj) {
                // locate the element to delegate
                target = $(event.target).closest(obj.selector, event.currentTarget)[0];
                // no element found
                if (!target) {
                    return;
                }
                // add an event handler
                $event.add(target, obj.origType + '.' + drag.livekey, obj.origHandler || obj.handler, obj.data);
                // remember new elements
                if ($.inArray(target, elems) < 0) {
                    elems.push(target);
                }
            });
        });
        // if there are no elements, break
        if (!elems.length) {
            return false;
        }
        // return the matched results, and clenup when complete
        return $(elems).bind("dragend." + drag.livekey, function () {
            $event.remove(this, "." + drag.livekey); // cleanup delegation
        });
    };

}));		// UMD wrapper end
//colourPicker
(function (a) {
    a.fn.colorSelect = function (g) {
        if (this.length < 1) {
            return
        }
        g = a.extend({color: "#000000", title: null}, g);
        var d = this;
        if (d.val().length > 0) {
            g.color = d.val()
        }
        var o, q, r;
        if (g.simple) {
            o = a("<div></div>", {"class": "html_colorpane_s"}).appendTo("body")
        } else {
            o = a("<div></div>", {"class": "html_colorpane"}).appendTo("body")
        }
        var t = ["00", "33", "66", "99", "cc", "ff"];
        var c = ["ff0000", "00ff00", "0000ff", "ffff00", "00ffff", "ff00ff"];
        r = "";
        if (g.simple) {
            r += '<div class="ke-menu" ><table class="ke-colorpicker-table" cellpadding="0" cellspacing="0" border="0"><tbody><tr><td class="ke-colorpicker-cell" title="#E53333"><div class="ke-colorpicker-cell-color" style="background-color: rgb(229, 51, 51); "></div></td><td class="ke-colorpicker-cell" title="#E56600"><div class="ke-colorpicker-cell-color" style="background-color: rgb(229, 102, 0); "></div></td><td class="ke-colorpicker-cell" title="#FF9900"><div class="ke-colorpicker-cell-color" style="background-color: rgb(255, 153, 0); "></div></td><td class="ke-colorpicker-cell" title="#64451D"><div class="ke-colorpicker-cell-color" style="background-color: rgb(100, 69, 29); "></div></td><td class="ke-colorpicker-cell" title="#DFC5A4"><div class="ke-colorpicker-cell-color" style="background-color: rgb(223, 197, 164); "></div></td><td class="ke-colorpicker-cell" title="#FFE500"><div class="ke-colorpicker-cell-color" style="background-color: rgb(255, 229, 0); "></div></td></tr><tr><td class="ke-colorpicker-cell" title="#009900"><div class="ke-colorpicker-cell-color" style="background-color: rgb(0, 153, 0); "></div></td><td class="ke-colorpicker-cell" title="#006600"><div class="ke-colorpicker-cell-color" style="background-color: rgb(0, 102, 0); "></div></td><td class="ke-colorpicker-cell" title="#99BB00"><div class="ke-colorpicker-cell-color" style="background-color: rgb(153, 187, 0); "></div></td><td class="ke-colorpicker-cell" title="#B8D100"><div class="ke-colorpicker-cell-color" style="background-color: rgb(184, 209, 0); "></div></td><td class="ke-colorpicker-cell" title="#60D978"><div class="ke-colorpicker-cell-color" style="background-color: rgb(96, 217, 120); "></div></td><td class="ke-colorpicker-cell" title="#00D5FF"><div class="ke-colorpicker-cell-color" style="background-color: rgb(0, 213, 255); "></div></td></tr><tr><td class="ke-colorpicker-cell" title="#337FE5"><div class="ke-colorpicker-cell-color" style="background-color: rgb(51, 127, 229); "></div></td><td class="ke-colorpicker-cell" title="#003399"><div class="ke-colorpicker-cell-color" style="background-color: rgb(0, 51, 153); "></div></td><td class="ke-colorpicker-cell" title="#4C33E5"><div class="ke-colorpicker-cell-color" style="background-color: rgb(76, 51, 229); "></div></td><td class="ke-colorpicker-cell" title="#9933E5"><div class="ke-colorpicker-cell-color" style="background-color: rgb(153, 51, 229); "></div></td><td class="ke-colorpicker-cell" title="#CC33E5"><div class="ke-colorpicker-cell-color" style="background-color: rgb(204, 51, 229); "></div></td><td class="ke-colorpicker-cell" title="#EE33EE"><div class="ke-colorpicker-cell-color" style="background-color: rgb(238, 51, 238); "></div></td></tr><tr><td class="ke-colorpicker-cell" title="#FFFFFF"><div class="ke-colorpicker-cell-color" style="background-color: rgb(255, 255, 255); "></div></td><td class="ke-colorpicker-cell" title="#CCCCCC"><div class="ke-colorpicker-cell-color" style="background-color: rgb(204, 204, 204); "></div></td><td class="ke-colorpicker-cell" title="#999999"><div class="ke-colorpicker-cell-color" style="background-color: rgb(153, 153, 153); "></div></td><td class="ke-colorpicker-cell" title="#666666"><div class="ke-colorpicker-cell-color" style="background-color: rgb(102, 102, 102); "></div></td><td class="ke-colorpicker-cell" title="#333333"><div class="ke-colorpicker-cell-color" style="background-color: rgb(51, 51, 51); "></div></td><td class="ke-colorpicker-cell" title="#000000"><div class="ke-colorpicker-cell-color" style="background-color: rgb(0, 0, 0); "></div></td></tr></tbody></table></div>'
        } else {
            r += "<h5>清除颜色</h5><table>";
            for (var p = 0; p < 2; p++) {
                for (var n = 0; n < 6; n++) {
                    r += "<tr>";
                    r += "<td title='#000000' style='background-color:#000000'>";
                    if (p == 0) {
                        r += "<td title='#" + t[n] + t[n] + t[n] + "' style='background-color:#" + t[n] + t[n] + t[n] + "'>"
                    } else {
                        r += "<td title='#" + c[n] + "' style='background-color:#" + c[n] + "'>"
                    }
                    r += "<td title='#000000' style='background-color:#000000'>";
                    for (var h = 0; h < 3; h++) {
                        for (var f = 0; f < 6; f++) {
                            r += "<td title='#" + t[h + p * 3] + t[f] + t[n] + "' style='background-color:#" + t[h + p * 3] + t[f] + t[n] + "'>"
                        }
                    }
                }
            }
            r += "</table>"
        }
        o.html(r);
        q = a("<div></div>").css({
            display: "none",
            position: "absolute",
            top: "0",
            left: "0",
            background: "#fff",
            opacity: "0",
            "z-index": "999998"
        }).appendTo("body");
        var s = function (i) {
            d.val(i).css("backgroundColor", i);
            if (g.title != null) {
                a(g.title).css("color", i)
            }
        };
        var b = function () {
            o.hide();
            q.hide()
        };
        var e, m;
        e = o.find("h5");
        m = o.find("table");
        m.delegate("td", "click", function () {
            var i = this.title;
            if (window[a(d).attr("id") + "_colorsselect"]) {
                window[a(d).attr("id") + "_colorsselect"](i)
            }
            s(i);
            b()
        });
        d.bind("click", function () {
            var w = document.body.clientWidth;
            var j = document.body.clientHeight;
            var u = o.outerWidth();
            var x = o.outerHeight();
            var k = d.offset().top;
            var l = d.offset().left;
            var v = d.outerWidth();
            var i = d.outerHeight();
            k = ((k + x + i) > j) ? k - x : k + i;
            l = ((l + u) > w) ? l - (u - v) : l;
            o.css({top: k, left: l}).show();
            q.css({width: w, height: j}).show()
        });
        e.bind("click", function () {
            s(g.color);
            b()
        });
        q.bind("click", function () {
            b()
        });
        s(g.color)
    }
})(jQuery);
//jquery blockUI 2.64.0
(function () {
    function setup($) {
        $.fn._fadeIn = $.fn.fadeIn;
        var noOp = $.noop || function () {
            };
        var msie = /MSIE/.test(navigator.userAgent);
        var ie6 = /MSIE 6.0/.test(navigator.userAgent) && !/MSIE 8.0/.test(navigator.userAgent);
        var mode = document.documentMode || 0;
        var setExpr = $.isFunction(document.createElement("div").style.setExpression);
        $.blockUI = function (opts) {
            install(window, opts)
        };
        $.unblockUI = function (opts) {
            remove(window, opts)
        };
        $.growlUI = function (title, message, timeout, onClose, className, icon) {
            if (!title) {
                title = "提示"
            }
            var $m;
            if (className) {
                $m = $('<div class="' + className + '"></div>')
            } else {
                $m = $('<div class="growlUI"></div>')
            }
            if (icon) {
                $m.css("background", "url(/" + __contextPath + "framework/css/common/images/icon/" + icon + ") no-repeat 10px 10px")
            } else {
                $m.css("background", "url(/" + __contextPath + "framework/css/common/images/icon/check48.png) no-repeat 10px 10px")
            }
            if (title) {
                $m.append("<h1>" + title + "</h1>")
            }
            if (message) {
                $m.append("<h2>" + message + "</h2>")
            }
            if (timeout === undefined) {
                timeout = 3000
            }
            var callBlock = function (opts) {
                opts = opts || {};
                $.blockUI({
                    message: $m,
                    fadeIn: typeof opts.fadeIn !== "undefined" ? opts.fadeIn : 700,
                    fadeOut: typeof opts.fadeOut !== "undefined" ? opts.fadeOut : 1000,
                    timeout: typeof opts.timeout !== "undefined" ? opts.timeout : timeout,
                    centerY: false,
                    showOverlay: false,
                    onUnblock: onClose,
                    css: $.blockUI.defaults.growlCSS
                })
            };
            callBlock();
            var nonmousedOpacity = $m.css("opacity");
            $m.mouseover(function () {
                callBlock({fadeIn: 0, timeout: 30000});
                var displayBlock = $(".blockMsg");
                displayBlock.stop();
                displayBlock.fadeTo(300, 1)
            }).mouseout(function () {
                $(".blockMsg").fadeOut(1000)
            })
        };
        $.fn.block = function (opts) {
            if (this[0] === window) {
                $.blockUI(opts);
                return this
            }
            var fullOpts = $.extend({}, $.blockUI.defaults, opts || {});
            this.each(function () {
                var $el = $(this);
                if (fullOpts.ignoreIfBlocked && $el.data("blockUI.isBlocked")) {
                    return
                }
                $el.unblock({fadeOut: 0})
            });
            return this.each(function () {
                if ($.css(this, "position") == "static") {
                    this.style.position = "relative";
                    $(this).data("blockUI.static", true)
                }
                this.style.zoom = 1;
                install(this, opts)
            })
        };
        $.fn.unblock = function (opts) {
            if (this[0] === window) {
                $.unblockUI(opts);
                return this
            }
            return this.each(function () {
                remove(this, opts)
            })
        };
        $.blockUI.version = 2.6;
        $.blockUI.defaults = {
            message: "<h1>Please wait...</h1>",
            title: null,
            draggable: true,
            theme: false,
            css: {
                padding: 0,
                margin: 0,
                width: "30%",
                top: "40%",
                left: "35%",
                textAlign: "center",
                color: "#000",
                border: "3px solid #aaa",
                backgroundColor: "#fff",
                cursor: "wait"
            },
            themedCSS: {width: "30%", top: "40%", left: "35%"},
            overlayCSS: {backgroundColor: "#000", opacity: 0.6, cursor: "wait"},
            cursorReset: "default",
            growlCSS: {
                width: "24%",
                top: "10px",
                left: "38%",
                right: "",
                border: "none",
                padding: "5px",
                opacity: 0.6,
                cursor: "default",
                color: "#fff",
                backgroundColor: "#000",
                "-webkit-border-radius": "10px",
                "-moz-border-radius": "10px",
                "border-radius": "10px"
            },
            iframeSrc: /^https/i.test(window.location.href || "") ? "javascript:false" : "about:blank",
            forceIframe: false,
            baseZ: 1000,
            centerX: true,
            centerY: true,
            allowBodyStretch: true,
            bindEvents: true,
            constrainTabKey: true,
            fadeIn: 200,
            fadeOut: 400,
            timeout: 0,
            showOverlay: true,
            focusInput: true,
            focusableElements: ":input:enabled:visible",
            onBlock: null,
            onUnblock: null,
            onOverlayClick: null,
            quirksmodeOffsetHack: 4,
            blockMsgClass: "blockMsg",
            ignoreIfBlocked: false
        };
        var pageBlock = null;
        var pageBlockEls = [];

        function install(el, opts) {
            var css, themedCSS;
            var full = (el == window);
            var msg = (opts && opts.message !== undefined ? opts.message : undefined);
            opts = $.extend({}, $.blockUI.defaults, opts || {});
            if (opts.ignoreIfBlocked && $(el).data("blockUI.isBlocked")) {
                return
            }
            opts.overlayCSS = $.extend({}, $.blockUI.defaults.overlayCSS, opts.overlayCSS || {});
            css = $.extend({}, $.blockUI.defaults.css, opts.css || {});
            if (opts.onOverlayClick) {
                opts.overlayCSS.cursor = "pointer"
            }
            themedCSS = $.extend({}, $.blockUI.defaults.themedCSS, opts.themedCSS || {});
            msg = msg === undefined ? opts.message : msg;
            if (full && pageBlock) {
                remove(window, {fadeOut: 0})
            }
            if (msg && typeof msg != "string" && (msg.parentNode || msg.jquery)) {
                var node = msg.jquery ? msg[0] : msg;
                var data = {};
                $(el).data("blockUI.history", data);
                data.el = node;
                data.parent = node.parentNode;
                data.display = node.style.display;
                data.position = node.style.position;
                if (data.parent) {
                    data.parent.removeChild(node)
                }
            }
            $(el).data("blockUI.onUnblock", opts.onUnblock);
            var z = opts.baseZ;
            var lyr1, lyr2, lyr3, s;
            if (msie || opts.forceIframe) {
                lyr1 = $('<iframe class="blockUI" style="z-index:' + (z++) + ';display:none;border:none;margin:0;padding:0;position:absolute;width:100%;height:100%;top:0;left:0" src="' + opts.iframeSrc + '"></iframe>')
            } else {
                lyr1 = $('<div class="blockUI" style="display:none"></div>')
            }
            if (opts.theme) {
                lyr2 = $('<div class="blockUI blockOverlay ui-widget-overlay" style="z-index:' + (z++) + ';display:none"></div>')
            } else {
                lyr2 = $('<div class="blockUI blockOverlay" style="z-index:' + (z++) + ';display:none;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"></div>')
            }
            if (opts.theme && full) {
                s = '<div class="blockUI ' + opts.blockMsgClass + ' blockPage ui-dialog ui-widget ui-corner-all" style="z-index:' + (z + 10) + ';display:none;position:fixed">';
                if (opts.title) {
                    s += '<div class="ui-widget-header ui-dialog-titlebar ui-corner-all blockTitle">' + (opts.title || "&nbsp;") + "</div>"
                }
                s += '<div class="ui-widget-content ui-dialog-content"></div>';
                s += "</div>"
            } else {
                if (opts.theme) {
                    s = '<div class="blockUI ' + opts.blockMsgClass + ' blockElement ui-dialog ui-widget ui-corner-all" style="z-index:' + (z + 10) + ';display:none;position:absolute">';
                    if (opts.title) {
                        s += '<div class="ui-widget-header ui-dialog-titlebar ui-corner-all blockTitle">' + (opts.title || "&nbsp;") + "</div>"
                    }
                    s += '<div class="ui-widget-content ui-dialog-content"></div>';
                    s += "</div>"
                } else {
                    if (full) {
                        s = '<div class="blockUI ' + opts.blockMsgClass + ' blockPage" style="z-index:' + (z + 10) + ';display:none;position:fixed"></div>'
                    } else {
                        s = '<div class="blockUI ' + opts.blockMsgClass + ' blockElement" style="z-index:' + (z + 10) + ';display:none;position:absolute"></div>'
                    }
                }
            }
            lyr3 = $(s);
            if (msg) {
                if (opts.theme) {
                    lyr3.css(themedCSS);
                    lyr3.addClass("ui-widget-content")
                } else {
                    lyr3.css(css)
                }
            }
            if (!opts.theme) {
                lyr2.css(opts.overlayCSS)
            }
            lyr2.css("position", full ? "fixed" : "absolute");
            if (msie || opts.forceIframe) {
                lyr1.css("opacity", 0)
            }
            var layers = [lyr1, lyr2, lyr3], $par = full ? $("body") : $(el);
            $.each(layers, function () {
                this.appendTo($par)
            });
            if (opts.theme && opts.draggable && $.fn.draggable) {
                lyr3.draggable({handle: ".ui-dialog-titlebar", cancel: "li"})
            }
            var expr = setExpr && (!$.support.boxModel || $("object,embed", full ? null : el).length > 0);
            if (ie6 || expr) {
                if (full && opts.allowBodyStretch && $.support.boxModel) {
                    $("html,body").css("height", "100%")
                }
                if ((ie6 || !$.support.boxModel) && !full) {
                    var t = sz(el, "borderTopWidth"), l = sz(el, "borderLeftWidth");
                    var fixT = t ? "(0 - " + t + ")" : 0;
                    var fixL = l ? "(0 - " + l + ")" : 0
                }
                $.each(layers, function (i, o) {
                    var s = o[0].style;
                    s.position = "absolute";
                    if (i < 2) {
                        if (full) {
                            s.setExpression("height", "Math.max(document.body.scrollHeight, document.body.offsetHeight) - (jQuery.support.boxModel?0:" + opts.quirksmodeOffsetHack + ') + "px"')
                        } else {
                            s.setExpression("height", 'this.parentNode.offsetHeight + "px"')
                        }
                        if (full) {
                            s.setExpression("width", 'jQuery.support.boxModel && document.documentElement.clientWidth || document.body.clientWidth + "px"')
                        } else {
                            s.setExpression("width", 'this.parentNode.offsetWidth + "px"')
                        }
                        if (fixL) {
                            s.setExpression("left", fixL)
                        }
                        if (fixT) {
                            s.setExpression("top", fixT)
                        }
                    } else {
                        if (opts.centerY) {
                            if (full) {
                                s.setExpression("top", '(document.documentElement.clientHeight || document.body.clientHeight) / 2 - (this.offsetHeight / 2) + (blah = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + "px"')
                            }
                            s.marginTop = 0
                        } else {
                            if (!opts.centerY && full) {
                                var top = (opts.css && opts.css.top) ? parseInt(opts.css.top, 10) : 0;
                                var expression = "((document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + " + top + ') + "px"';
                                s.setExpression("top", expression)
                            }
                        }
                    }
                })
            }
            if (msg) {
                if (opts.theme) {
                    lyr3.find(".ui-widget-content").append(msg)
                } else {
                    lyr3.append(msg)
                }
                if (msg.jquery || msg.nodeType) {
                    $(msg).show()
                }
            }
            if ((msie || opts.forceIframe) && opts.showOverlay) {
                lyr1.show()
            }
            if (opts.fadeIn) {
                var cb = opts.onBlock ? opts.onBlock : noOp;
                var cb1 = (opts.showOverlay && !msg) ? cb : noOp;
                var cb2 = msg ? cb : noOp;
                if (opts.showOverlay) {
                    lyr2._fadeIn(opts.fadeIn, cb1)
                }
                if (msg) {
                    lyr3._fadeIn(opts.fadeIn, cb2)
                }
            } else {
                if (opts.showOverlay) {
                    lyr2.show()
                }
                if (msg) {
                    lyr3.show()
                }
                if (opts.onBlock) {
                    opts.onBlock()
                }
            }
            bind(1, el, opts);
            if (full) {
                pageBlock = lyr3[0];
                pageBlockEls = $(opts.focusableElements, pageBlock);
                if (opts.focusInput) {
                    setTimeout(focus, 20)
                }
            } else {
                center(lyr3[0], opts.centerX, opts.centerY)
            }
            if (opts.timeout) {
                var to = setTimeout(function () {
                    if (full) {
                        $.unblockUI(opts)
                    } else {
                        $(el).unblock(opts)
                    }
                }, opts.timeout);
                $(el).data("blockUI.timeout", to)
            }
        }

        function remove(el, opts) {
            var count;
            var full = (el == window);
            var $el = $(el);
            var data = $el.data("blockUI.history");
            var to = $el.data("blockUI.timeout");
            if (to) {
                clearTimeout(to);
                $el.removeData("blockUI.timeout")
            }
            opts = $.extend({}, $.blockUI.defaults, opts || {});
            bind(0, el, opts);
            if (opts.onUnblock === null) {
                opts.onUnblock = $el.data("blockUI.onUnblock");
                $el.removeData("blockUI.onUnblock")
            }
            var els;
            if (full) {
                els = $("body").children().filter(".blockUI").add("body > .blockUI")
            } else {
                els = $el.find(">.blockUI")
            }
            if (opts.cursorReset) {
                if (els.length > 1) {
                    els[1].style.cursor = opts.cursorReset
                }
                if (els.length > 2) {
                    els[2].style.cursor = opts.cursorReset
                }
            }
            if (full) {
                pageBlock = pageBlockEls = null
            }
            if (opts.fadeOut) {
                count = els.length;
                els.stop().fadeOut(opts.fadeOut, function () {
                    if (--count === 0) {
                        reset(els, data, opts, el)
                    }
                })
            } else {
                reset(els, data, opts, el)
            }
        }

        function reset(els, data, opts, el) {
            var $el = $(el);
            if ($el.data("blockUI.isBlocked")) {
                return
            }
            els.each(function (i, o) {
                if (this.parentNode) {
                    this.parentNode.removeChild(this)
                }
            });
            if (data && data.el) {
                data.el.style.display = data.display;
                data.el.style.position = data.position;
                if (data.parent) {
                    data.parent.appendChild(data.el)
                }
                $el.removeData("blockUI.history")
            }
            if ($el.data("blockUI.static")) {
                $el.css("position", "static")
            }
            if (typeof opts.onUnblock == "function") {
                opts.onUnblock(el, opts)
            }
            var body = $(document.body), w = body.width(), cssW = body[0].style.width;
            body.width(w - 1).width(w);
            body[0].style.width = cssW
        }

        function bind(b, el, opts) {
            var full = el == window, $el = $(el);
            if (!b && (full && !pageBlock || !full && !$el.data("blockUI.isBlocked"))) {
                return
            }
            $el.data("blockUI.isBlocked", b);
            if (!full || !opts.bindEvents || (b && !opts.showOverlay)) {
                return
            }
            var events = "mousedown mouseup keydown keypress keyup touchstart touchend touchmove";
            if (b) {
                $(document).bind(events, opts, handler)
            } else {
                $(document).unbind(events, handler)
            }
        }

        function handler(e) {
            if (e.type === "keydown" && e.keyCode && e.keyCode == 9) {
                if (pageBlock && e.data.constrainTabKey) {
                    var els = pageBlockEls;
                    var fwd = !e.shiftKey && e.target === els[els.length - 1];
                    var back = e.shiftKey && e.target === els[0];
                    if (fwd || back) {
                        setTimeout(function () {
                            focus(back)
                        }, 10);
                        return false
                    }
                }
            }
            var opts = e.data;
            var target = $(e.target);
            if (target.hasClass("blockOverlay") && opts.onOverlayClick) {
                opts.onOverlayClick()
            }
            if (target.parents("div." + opts.blockMsgClass).length > 0) {
                return true
            }
            return target.parents().children().filter("div.blockUI").length === 0
        }

        function focus(back) {
            if (!pageBlockEls) {
                return
            }
            var e = pageBlockEls[back === true ? pageBlockEls.length - 1 : 0];
            if (e) {
                e.focus()
            }
        }

        function center(el, x, y) {
            var p = el.parentNode, s = el.style;
            var l = ((p.offsetWidth - el.offsetWidth) / 2) - sz(p, "borderLeftWidth");
            var t = ((p.offsetHeight - el.offsetHeight) / 2) - sz(p, "borderTopWidth");
            if (x) {
                s.left = l > 0 ? (l + "px") : "0"
            }
            if (y) {
                s.top = t > 0 ? (t + "px") : "0"
            }
        }

        function sz(el, p) {
            return parseInt($.css(el, p), 10) || 0
        }
    }

    if (typeof define === "function" && define.amd && define.amd.jQuery) {
        define(["jquery"], setup)
    } else {
        setup(jQuery)
    }
})();
//jquery processBar
(function (a) {
    a.extend({
        progressBar: new function () {
            this.defaults = {
                steps: 20,
                stepDuration: 20,
                max: 100,
                showText: true,
                textFormat: "percentage",
                width: 120,
                height: 12,
                callback: null,
                boxImage: "/" + __contextPath + "framework/css/common/plugin/progressbar.gif",
                barImage: {
                    0: "/" + __contextPath + "framework/css/common/plugin/progressbg_red.gif",
                    30: "/" + __contextPath + "framework/css/common/plugin/progressbg_orange.gif",
                    70: "/" + __contextPath + "framework/css/common/plugin/progressbg_green.gif"
                },
                running_value: 0,
                value: 0,
                image: null
            };
            this.construct = function (c, b) {
                var d = null;
                var e = null;
                if (c != null) {
                    if (!isNaN(c)) {
                        d = c;
                        if (b != null) {
                            e = b
                        }
                    } else {
                        e = c
                    }
                }
                return this.each(function (f) {
                    var p = this;
                    var h = this.config;
                    if (d != null && this.bar != null && this.config != null) {
                        this.config.value = parseInt(d);
                        if (e != null) {
                            p.config = a.extend(this.config, e)
                        }
                        h = p.config
                    } else {
                        var n = a(this);
                        var h = a.extend({}, a.progressBar.defaults, e);
                        h.id = n.attr("id") ? n.attr("id") : Math.ceil(Math.random() * 100000);
                        if (d == null) {
                            d = n.html().replace("%", "")
                        }
                        h.value = parseInt(d);
                        h.running_value = 0;
                        h.image = m(h);
                        var q = ["steps", "stepDuration", "max", "width", "height", "running_value", "value"];
                        for (var j = 0; j < q.length; j++) {
                            h[q[j]] = parseInt(h[q[j]])
                        }
                        n.html("");
                        var l = document.createElement("img");
                        var s = document.createElement("span");
                        var g = a(l);
                        var o = a(s);
                        p.bar = g;
                        g.attr("id", h.id + "_pbImage");
                        o.attr("id", h.id + "_pbText");
                        o.html(r(h));
                        g.attr("title", r(h));
                        g.attr("alt", r(h));
                        g.attr("src", h.boxImage);
                        g.attr("width", h.width);
                        g.css("width", h.width + "px");
                        g.css("height", h.height + "px");
                        g.css("background-image", "url(" + h.image + ")");
                        g.css("background-position", ((h.width * -1)) + "px 50%");
                        g.css("padding", "0");
                        g.css("margin", "0");
                        n.append(g);
                        n.append(o)
                    }
                    function k(i) {
                        return i.running_value * 100 / i.max
                    }

                    function m(t) {
                        var w = t.barImage;
                        if (typeof(t.barImage) == "object") {
                            for (var v in t.barImage) {
                                if (t.running_value >= parseInt(v)) {
                                    w = t.barImage[v]
                                } else {
                                    break
                                }
                            }
                        }
                        return w
                    }

                    function r(i) {
                        if (i.showText) {
                            if (i.textFormat == "percentage") {
                                return " " + Math.round(i.running_value) + "%"
                            } else {
                                if (i.textFormat == "fraction") {
                                    return " " + i.running_value + "/" + i.max
                                }
                            }
                        }
                    }

                    h.increment = Math.round((h.value - h.running_value) / h.steps);
                    if (h.increment < 0) {
                        h.increment *= -1
                    }
                    if (h.increment < 1) {
                        h.increment = 1
                    }
                    var u = setInterval(function () {
                        var w = h.width / 100;
                        if (h.running_value > h.value) {
                            if (h.running_value - h.increment < h.value) {
                                h.running_value = h.value
                            } else {
                                h.running_value -= h.increment
                            }
                        } else {
                            if (h.running_value < h.value) {
                                if (h.running_value + h.increment > h.value) {
                                    h.running_value = h.value
                                } else {
                                    h.running_value += h.increment
                                }
                            }
                        }
                        if (h.running_value == h.value) {
                            clearInterval(u)
                        }
                        var v = a("#" + h.id + "_pbImage");
                        var i = a("#" + h.id + "_pbText");
                        var t = m(h);
                        if (t != h.image) {
                            v.css("background-image", "url(" + t + ")");
                            h.image = t
                        }
                        v.css("background-position", (((h.width * -1)) + (k(h) * w)) + "px 50%");
                        v.attr("title", r(h));
                        i.html(r(h));
                        if (h.callback != null && typeof(h.callback) == "function") {
                            h.callback(h)
                        }
                        p.config = h
                    }, h.stepDuration)
                })
            }
        }
    });
    a.fn.extend({progressBar: a.progressBar.construct})
})(jQuery);
//jquery powerFloat
(function (e) {
    e.fn.powerFloat = function (a) {
        return e(this).each(function () {
            var c = e.extend({}, d, a || {});
            var b = function (g, j) {
                if (f.target && f.target.css("display") !== "none") {
                    f.targetHide()
                }
                f.s = g;
                f.trigger = j
            }, h;
            switch (c.eventType) {
                case"hover":
                    e(this).hover(function () {
                        if (f.timerHold) {
                            f.flagDisplay = true
                        }
                        var g = parseInt(c.showDelay, 10);
                        b(c, e(this));
                        if (g) {
                            if (h) {
                                clearTimeout(h)
                            }
                            h = setTimeout(function () {
                                f.targetGet.call(f)
                            }, g)
                        } else {
                            f.targetGet()
                        }
                    }, function () {
                        if (h) {
                            clearTimeout(h)
                        }
                        if (f.timerHold) {
                            clearTimeout(f.timerHold)
                        }
                        f.flagDisplay = false;
                        f.targetHold()
                    });
                    if (c.hoverFollow) {
                        e(this).mousemove(function (g) {
                            f.cacheData.left = g.pageX;
                            f.cacheData.top = g.pageY;
                            f.targetGet.call(f);
                            return false
                        })
                    }
                    break;
                case"click":
                    e(this).click(function (g) {
                        if (f.display && f.trigger && g.target === f.trigger.get(0)) {
                            f.flagDisplay = false;
                            f.displayDetect()
                        } else {
                            b(c, e(this));
                            f.targetGet();
                            if (!e(document).data("mouseupBind")) {
                                e(document).bind("mouseup", function (l) {
                                    var n = false;
                                    if (f.trigger) {
                                        var m = f.target.attr("id");
                                        if (!m) {
                                            m = "R_" + Math.random();
                                            f.target.attr("id", m)
                                        }
                                        e(l.target).parents().each(function () {
                                            if (e(this).attr("id") === m) {
                                                n = true
                                            }
                                        });
                                        if (c.eventType === "click" && f.display && l.target != f.trigger.get(0) && !n) {
                                            f.flagDisplay = false;
                                            f.displayDetect()
                                        }
                                    }
                                    return false
                                }).data("mouseupBind", true)
                            }
                        }
                    });
                    break;
                case"focus":
                    e(this).focus(function () {
                        var g = e(this);
                        setTimeout(function () {
                            b(c, g);
                            f.targetGet()
                        }, 200)
                    }).blur(function () {
                        f.flagDisplay = false;
                        setTimeout(function () {
                            f.displayDetect()
                        }, 190)
                    });
                    break;
                default:
                    b(c, e(this));
                    f.targetGet();
                    e(document).unbind("mouseup").data("mouseupBind", false)
            }
        })
    };
    var f = {
        targetGet: function () {
            if (!this.trigger) {
                return this
            }
            var n = this.trigger.attr(this.s.targetAttr), o = typeof this.s.target == "function" ? this.s.target.call(this.trigger) : this.s.target;
            switch (this.s.targetMode) {
                case"common":
                    if (o) {
                        var m = typeof(o);
                        if (m === "object") {
                            if (o.size()) {
                                f.target = o.eq(0)
                            }
                        } else {
                            if (m === "string") {
                                if (e(o).size()) {
                                    f.target = e(o).eq(0)
                                }
                            }
                        }
                    } else {
                        if (n && e("#" + n).size()) {
                            f.target = e("#" + n)
                        }
                    }
                    if (f.target) {
                        f.targetShow()
                    } else {
                        return this
                    }
                    break;
                case"ajax":
                    var r = o || n;
                    this.targetProtect = false;
                    if (!r) {
                        return
                    }
                    if (!f.cacheData[r]) {
                        f.loading()
                    }
                    var p = new Image();
                    p.onload = function () {
                        var g = p.width, j = p.height;
                        var k = e(window).width(), h = e(window).height();
                        var i = g / j, l = k / h;
                        if (i > l) {
                            if (g > k / 2) {
                                g = k / 2;
                                j = g / i
                            }
                        } else {
                            if (j > h / 2) {
                                j = h / 2;
                                g = j * i
                            }
                        }
                        var t = '<img class="float_ajax_image" src="' + r + '" width="' + g + '" height = "' + j + '" />';
                        f.cacheData[r] = true;
                        f.target = e(t);
                        f.targetShow()
                    };
                    p.onerror = function () {
                        if (/(\.jpg|\.png|\.gif|\.bmp|\.jpeg)$/i.test(r)) {
                            f.target = e('<div class="float_ajax_error">图片加载失败。</div>');
                            f.targetShow()
                        } else {
                            e.ajax({
                                url: r, success: function (g) {
                                    if (typeof(g) === "string") {
                                        f.cacheData[r] = true;
                                        f.target = e('<div class="float_ajax_data">' + g + "</div>");
                                        f.targetShow()
                                    }
                                }, error: function () {
                                    f.target = e('<div class="float_ajax_error">数据没有加载成功。</div>');
                                    f.targetShow()
                                }
                            })
                        }
                    };
                    p.src = r;
                    break;
                case"list":
                    var b = '<ul class="float_list_ul">', c;
                    if (e.isArray(o) && (c = o.length)) {
                        e.each(o, function (l, j) {
                            var k = "", h = "", i, g;
                            if (l === 0) {
                                h = ' class="float_list_li_first"'
                            }
                            if (l === c - 1) {
                                h = ' class="float_list_li_last"'
                            }
                            if (typeof(j) === "object" && (i = j.text.toString())) {
                                if (g = (j.href || "javascript:")) {
                                    k = '<a href="' + g + '" class="float_list_a">' + i + "</a>"
                                } else {
                                    k = i
                                }
                            } else {
                                if (typeof(j) === "string" && j) {
                                    k = j
                                }
                            }
                            if (k) {
                                b += "<li" + h + ">" + k + "</li>"
                            }
                        })
                    } else {
                        b += '<li class="float_list_null">列表无数据。</li>'
                    }
                    b += "</ul>";
                    f.target = e(b);
                    this.targetProtect = false;
                    f.targetShow();
                    break;
                case"remind":
                    var a = o || n;
                    this.targetProtect = false;
                    if (typeof(a) === "string") {
                        f.target = e("<span>" + a + "</span>");
                        f.targetShow()
                    }
                    break;
                default:
                    var q = o || n, m = typeof(q);
                    if (q) {
                        if (m === "string") {
                            if (/^.[^:#\[\.,]*$/.test(q)) {
                                if (e(q).size()) {
                                    f.target = e(q).eq(0);
                                    this.targetProtect = true
                                } else {
                                    if (e("#" + q).size()) {
                                        f.target = e("#" + q).eq(0);
                                        this.targetProtect = true
                                    } else {
                                        f.target = e("<div>" + q + "</div>");
                                        this.targetProtect = false
                                    }
                                }
                            } else {
                                f.target = e("<div>" + q + "</div>");
                                this.targetProtect = false
                            }
                            f.targetShow()
                        } else {
                            if (m === "object") {
                                if (!e.isArray(q) && q.size()) {
                                    f.target = q.eq(0);
                                    this.targetProtect = true;
                                    f.targetShow()
                                }
                            }
                        }
                    }
            }
            return this
        }, container: function () {
            var b = this.s.container, a = this.s.targetMode || "mode";
            if (a === "ajax" || a === "remind") {
                this.s.sharpAngle = true
            } else {
                this.s.sharpAngle = false
            }
            if (this.s.reverseSharp) {
                this.s.sharpAngle = !this.s.sharpAngle
            }
            if (a !== "common") {
                if (b === null) {
                    b = "plugin"
                }
                if (b === "plugin") {
                    if (!e("#floatBox_" + a).size()) {
                        e('<div id="floatBox_' + a + '" class="float_' + a + '_box"></div>').appendTo(e("body")).hide()
                    }
                    b = e("#floatBox_" + a)
                }
                if (b && typeof(b) !== "string" && b.size()) {
                    if (this.targetProtect) {
                        f.target.show().css("position", "static")
                    }
                    f.target = b.empty().append(f.target)
                }
            }
            return this
        }, setWidth: function () {
            var a = this.s.width;
            if (a === "auto") {
                if (this.target.get(0).style.width) {
                    this.target.css("width", "auto")
                }
            } else {
                if (a === "inherit") {
                    this.target.width(this.trigger.width())
                } else {
                    this.target.css("width", a)
                }
            }
            return this
        }, position: function () {
            if (!this.trigger || !this.target) {
                return this
            }
            var Z, c = 0, W = 0, U = 0, b = 0, L, S, ac, J, H, P, ab = this.target.data("height"), M = this.target.data("width"), N = e(window).scrollTop(), O = parseInt(this.s.offsets.x, 10) || 0, R = parseInt(this.s.offsets.y, 10) || 0, F = this.cacheData;
            if (!ab) {
                ab = this.target.outerHeight();
                if (this.s.hoverFollow) {
                    this.target.data("height", ab)
                }
            }
            if (!M) {
                M = this.target.outerWidth();
                if (this.s.hoverFollow) {
                    this.target.data("width", M)
                }
            }
            Z = this.trigger.offset();
            c = this.trigger.outerHeight();
            W = this.trigger.outerWidth();
            L = Z.left;
            S = Z.top;
            var V = function () {
                if (L < 0) {
                    L = 0
                } else {
                    if (L + c > e(window).width()) {
                        L = e(window).width() - W
                    }
                }
            }, Y = function () {
                if (S < 0) {
                    S = 0
                } else {
                    if (S + c > e(document).height()) {
                        S = e(document).height() - c
                    }
                }
            };
            if (this.s.hoverFollow && F.left && F.top) {
                if (this.s.hoverFollow === "x") {
                    L = F.left;
                    V()
                } else {
                    if (this.s.hoverFollow === "y") {
                        S = F.top;
                        Y()
                    } else {
                        L = F.left;
                        S = F.top;
                        V();
                        Y()
                    }
                }
            }
            var aa = ["4-1", "1-4", "5-7", "2-3", "2-1", "6-8", "3-4", "4-3", "8-6", "1-2", "7-5", "3-2"], G = this.s.position, ad = false, X;
            e.each(aa, function (h, g) {
                if (g === G) {
                    ad = true;
                    return
                }
            });
            if (!ad) {
                G = "4-1"
            }
            var K = function (h) {
                var g = "bottom";
                switch (h) {
                    case"1-4":
                    case"5-7":
                    case"2-3":
                        g = "top";
                        break;
                    case"2-1":
                    case"6-8":
                    case"3-4":
                        g = "right";
                        break;
                    case"1-2":
                    case"8-6":
                    case"4-3":
                        g = "left";
                        break;
                    case"4-1":
                    case"7-5":
                    case"3-2":
                        g = "bottom";
                        break
                }
                return g
            };
            var T = function (g) {
                if (g === "5-7" || g === "6-8" || g === "8-6" || g === "7-5") {
                    return true
                }
                return false
            };
            var I = function (h) {
                var g = 0, j = 0, i = (f.s.sharpAngle && f.corner) ? true : false;
                if (h === "right") {
                    j = L + W + M + O;
                    if (i) {
                        j += f.corner.width()
                    }
                    if (j > e(window).width()) {
                        return false
                    }
                } else {
                    if (h === "bottom") {
                        g = S + c + ab + R;
                        if (i) {
                            g += f.corner.height()
                        }
                        if (g > N + e(window).height()) {
                            return false
                        }
                    } else {
                        if (h === "top") {
                            g = ab + R;
                            if (i) {
                                g += f.corner.height()
                            }
                            if (g > S - N) {
                                return false
                            }
                        } else {
                            if (h === "left") {
                                j = M + O;
                                if (i) {
                                    j += f.corner.width()
                                }
                                if (j > L) {
                                    return false
                                }
                            }
                        }
                    }
                }
                return true
            };
            X = K(G);
            if (this.s.sharpAngle) {
                this.createSharp(X)
            }
            if (this.s.edgeAdjust) {
                if (I(X)) {
                    (function () {
                        if (T(G)) {
                            return
                        }
                        var h = {
                            top: {right: "2-3", left: "1-4"},
                            right: {top: "2-1", bottom: "3-4"},
                            bottom: {right: "3-2", left: "4-1"},
                            left: {top: "1-2", bottom: "4-3"}
                        };
                        var g = h[X], i;
                        if (g) {
                            for (i in g) {
                                if (!I(i)) {
                                    G = g[i]
                                }
                            }
                        }
                    })()
                } else {
                    (function () {
                        if (T(G)) {
                            var i = {"5-7": "7-5", "7-5": "5-7", "6-8": "8-6", "8-6": "6-8"};
                            G = i[G]
                        } else {
                            var h = {
                                top: {left: "3-2", right: "4-1"},
                                right: {bottom: "1-2", top: "4-3"},
                                bottom: {left: "2-3", right: "1-4"},
                                left: {bottom: "2-1", top: "3-4"}
                            };
                            var g = h[X], j = [];
                            for (name in g) {
                                j.push(name)
                            }
                            if (I(j[0]) || !I(j[1])) {
                                G = g[j[0]]
                            } else {
                                G = g[j[1]]
                            }
                        }
                    })()
                }
            }
            var a = K(G), Q = G.split("-")[0];
            if (this.s.sharpAngle) {
                this.createSharp(a);
                U = this.corner.width(), b = this.corner.height()
            }
            if (this.s.hoverFollow) {
                if (this.s.hoverFollow === "x") {
                    ac = L + O;
                    if (Q === "1" || Q === "8" || Q === "4") {
                        ac = L - (M - W) / 2 + O
                    } else {
                        ac = L - (M - W) + O
                    }
                    if (Q === "1" || Q === "5" || Q === "2") {
                        J = S - R - ab - b;
                        P = S - b - R - 1
                    } else {
                        J = S + c + R + b;
                        P = S + c + R + 1
                    }
                    H = Z.left - (U - W) / 2
                } else {
                    if (this.s.hoverFollow === "y") {
                        if (Q === "1" || Q === "5" || Q === "2") {
                            J = S - (ab - c) / 2 + R
                        } else {
                            J = S - (ab - c) + R
                        }
                        if (Q === "1" || Q === "8" || Q === "4") {
                            ac = L - M - O - U;
                            H = L - U - O - 1
                        } else {
                            ac = L + W - O + U;
                            H = L + W + O + 1
                        }
                        P = Z.top - (b - c) / 2
                    } else {
                        ac = L + O;
                        J = S + R
                    }
                }
            } else {
                switch (a) {
                    case"top":
                        J = S - R - ab - b;
                        if (Q == "1") {
                            ac = L - O
                        } else {
                            if (Q === "5") {
                                ac = L - (M - W) / 2 - O
                            } else {
                                ac = L - (M - W) - O
                            }
                        }
                        P = S - b - R - 1;
                        H = L - (U - W) / 2;
                        break;
                    case"right":
                        ac = L + W + O + U;
                        if (Q == "2") {
                            J = S + R
                        } else {
                            if (Q === "6") {
                                J = S - (ab - c) / 2 + R
                            } else {
                                J = S - (ab - c) + R
                            }
                        }
                        H = L + W + O + 1;
                        P = S - (b - c) / 2;
                        break;
                    case"bottom":
                        J = S + c + R + b;
                        if (Q == "4") {
                            ac = L + O
                        } else {
                            if (Q === "7") {
                                ac = L - (M - W) / 2 + O
                            } else {
                                ac = L - (M - W) + O
                            }
                        }
                        P = S + c + R + 1;
                        H = L - (U - W) / 2;
                        break;
                    case"left":
                        ac = L - M - O - U;
                        if (Q == "2") {
                            J = S - R
                        } else {
                            if (Q === "6") {
                                J = S - (M - W) / 2 - R
                            } else {
                                J = S - (ab - c) - R
                            }
                        }
                        H = ac + U;
                        P = S - (M - U) / 2;
                        break
                }
            }
            if (b && U && this.corner) {
                this.corner.css({left: H, top: P, zIndex: this.s.zIndex + 1})
            }
            this.target.css({position: "absolute", left: ac, top: J, zIndex: this.s.zIndex});
            return this
        }, createSharp: function (m) {
            var b, a, n = "", p = "";
            var c = {left: "right", right: "left", bottom: "top", top: "bottom"}, o = c[m] || "top";
            if (this.target) {
                b = this.target.css("background-color");
                if (parseInt(this.target.css("border-" + o + "-width")) > 0) {
                    a = this.target.css("border-" + o + "-color")
                }
                if (a && a !== "transparent") {
                    n = 'style="color:' + a + ';"'
                } else {
                    n = 'style="display:none;"'
                }
                if (b && b !== "transparent") {
                    p = 'style="color:' + b + ';"'
                } else {
                    p = 'style="display:none;"'
                }
            }
            var l = '<div id="floatCorner_' + m + '" class="float_corner float_corner_' + m + '"><span class="corner corner_1" ' + n + '>◆</span><span class="corner corner_2" ' + p + ">◆</span></div>";
            if (!e("#floatCorner_" + m).size()) {
                e("body").append(e(l))
            }
            this.corner = e("#floatCorner_" + m);
            return this
        }, targetHold: function () {
            if (this.s.hoverHold) {
                var a = parseInt(this.s.hideDelay, 10) || 200;
                if (this.target) {
                    this.target.hover(function () {
                        f.flagDisplay = true
                    }, function () {
                        if (f.timerHold) {
                            clearTimeout(f.timerHold)
                        }
                        f.flagDisplay = false;
                        f.targetHold()
                    })
                }
                f.timerHold = setTimeout(function () {
                    f.displayDetect.call(f)
                }, a)
            } else {
                this.displayDetect()
            }
            return this
        }, loading: function () {
            this.target = e('<div class="float_loading"></div>');
            this.targetShow();
            this.target.removeData("width").removeData("height");
            return this
        }, displayDetect: function () {
            if (!this.flagDisplay && this.display) {
                this.targetHide();
                this.timerHold = null
            }
            return this
        }, targetShow: function () {
            f.cornerClear();
            if (e.isFunction(this.s.beforeShow)) {
                this.s.beforeShow.call(this.trigger, this.target)
            }
            this.display = true;
            this.container().setWidth().position();
            this.target.show();
            if (e.isFunction(this.s.showCall)) {
                this.s.showCall.call(this.trigger, this.target)
            }
            return this
        }, targetHide: function () {
            this.display = false;
            this.targetClear();
            this.cornerClear();
            if (e.isFunction(this.s.hideCall)) {
                this.s.hideCall.call(this.trigger)
            }
            this.target = null;
            this.trigger = null;
            this.s = {};
            this.targetProtect = false;
            return this
        }, targetClear: function () {
            if (this.target) {
                if (this.target.data("width")) {
                    this.target.removeData("width").removeData("height")
                }
                if (this.targetProtect) {
                    this.target.children().hide().appendTo(e("body"))
                }
                this.target.unbind().hide()
            }
        }, cornerClear: function () {
            if (this.corner) {
                this.corner.remove()
            }
        }, target: null, trigger: null, s: {}, cacheData: {}, targetProtect: false
    };
    e.powerFloat = {};
    e.powerFloat.hide = function () {
        f.targetHide()
    };
    var d = {
        width: "auto",
        offsets: {x: 0, y: 0},
        zIndex: 99999,
        eventType: "hover",
        showDelay: 0,
        hideDelay: 0,
        hoverHold: true,
        hoverFollow: false,
        targetMode: "common",
        target: null,
        targetAttr: "rel",
        container: null,
        reverseSharp: false,
        position: "4-1",
        edgeAdjust: true,
        showCall: e.noop,
        hideCall: e.noop
    }
})(jQuery);
//contextMenu
(function (a) {
    function b() {
        return false
    }

    a.fn.contextmenu = function (l) {
        l = a.extend({alias: "cmroot", width: 150}, l);
        var q = null, z = null, u = {}, y = {}, i = {}, p = [], t = "<div class='b-m-$[type]' unselectable=on><nobr unselectable=on><img src='$[icon]' align='absmiddle'/><span unselectable=on>$[text]</span></nobr></div>";
        var k = a("<div/>").addClass("b-m-mpanel").attr("unselectable", "on").css("display", "none");
        var j = a("<div/>").addClass("b-m-item").attr("unselectable", "on");
        var h = a("<div/>").addClass("b-m-split");
        var s = function (A) {
            u[A.alias] = this;
            this.gidx = A.alias;
            this.id = A.alias;
            if (A.disable) {
                this.disable = A.disable;
                this.className = "b-m-idisable"
            }
            a(this).width(A.width).click(b).mousedown(b).appendTo(a("body"));
            A = null;
            return this
        };
        var g = function (B) {
            var A = this;
            A.title = B.text;
            A.idx = B.alias;
            A.gidx = B.gidx;
            A.data = B;
            A.innerHTML = t.replace(/\$\[([^\]]+)\]/g, function () {
                return B[arguments[1]]
            });
            if (B.disable) {
                A.disable = B.disable;
                A.className = "b-m-idisable"
            }
            B.items && (A.group = true);
            B.action && (i[B.alias] = B.action);
            y[B.alias] = A;
            A = B = null;
            return this
        };
        var m = function (D, A) {
            var C = null;
            for (var B = 0; B < A.length; B++) {
                if (A[B].type == "splitLine") {
                    C = h.clone()[0]
                } else {
                    A[B].gidx = D;
                    if (A[B].type == "group") {
                        s.apply(k.clone()[0], [A[B]]);
                        arguments.callee(A[B].alias, A[B].items);
                        A[B].type = "arrow";
                        C = g.apply(j.clone()[0], [A[B]])
                    } else {
                        A[B].type = "ibody";
                        C = g.apply(j.clone()[0], [A[B]]);
                        a(C).click(function (E) {
                            if (!this.disable) {
                                if (a.isFunction(i[this.idx])) {
                                    i[this.idx].call(this, z)
                                }
                                c()
                            }
                            return false
                        })
                    }
                    a(C).bind("contextmenu", b).hover(o, v)
                }
                u[D].appendChild(C);
                C = A[B] = A[B].items = null
            }
            D = A = null
        };
        var o = function (B) {
            if (this.disable) {
                return false
            }
            c.call(u[this.gidx]);
            if (this.group) {
                var C = a(this).offset();
                var A = a(this).outerWidth();
                e.apply(u[this.idx], [C, A])
            }
            this.className = "b-m-ifocus";
            return false
        };
        var v = function (A) {
            if (this.disable) {
                return false
            }
            if (!this.group) {
                this.className = "b-m-item"
            }
            return false
        };
        var e = function (F, C) {
            var E = a("body").width();
            var B = document.documentElement.clientHeight;
            var D = a(this).outerWidth();
            var A = a(this).outerHeight();
            F.left = F.left + C + D > E ? F.left - D < 0 ? 0 : F.left - D : F.left + C;
            F.top = F.top + A > B ? F.top - A + (C > 0 ? 25 : 0) < 0 ? 0 : F.top - A + (C > 0 ? 25 : 0) : F.top;
            a(this).css(F).show();
            p.push(this.gidx)
        };
        var c = function () {
            var B = null;
            for (var A = p.length - 1; A >= 0; A--) {
                if (p[A] == this.gidx) {
                    break
                }
                B = p.pop();
                u[B].style.display = "none";
                y[B] && (y[B].className = "b-m-item")
            }
        };

        function f(B) {
            if (q && q == B.name) {
                return false
            }
            for (var A in y) {
                d(A, !B.disable)
            }
            for (var A = 0; A < B.items.length; A++) {
                d(B.items[A], B.disable)
            }
            q = B.name
        }

        function d(A, B) {
            var C = y[A];
            C.className = (C.disable = C.lastChild.disabled = B) ? "b-m-idisable" : "b-m-item"
        }

        function n(A, B) {
            z = B;
            e.call(u.cmroot, {left: A.pageX, top: A.pageY}, 0);
            a(document).one("mousedown", c)
        }

        var w = a("#" + l.alias);
        var r = null;
        if (w.length == 0) {
            r = s.apply(k.clone()[0], [l]);
            r.applyrule = f;
            r.showMenu = n;
            m(l.alias, l.items)
        } else {
            r = w[0]
        }
        var x = a(this).each(function () {
            return a(this).bind("contextmenu", function (B) {
                var A = l.onContextMenu && a.isFunction(l.onContextMenu) ? l.onContextMenu.call(this, B) : true;
                if (A) {
                    if (l.onShow && a.isFunction(l.onShow)) {
                        l.onShow.call(this, r)
                    }
                    r.showMenu(B, this)
                }
                return false
            })
        });
        if (l.rule) {
            f(l.rule)
        }
        k = j = h = t = s = g = null;
        m = o = v = null;
        $("img[src='undefined']").attr("src", __contextPath + "/framework/css/common/images/icon/empty.gif");
        return x
    }
})(jQuery);
//ztree
(function (l) {
    var D, E, F, G, H, I, p = {}, J = {}, s = {}, M = 0, K = {
        treeId: "",
        treeObj: null,
        view: {
            addDiyDom: null,
            autoCancelSelected: !0,
            dblClickExpand: !0,
            expandSpeed: "fast",
            fontCss: {},
            nameIsHTML: !1,
            selectedMulti: !0,
            showIcon: !0,
            showLine: !0,
            showTitle: !0
        },
        data: {
            key: {children: "children", name: "name", title: ""},
            simpleData: {enable: !1, idKey: "id", pIdKey: "pId", rootPId: null},
            keep: {parent: !1, leaf: !1}
        },
        async: {
            enable: !1,
            contentType: "application/x-www-form-urlencoded",
            type: "post",
            dataType: "text",
            url: "",
            autoParam: [],
            otherParam: [],
            dataFilter: null
        },
        callback: {
            beforeAsync: null,
            beforeClick: null,
            beforeRightClick: null,
            beforeMouseDown: null,
            beforeMouseUp: null,
            beforeExpand: null,
            beforeCollapse: null,
            onAsyncError: null,
            onAsyncSuccess: null,
            onNodeCreated: null,
            onClick: null,
            onRightClick: null,
            onMouseDown: null,
            onMouseUp: null,
            onExpand: null,
            onCollapse: null
        }
    }, t = [function (b) {
        var a = b.treeObj, c = f.event;
        a.unbind(c.NODECREATED);
        a.bind(c.NODECREATED, function (a, c, h) {
            k.apply(b.callback.onNodeCreated, [a, c, h])
        });
        a.unbind(c.CLICK);
        a.bind(c.CLICK, function (a, c, h, j) {
            k.apply(b.callback.onClick, [a, c, h, j])
        });
        a.unbind(c.EXPAND);
        a.bind(c.EXPAND, function (a, c, h) {
            k.apply(b.callback.onExpand, [a, c, h])
        });
        a.unbind(c.COLLAPSE);
        a.bind(c.COLLAPSE, function (a, c, h) {
            k.apply(b.callback.onCollapse, [a, c, h])
        });
        a.unbind(c.ASYNC_SUCCESS);
        a.bind(c.ASYNC_SUCCESS, function (a, c, h, j) {
            k.apply(b.callback.onAsyncSuccess, [a, c, h, j])
        });
        a.unbind(c.ASYNC_ERROR);
        a.bind(c.ASYNC_ERROR, function (a, c, h, j, g, f) {
            k.apply(b.callback.onAsyncError, [a, c, h, j, g, f])
        })
    }], q = [function (b) {
        var a = g.getCache(b);
        a || (a = {}, g.setCache(b, a));
        a.nodes = [];
        a.doms = []
    }], v = [function (b, a, c, d, e, h) {
        if (c) {
            var j = b.data.key.children;
            c.level = a;
            c.tId = b.treeId + "_" + ++M;
            c.parentTId = d ? d.tId : null;
            if (c[j] && c[j].length > 0) {
                if (typeof c.open == "string") {
                    c.open = k.eqs(c.open, "true")
                }
                c.open = !!c.open;
                c.isParent = !0;
                c.zAsync = !0
            } else {
                c.open = !1;
                if (typeof c.isParent == "string") {
                    c.isParent = k.eqs(c.isParent, "true")
                }
                c.isParent = !!c.isParent;
                c.zAsync = !c.isParent
            }
            c.isFirstNode = e;
            c.isLastNode = h;
            c.getParentNode = function () {
                return g.getNodeCache(b, c.parentTId)
            };
            c.getPreNode = function () {
                return g.getPreNode(b, c)
            };
            c.getNextNode = function () {
                return g.getNextNode(b, c)
            };
            c.isAjaxing = !1;
            g.fixPIdKeyValue(b, c)
        }
    }], w = [function (b) {
        var a = b.target, c = p[b.data.treeId], d = "", e = null, h = "", j = "", i = null, o = null, l = null;
        if (k.eqs(b.type, "mousedown")) {
            j = "mousedown"
        } else {
            if (k.eqs(b.type, "mouseup")) {
                j = "mouseup"
            } else {
                if (k.eqs(b.type, "contextmenu")) {
                    j = "contextmenu"
                } else {
                    if (k.eqs(b.type, "click")) {
                        if (k.eqs(a.tagName, "button") && a.blur(), k.eqs(a.tagName, "button") && a.getAttribute("treeNode" + f.id.SWITCH) !== null) {
                            d = a.parentNode.id, h = "switchNode"
                        } else {
                            if (l = k.getMDom(c, a, [{tagName: "a", attrName: "treeNode" + f.id.A}])) {
                                d = l.parentNode.id, h = "clickNode"
                            }
                        }
                    } else {
                        if (k.eqs(b.type, "dblclick") && (j = "dblclick", l = k.getMDom(c, a, [{
                                tagName: "a",
                                attrName: "treeNode" + f.id.A
                            }]))) {
                            d = l.parentNode.id, h = "switchNode"
                        }
                    }
                }
            }
        }
        if (j.length > 0 && d.length == 0 && (l = k.getMDom(c, a, [{tagName: "a", attrName: "treeNode" + f.id.A}]))) {
            d = l.parentNode.id
        }
        if (d.length > 0) {
            switch (e = g.getNodeCache(c, d), h) {
                case"switchNode":
                    e.isParent ? k.eqs(b.type, "click") || k.eqs(b.type, "dblclick") && k.apply(c.view.dblClickExpand, [c.treeId, e], c.view.dblClickExpand) ? i = D : h = "" : h = "";
                    break;
                case"clickNode":
                    i = E
            }
        }
        switch (j) {
            case"mousedown":
                o = F;
                break;
            case"mouseup":
                o = G;
                break;
            case"dblclick":
                o = H;
                break;
            case"contextmenu":
                o = I
        }
        return {stop: !1, node: e, nodeEventType: h, nodeEventCallback: i, treeEventType: j, treeEventCallback: o}
    }], x = [function (b) {
        var a = g.getRoot(b);
        a || (a = {}, g.setRoot(b, a));
        a.children = [];
        a.expandTriggerFlag = !1;
        a.curSelectedList = [];
        a.noSelection = !0;
        a.createdNodes = []
    }], y = [], z = [], A = [], B = [], C = [], g = {
        addNodeCache: function (b, a) {
            g.getCache(b).nodes[a.tId] = a
        }, addAfterA: function (b) {
            z.push(b)
        }, addBeforeA: function (b) {
            y.push(b)
        }, addInnerAfterA: function (b) {
            B.push(b)
        }, addInnerBeforeA: function (b) {
            A.push(b)
        }, addInitBind: function (b) {
            t.push(b)
        }, addInitCache: function (b) {
            q.push(b)
        }, addInitNode: function (b) {
            v.push(b)
        }, addInitProxy: function (b) {
            w.push(b)
        }, addInitRoot: function (b) {
            x.push(b)
        }, addNodesData: function (b, a, c) {
            var d = b.data.key.children;
            a[d] || (a[d] = []);
            if (a[d].length > 0) {
                a[d][a[d].length - 1].isLastNode = !1, i.setNodeLineIcos(b, a[d][a[d].length - 1])
            }
            a.isParent = !0;
            a[d] = a[d].concat(c)
        }, addSelectedNode: function (b, a) {
            var c = g.getRoot(b);
            g.isSelectedNode(b, a) || c.curSelectedList.push(a)
        }, addCreatedNode: function (b, a) {
            (b.callback.onNodeCreated || b.view.addDiyDom) && g.getRoot(b).createdNodes.push(a)
        }, addZTreeTools: function (b) {
            C.push(b)
        }, exSetting: function (b) {
            l.extend(!0, K, b)
        }, fixPIdKeyValue: function (b, a) {
            b.data.simpleData.enable && (a[b.data.simpleData.pIdKey] = a.parentTId ? a.getParentNode()[b.data.simpleData.idKey] : b.data.simpleData.rootPId)
        }, getAfterA: function (b, a, c) {
            for (var d = 0, e = z.length; d < e; d++) {
                z[d].apply(this, arguments)
            }
        }, getBeforeA: function (b, a, c) {
            for (var d = 0, e = y.length; d < e; d++) {
                y[d].apply(this, arguments)
            }
        }, getInnerAfterA: function (b, a, c) {
            for (var d = 0, e = B.length; d < e; d++) {
                B[d].apply(this, arguments)
            }
        }, getInnerBeforeA: function (b, a, c) {
            for (var d = 0, e = A.length; d < e; d++) {
                A[d].apply(this, arguments)
            }
        }, getCache: function (b) {
            return s[b.treeId]
        }, getNextNode: function (b, a) {
            if (!a) {
                return null
            }
            var c = b.data.key.children, d = a.parentTId ? a.getParentNode() : g.getRoot(b);
            if (!a.isLastNode) {
                if (a.isFirstNode) {
                    return d[c][1]
                } else {
                    for (var e = 1, h = d[c].length - 1; e < h; e++) {
                        if (d[c][e] === a) {
                            return d[c][e + 1]
                        }
                    }
                }
            }
            return null
        }, getNodeByParam: function (b, a, c, d) {
            if (!a || !c) {
                return null
            }
            for (var e = b.data.key.children, h = 0, j = a.length; h < j; h++) {
                if (a[h][c] == d) {
                    return a[h]
                }
                var f = g.getNodeByParam(b, a[h][e], c, d);
                if (f) {
                    return f
                }
            }
            return null
        }, getNodeCache: function (b, a) {
            if (!a) {
                return null
            }
            var c = s[b.treeId].nodes[a];
            return c ? c : null
        }, getNodes: function (b) {
            return g.getRoot(b)[b.data.key.children]
        }, getNodesByParam: function (b, a, c, d) {
            if (!a || !c) {
                return []
            }
            for (var e = b.data.key.children, h = [], j = 0, f = a.length; j < f; j++) {
                a[j][c] == d && h.push(a[j]), h = h.concat(g.getNodesByParam(b, a[j][e], c, d))
            }
            return h
        }, getNodesByParamFuzzy: function (b, a, c, d) {
            if (!a || !c) {
                return []
            }
            for (var e = b.data.key.children, h = [], j = 0, f = a.length; j < f; j++) {
                typeof a[j][c] == "string" && a[j][c].indexOf(d) > -1 && h.push(a[j]), h = h.concat(g.getNodesByParamFuzzy(b, a[j][e], c, d))
            }
            return h
        }, getPreNode: function (b, a) {
            if (!a) {
                return null
            }
            var c = b.data.key.children, d = a.parentTId ? a.getParentNode() : g.getRoot(b);
            if (!a.isFirstNode) {
                if (a.isLastNode) {
                    return d[c][d[c].length - 2]
                } else {
                    for (var e = 1, h = d[c].length - 1; e < h; e++) {
                        if (d[c][e] === a) {
                            return d[c][e - 1]
                        }
                    }
                }
            }
            return null
        }, getRoot: function (b) {
            return b ? J[b.treeId] : null
        }, getSetting: function (b) {
            return p[b]
        }, getSettings: function () {
            return p
        }, getTitleKey: function (b) {
            return b.data.key.title === "" ? b.data.key.name : b.data.key.title
        }, getZTreeTools: function (b) {
            return (b = this.getRoot(this.getSetting(b))) ? b.treeTools : null
        }, initCache: function (b) {
            for (var a = 0, c = q.length; a < c; a++) {
                q[a].apply(this, arguments)
            }
        }, initNode: function (b, a, c, d, e, h) {
            for (var j = 0, f = v.length; j < f; j++) {
                v[j].apply(this, arguments)
            }
        }, initRoot: function (b) {
            for (var a = 0, c = x.length; a < c; a++) {
                x[a].apply(this, arguments)
            }
        }, isSelectedNode: function (b, a) {
            for (var c = g.getRoot(b), d = 0, e = c.curSelectedList.length; d < e; d++) {
                if (a === c.curSelectedList[d]) {
                    return !0
                }
            }
            return !1
        }, removeNodeCache: function (b, a) {
            var c = b.data.key.children;
            if (a[c]) {
                for (var d = 0, e = a[c].length; d < e; d++) {
                    arguments.callee(b, a[c][d])
                }
            }
            delete g.getCache(b).nodes[a.tId]
        }, removeSelectedNode: function (b, a) {
            for (var c = g.getRoot(b), d = 0, e = c.curSelectedList.length; d < e; d++) {
                if (a === c.curSelectedList[d] || !g.getNodeCache(b, c.curSelectedList[d].tId)) {
                    c.curSelectedList.splice(d, 1), d--, e--
                }
            }
        }, setCache: function (b, a) {
            s[b.treeId] = a
        }, setRoot: function (b, a) {
            J[b.treeId] = a
        }, setZTreeTools: function (b, a) {
            for (var c = 0, d = C.length; c < d; c++) {
                C[c].apply(this, arguments)
            }
        }, transformToArrayFormat: function (b, a) {
            if (!a) {
                return []
            }
            var c = b.data.key.children, d = [];
            if (k.isArray(a)) {
                for (var e = 0, h = a.length; e < h; e++) {
                    d.push(a[e]), a[e][c] && (d = d.concat(g.transformToArrayFormat(b, a[e][c])))
                }
            } else {
                d.push(a), a[c] && (d = d.concat(g.transformToArrayFormat(b, a[c])))
            }
            return d
        }, transformTozTreeFormat: function (b, a) {
            var c, d, e = b.data.simpleData.idKey, h = b.data.simpleData.pIdKey, j = b.data.key.children;
            if (!e || e == "" || !a) {
                return []
            }
            if (k.isArray(a)) {
                var f = [], g = [];
                for (c = 0, d = a.length; c < d; c++) {
                    g[a[c][e]] = a[c]
                }
                for (c = 0, d = a.length; c < d; c++) {
                    g[a[c][h]] && a[c][e] != a[c][h] ? (g[a[c][h]][j] || (g[a[c][h]][j] = []), g[a[c][h]][j].push(a[c])) : f.push(a[c])
                }
                return f
            } else {
                return [a]
            }
        }
    }, m = {
        bindEvent: function (b) {
            for (var a = 0, c = t.length; a < c; a++) {
                t[a].apply(this, arguments)
            }
        }, bindTree: function (b) {
            var a = {treeId: b.treeId}, b = b.treeObj;
            b.unbind("click", m.proxy);
            b.bind("click", a, m.proxy);
            b.unbind("dblclick", m.proxy);
            b.bind("dblclick", a, m.proxy);
            b.unbind("mouseover", m.proxy);
            b.bind("mouseover", a, m.proxy);
            b.unbind("mouseout", m.proxy);
            b.bind("mouseout", a, m.proxy);
            b.unbind("mousedown", m.proxy);
            b.bind("mousedown", a, m.proxy);
            b.unbind("mouseup", m.proxy);
            b.bind("mouseup", a, m.proxy);
            b.unbind("contextmenu", m.proxy);
            b.bind("contextmenu", a, m.proxy)
        }, doProxy: function (b) {
            for (var a = [], c = 0, d = w.length; c < d; c++) {
                var e = w[c].apply(this, arguments);
                a.push(e);
                if (e.stop) {
                    break
                }
            }
            return a
        }, proxy: function (b) {
            var a = g.getSetting(b.data.treeId);
            if (!k.uCanDo(a, b)) {
                return !0
            }
            for (var c = m.doProxy(b), d = !0, e = !1, h = 0, j = c.length; h < j; h++) {
                var f = c[h];
                f.nodeEventCallback && (e = !0, d = f.nodeEventCallback.apply(f, [b, f.node]) && d);
                f.treeEventCallback && (e = !0, d = f.treeEventCallback.apply(f, [b, f.node]) && d)
            }
            try {
                e && l("input:focus").length == 0 && k.noSel(a)
            } catch (i) {
            }
            return d
        }
    };
    D = function (b, a) {
        var c = p[b.data.treeId];
        if (a.open) {
            if (k.apply(c.callback.beforeCollapse, [c.treeId, a], !0) == !1) {
                return !0
            }
        } else {
            if (k.apply(c.callback.beforeExpand, [c.treeId, a], !0) == !1) {
                return !0
            }
        }
        g.getRoot(c).expandTriggerFlag = !0;
        i.switchNode(c, a);
        return !0
    };
    E = function (b, a) {
        var c = p[b.data.treeId], d = c.view.autoCancelSelected && b.ctrlKey && g.isSelectedNode(c, a) ? 0 : c.view.autoCancelSelected && b.ctrlKey && c.view.selectedMulti ? 2 : 1;
        if (k.apply(c.callback.beforeClick, [c.treeId, a, d], !0) == !1) {
            return !0
        }
        d === 0 ? i.cancelPreSelectedNode(c, a) : i.selectNode(c, a, d === 2);
        c.treeObj.trigger(f.event.CLICK, [c.treeId, a, d]);
        return !0
    };
    F = function (b, a) {
        var c = p[b.data.treeId];
        k.apply(c.callback.beforeMouseDown, [c.treeId, a], !0) && k.apply(c.callback.onMouseDown, [b, c.treeId, a]);
        return !0
    };
    G = function (b, a) {
        var c = p[b.data.treeId];
        k.apply(c.callback.beforeMouseUp, [c.treeId, a], !0) && k.apply(c.callback.onMouseUp, [b, c.treeId, a]);
        return !0
    };
    H = function (b, a) {
        var c = p[b.data.treeId];
        k.apply(c.callback.beforeDblClick, [c.treeId, a], !0) && k.apply(c.callback.onDblClick, [b, c.treeId, a]);
        return !0
    };
    I = function (b, a) {
        var c = p[b.data.treeId];
        k.apply(c.callback.beforeRightClick, [c.treeId, a], !0) && k.apply(c.callback.onRightClick, [b, c.treeId, a]);
        return typeof c.callback.onRightClick != "function"
    };
    var k =
        {
            apply: function (b, a, c) {
                return typeof b == "function" ? b.apply(L, a ? a : []) : c
            }, canAsync: function (b, a) {
            var c = b.data.key.children;
            return a && a.isParent && !(a.zAsync || a[c] && a[c].length > 0)
        }, clone: function (b) {
            var a;
            if (b instanceof Array) {
                a = [];
                for (var c = b.length; c--;) {
                    a[c] = arguments.callee(b[c])
                }
                return a
            } else {
                if (typeof b == "function") {
                    return b
                } else {
                    if (b instanceof Object) {
                        a = {};
                        for (c in b) {
                            a[c] = arguments.callee(b[c])
                        }
                        return a
                    } else {
                        return b
                    }
                }
            }
        }, eqs: function (b, a) {
            return b.toLowerCase() === a.toLowerCase()
        }, isArray: function (b) {
            return Object.prototype.toString.apply(b) === "[object Array]"
        }
            , $: function (b, a, c) {
            a && typeof a != "string" && (c = a, a = "");
            return typeof b == "string" ? l(b, c ? c.treeObj.get(0).ownerDocument : null) : l("#" + b.tId + a, c ? c.treeObj : null)
        }, getMDom: function (b, a, c) {
            if (!a) {
                return null
            }
            for (; a && a.id !== b.treeId;) {
                for (var d = 0, e = c.length; a.tagName && d < e; d++) {
                    if (k.eqs(a.tagName, c[d].tagName) && a.getAttribute(c[d].attrName) !== null) {
                        return a
                    }
                }
                a = a.parentNode
            }
            return null
        }, noSel: function (b) {
            if (g.getRoot(b).noSelection) {
                try {
                    window.getSelection ? window.getSelection().removeAllRanges() : document.selection.empty()
                } catch (a) {
                }
            }
        }, uCanDo: function () {
            return !0
        }
        }
        , i = {
            addNodes: function (b, a, c, d) {
                if (!b.data.keep.leaf || !a || a.isParent) {
                    if (k.isArray(c) || (c = [c]), b.data.simpleData.enable && (c = g.transformTozTreeFormat(b, c)), a) {
                        var e = l("#" + a.tId + f.id.SWITCH), h = l("#" + a.tId + f.id.ICON), j = l("#" + a.tId + f.id.UL);
                        if (!a.open) {
                            i.replaceSwitchClass(a, e, f.folder.CLOSE), i.replaceIcoClass(a, h, f.folder.CLOSE), a.open = !1, j.css({display: "none"})
                        }
                        g.addNodesData(b, a, c);
                        i.createNodes(b, a.level + 1, c, a);
                        d || i.expandCollapseParentNode(b, a, !0)
                    } else {
                        g.addNodesData(b, g.getRoot(b), c), i.createNodes(b, 0, c, null)
                    }
                }
            }, appendNodes: function (b, a, c, d, e, h) {
                if (!c) {
                    return []
                }
                for (var j = [], l = b.data.key.children, o = b.data.key.name, m = g.getTitleKey(b), p = 0, N = c.length; p < N; p++) {
                    var n = c[p], u = (d ? d : g.getRoot(b))[l].length == c.length && p == 0, r = p == c.length - 1;
                    e && (g.initNode(b, a, n, d, u, r, h), g.addNodeCache(b, n));
                    u = [];
                    n[l] && n[l].length > 0 && (u = i.appendNodes(b, a + 1, n[l], n, e, h && n.open));
                    if (h) {
                        var r = i.makeNodeUrl(b, n), s = i.makeNodeFontCss(b, n), t = [], q;
                        for (q in s) {
                            t.push(q, ":", s[q], ";")
                        }
                        j.push("<li id='", n.tId, "' class='level", n.level, "' treenode>", "<button type='button' hidefocus='true'", n.isParent ? "" : "disabled", " id='", n.tId, f.id.SWITCH, "' title='' class='", i.makeNodeLineClass(b, n), "' treeNode", f.id.SWITCH, "></button>");
                        g.getBeforeA(b, n, j);
                        j.push("<a id='", n.tId, f.id.A, "' class='level", n.level, "' treeNode", f.id.A, ' onclick="', n.click || "", '" ', r != null && r.length > 0 ? "href='" + r + "'" : "", " target='", i.makeNodeTarget(n), "' style='", t.join(""), "'");
                        k.apply(b.view.showTitle, [b.treeId, n], b.view.showTitle) && n[m] && j.push("title='", n[m].replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;"), "'");
                        j.push(">");
                        g.getInnerBeforeA(b, n, j);
                        r = b.view.nameIsHTML ? n[o] : n[o].replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                        j.push("<button type='button' hidefocus='true' id='", n.tId, f.id.ICON, "' title='' treeNode", f.id.ICON, " class='", i.makeNodeIcoClass(b, n), "' style='", i.makeNodeIcoStyle(b, n), "'></button><span id='", n.tId, f.id.SPAN, "'>", r, "</span>");
                        g.getInnerAfterA(b, n, j);
                        j.push("</a>");
                        g.getAfterA(b, n, j);
                        n.isParent && n.open && i.makeUlHtml(b, n, j, u.join(""));
                        j.push("</li>");
                        g.addCreatedNode(b, n)
                    }
                }
                return j
            }, appendParentULDom: function (b, a) {
                var c = [], d = l("#" + a.tId), e = l("#" + a.tId + f.id.UL), h = i.appendNodes(b, a.level + 1, a[b.data.key.children], a, !1, !0);
                i.makeUlHtml(b, a, c, h.join(""));
                !d.get(0) && a.parentTId && (i.appendParentULDom(b, a.getParentNode()), d = l("#" + a.tId));
                e.get(0) && e.remove();
                d.append(c.join(""));
                i.createNodeCallback(b)
            }, asyncNode: function (b, a, c, d) {
                var e, h;
                if (a && !a.isParent) {
                    return k.apply(d), !1
                } else {
                    if (a && a.isAjaxing) {
                        return !1
                    } else {
                        if (k.apply(b.callback.beforeAsync, [b.treeId, a], !0) == !1) {
                            return k.apply(d), !1
                        }
                    }
                }
                if (a) {
                    a.isAjaxing = !0, l("#" + a.tId + f.id.ICON).attr({style: "", "class": "ico_loading"})
                }
                var j = b.async.contentType == "application/json", g = j ? "{" : "", o = "";
                for (e = 0, h = b.async.autoParam.length; a && e < h; e++) {
                    var m = b.async.autoParam[e].split("="), p = m;
                    m.length > 1 && (p = m[1], m = m[0]);
                    j ? (o = typeof a[m] == "string" ? '"' : "", g += '"' + p + ('":' + o + a[m]).replace(/'/g, "\\'") + o + ",") : g += p + ("=" + a[m]).replace(/&/g, "%26") + "&"
                }
                if (k.isArray(b.async.otherParam)) {
                    for (e = 0, h = b.async.otherParam.length; e < h; e += 2) {
                        j ? (o = typeof b.async.otherParam[e + 1] == "string" ? '"' : "", g += '"' + b.async.otherParam[e] + ('":' + o + b.async.otherParam[e + 1]).replace(/'/g, "\\'") + o + ",") : g += b.async.otherParam[e] + ("=" + b.async.otherParam[e + 1]).replace(/&/g, "%26") + "&"
                    }
                } else {
                    for (var q in b.async.otherParam) {
                        j ? (o = typeof b.async.otherParam[q] == "string" ? '"' : "", g += '"' + q + ('":' + o + b.async.otherParam[q]).replace(/'/g, "\\'") + o + ",") : g += q + ("=" + b.async.otherParam[q]).replace(/&/g, "%26") + "&"
                    }
                }
                g.length > 1 && (g = g.substring(0, g.length - 1));
                j && (g += "}");
                l.ajax({
                    contentType: b.async.contentType,
                    type: b.async.type,
                    url: k.apply(b.async.url, [b.treeId, a], b.async.url),
                    data: g,
                    dataType: b.async.dataType,
                    success: function (e) {
                        var h = [];
                        try {
                            h = !e || e.length == 0 ? [] : typeof e == "string" ? eval("(" + e + ")") : e
                        } catch (g) {
                        }
                        if (a) {
                            a.isAjaxing = null, a.zAsync = !0
                        }
                        i.setNodeLineIcos(b, a);
                        h && h != "" ? (h = k.apply(b.async.dataFilter, [b.treeId, a, h], h), i.addNodes(b, a, k.clone(h), !!c)) : i.addNodes(b, a, [], !!c);
                        b.treeObj.trigger(f.event.ASYNC_SUCCESS, [b.treeId, a, e]);
                        k.apply(d)
                    },
                    error: function (c, d, e) {
                        i.setNodeLineIcos(b, a);
                        if (a) {
                            a.isAjaxing = null
                        }
                        b.treeObj.trigger(f.event.ASYNC_ERROR, [b.treeId, a, c, d, e])
                    }
                });
                return !0
            }, cancelPreSelectedNode: function (b, a) {
                for (var c = g.getRoot(b).curSelectedList, d = c.length - 1; d >= 0; d--) {
                    if (!a || a === c[d]) {
                        if (l("#" + c[d].tId + f.id.A).removeClass(f.node.CURSELECTED), i.setNodeName(b, c[d]), a) {
                            g.removeSelectedNode(b, a);
                            break
                        }
                    }
                }
                if (!a) {
                    g.getRoot(b).curSelectedList = []
                }
            }, createNodeCallback: function (b) {
                if (b.callback.onNodeCreated || b.view.addDiyDom) {
                    for (var a = g.getRoot(b); a.createdNodes.length > 0;) {
                        var c = a.createdNodes.shift();
                        k.apply(b.view.addDiyDom, [b.treeId, c]);
                        b.callback.onNodeCreated && b.treeObj.trigger(f.event.NODECREATED, [b.treeId, c])
                    }
                }
            }, createNodes: function (b, a, c, d) {
                if (c && c.length != 0) {
                    var e = g.getRoot(b), h = b.data.key.children, h = !d || d.open || !!l("#" + d[h][0].tId).get(0);
                    e.createdNodes = [];
                    a = i.appendNodes(b, a, c, d, !0, h);
                    d ? (d = l("#" + d.tId + f.id.UL), d.get(0) && d.append(a.join(""))) : b.treeObj.append(a.join(""));
                    i.createNodeCallback(b)
                }
            }, expandCollapseNode: function (b, a, c, d, e) {
                var h = g.getRoot(b), j = b.data.key.children;
                if (a) {
                    if (h.expandTriggerFlag) {
                        var m = e, e = function () {
                            m && m();
                            a.open ? b.treeObj.trigger(f.event.EXPAND, [b.treeId, a]) : b.treeObj.trigger(f.event.COLLAPSE, [b.treeId, a])
                        };
                        h.expandTriggerFlag = !1
                    }
                    if (a.open == c) {
                        k.apply(e, [])
                    } else {
                        !a.open && a.isParent && (!l("#" + a.tId + f.id.UL).get(0) || a[j] && a[j].length > 0 && !l("#" + a[j][0].tId).get(0)) && i.appendParentULDom(b, a);
                        var c = l("#" + a.tId + f.id.UL), h = l("#" + a.tId + f.id.SWITCH), o = l("#" + a.tId + f.id.ICON);
                        a.isParent ? (a.open = !a.open, a.iconOpen && a.iconClose && o.attr("style", i.makeNodeIcoStyle(b, a)), a.open ? (i.replaceSwitchClass(a, h, f.folder.OPEN), i.replaceIcoClass(a, o, f.folder.OPEN), d == !1 || b.view.expandSpeed == "" ? (c.show(), k.apply(e, [])) : a[j] && a[j].length > 0 ? c.slideDown(b.view.expandSpeed, e) : (c.show(), k.apply(e, []))) : (i.replaceSwitchClass(a, h, f.folder.CLOSE), i.replaceIcoClass(a, o, f.folder.CLOSE), d == !1 || b.view.expandSpeed == "" ? (c.hide(), k.apply(e, [])) : c.slideUp(b.view.expandSpeed, e))) : k.apply(e, [])
                    }
                } else {
                    k.apply(e, [])
                }
            }, expandCollapseParentNode: function (b, a, c, d, e) {
                a && (a.parentTId ? (i.expandCollapseNode(b, a, c, d), a.parentTId && i.expandCollapseParentNode(b, a.getParentNode(), c, d, e)) : i.expandCollapseNode(b, a, c, d, e))
            }, expandCollapseSonNode: function (b, a, c, d, e) {
                var h = g.getRoot(b), f = b.data.key.children, h = a ? a[f] : h[f], f = a ? !1 : d, k = g.getRoot(b).expandTriggerFlag;
                g.getRoot(b).expandTriggerFlag = !1;
                if (h) {
                    for (var l = 0, m = h.length; l < m; l++) {
                        h[l] && i.expandCollapseSonNode(b, h[l], c, f)
                    }
                }
                g.getRoot(b).expandTriggerFlag = k;
                i.expandCollapseNode(b, a, c, d, e)
            }, makeNodeFontCss: function (b, a) {
                var c = k.apply(b.view.fontCss, [b.treeId, a], b.view.fontCss);
                return c && typeof c != "function" ? c : {}
            }, makeNodeIcoClass: function (b, a) {
                var c = ["ico"];
                a.isAjaxing || (c[0] = (a.iconSkin ? a.iconSkin + "_" : "") + c[0], a.isParent ? c.push(a.open ? f.folder.OPEN : f.folder.CLOSE) : c.push(f.folder.DOCU));
                return c.join("_")
            }, makeNodeIcoStyle: function (b, a) {
                var c = [];
                if (!a.isAjaxing) {
                    var d = a.isParent && a.iconOpen && a.iconClose ? a.open ? a.iconOpen : a.iconClose : a.icon;
                    d && c.push("background:url(", d, ") 0 0 no-repeat;");
                    (b.view.showIcon == !1 || !k.apply(b.view.showIcon, [b.treeId, a], !0)) && c.push("width:0px;height:0px;")
                }
                return c.join("")
            }, makeNodeLineClass: function (b, a) {
                var c = [];
                b.view.showLine ? a.level == 0 && a.isFirstNode && a.isLastNode ? c.push(f.line.ROOT) : a.level == 0 && a.isFirstNode ? c.push(f.line.ROOTS) : a.isLastNode ? c.push(f.line.BOTTOM) : c.push(f.line.CENTER) : c.push(f.line.NOLINE);
                a.isParent ? c.push(a.open ? f.folder.OPEN : f.folder.CLOSE) : c.push(f.folder.DOCU);
                return i.makeNodeLineClassEx(a) + c.join("_")
            }, makeNodeLineClassEx: function (b) {
                return "level" + b.level + " switch "
            }, makeNodeTarget: function (b) {
                return b.target || "_blank"
            }, makeNodeUrl: function (b, a) {
                return a.url ? a.url : null
            }, makeUlHtml: function (b, a, c, d) {
                c.push("<ul id='", a.tId, f.id.UL, "' class='level", a.level, " ", i.makeUlLineClass(b, a), "' style='display:", a.open ? "block" : "none", "'>");
                c.push(d);
                c.push("</ul>")
            }, makeUlLineClass: function (b, a) {
                return b.view.showLine && !a.isLastNode ? f.line.LINE : ""
            }, replaceIcoClass: function (b, a, c) {
                if (a && !b.isAjaxing && (b = a.attr("class"), b != void 0)) {
                    b = b.split("_");
                    switch (c) {
                        case f.folder.OPEN:
                        case f.folder.CLOSE:
                        case f.folder.DOCU:
                            b[b.length - 1] = c
                    }
                    a.attr("class", b.join("_"))
                }
            }, replaceSwitchClass: function (b, a, c) {
                if (a) {
                    var d = a.attr("class");
                    if (d != void 0) {
                        d = d.split("_");
                        switch (c) {
                            case f.line.ROOT:
                            case f.line.ROOTS:
                            case f.line.CENTER:
                            case f.line.BOTTOM:
                            case f.line.NOLINE:
                                d[0] = i.makeNodeLineClassEx(b) + c;
                                break;
                            case f.folder.OPEN:
                            case f.folder.CLOSE:
                            case f.folder.DOCU:
                                d[1] = c
                        }
                        a.attr("class", d.join("_"));
                        c !== f.folder.DOCU ? a.removeAttr("disabled") : a.attr("disabled", "disabled")
                    }
                }
            }, selectNode: function (b, a, c) {
                c || i.cancelPreSelectedNode(b);
                l("#" + a.tId + f.id.A).addClass(f.node.CURSELECTED);
                g.addSelectedNode(b, a)
            }, setNodeFontCss: function (b, a) {
                var c = l("#" + a.tId + f.id.A), d = i.makeNodeFontCss(b, a);
                d && c.css(d)
            }, setNodeLineIcos: function (b, a) {
                if (a) {
                    var c = l("#" + a.tId + f.id.SWITCH), d = l("#" + a.tId + f.id.UL), e = l("#" + a.tId + f.id.ICON), h = i.makeUlLineClass(b, a);
                    h.length == 0 ? d.removeClass(f.line.LINE) : d.addClass(h);
                    c.attr("class", i.makeNodeLineClass(b, a));
                    a.isParent ? c.removeAttr("disabled") : c.attr("disabled", "disabled");
                    e.removeAttr("style");
                    e.attr("style", i.makeNodeIcoStyle(b, a));
                    e.attr("class", i.makeNodeIcoClass(b, a))
                }
            }, setNodeName: function (b, a) {
                var c = b.data.key.name, d = g.getTitleKey(b), e = l("#" + a.tId + f.id.SPAN);
                e.empty();
                b.view.nameIsHTML ? e.html(a[c]) : e.text(a[c]);
                k.apply(b.view.showTitle, [b.treeId, a], b.view.showTitle) && a[d] && l("#" + a.tId + f.id.A).attr("title", a[d])
            }, setNodeTarget: function (b) {
                l("#" + b.tId + f.id.A).attr("target", i.makeNodeTarget(b))
            }, setNodeUrl: function (b, a) {
                var c = l("#" + a.tId + f.id.A), d = i.makeNodeUrl(b, a);
                d == null || d.length == 0 ? c.removeAttr("href") : c.attr("href", d)
            }, switchNode: function (b, a) {
                a.open || !k.canAsync(b, a) ? i.expandCollapseNode(b, a, !a.open) : b.async.enable ? i.asyncNode(b, a) || i.expandCollapseNode(b, a, !a.open) : a && i.expandCollapseNode(b, a, !a.open)
            }
        };
    l.fn.zTree = {
        consts: {
            event: {
                NODECREATED: "ztree_nodeCreated",
                CLICK: "ztree_click",
                EXPAND: "ztree_expand",
                COLLAPSE: "ztree_collapse",
                ASYNC_SUCCESS: "ztree_async_success",
                ASYNC_ERROR: "ztree_async_error"
            },
            id: {A: "_a", ICON: "_ico", SPAN: "_span", SWITCH: "_switch", UL: "_ul"},
            line: {ROOT: "root", ROOTS: "roots", CENTER: "center", BOTTOM: "bottom", NOLINE: "noline", LINE: "line"},
            folder: {OPEN: "open", CLOSE: "close", DOCU: "docu"},
            node: {CURSELECTED: "curSelectedNode"}
        }, _z: {tools: k, view: i, event: m, data: g}, getZTreeObj: function (b) {
            return (b = g.getZTreeTools(b)) ? b : null
        }, init: function (b, a, c) {
            var d = k.clone(K);
            l.extend(!0, d, a);
            d.treeId = b.attr("id");
            d.treeObj = b;
            d.treeObj.empty();
            p[d.treeId] = d;
            g.initRoot(d);
            b = g.getRoot(d);
            a = d.data.key.children;
            c = c ? k.clone(k.isArray(c) ? c : [c]) : [];
            b[a] = d.data.simpleData.enable ? g.transformTozTreeFormat(d, c) : c;
            g.initCache(d);
            m.bindTree(d);
            m.bindEvent(d);
            c = {
                setting: d, cancelSelectedNode: function (a) {
                    i.cancelPreSelectedNode(this.setting, a)
                }, expandAll: function (a) {
                    a = !!a;
                    i.expandCollapseSonNode(this.setting, null, a, !0);
                    return a
                }, expandNode: function (a, b, c, m, o) {
                    if (!a || !a.isParent) {
                        return null
                    }
                    b !== !0 && b !== !1 && (b = !a.open);
                    if ((o = !!o) && b && k.apply(d.callback.beforeExpand, [d.treeId, a], !0) == !1) {
                        return null
                    } else {
                        if (o && !b && k.apply(d.callback.beforeCollapse, [d.treeId, a], !0) == !1) {
                            return null
                        }
                    }
                    b && a.parentTId && i.expandCollapseParentNode(this.setting, a.getParentNode(), b, !1);
                    if (b === a.open && !c) {
                        return null
                    }
                    g.getRoot(d).expandTriggerFlag = o;
                    c ? i.expandCollapseSonNode(this.setting, a, b, !0, function () {
                        m !== !1 && l("#" + a.tId + f.id.ICON).focus().blur()
                    }) : (a.open = !b, i.switchNode(this.setting, a), m !== !1 && l("#" + a.tId + f.id.ICON).focus().blur());
                    return b
                }, getNodes: function () {
                    return g.getNodes(this.setting)
                }, getNodeByParam: function (a, b, c) {
                    return !a ? null : g.getNodeByParam(this.setting, c ? c[this.setting.data.key.children] : g.getNodes(this.setting), a, b)
                }, getNodeByTId: function (a) {
                    return g.getNodeCache(this.setting, a)
                }, getNodesByParam: function (a, b, c) {
                    return !a ? null : g.getNodesByParam(this.setting, c ? c[this.setting.data.key.children] : g.getNodes(this.setting), a, b)
                }, getNodesByParamFuzzy: function (a, b, c) {
                    return !a ? null : g.getNodesByParamFuzzy(this.setting, c ? c[this.setting.data.key.children] : g.getNodes(this.setting), a, b)
                }, getNodeIndex: function (a) {
                    if (!a) {
                        return null
                    }
                    for (var b = d.data.key.children, c = a.parentTId ? a.getParentNode() : g.getRoot(this.setting), f = 0, i = c[b].length; f < i; f++) {
                        if (c[b][f] == a) {
                            return f
                        }
                    }
                    return -1
                }, getSelectedNodes: function () {
                    for (var a = [], b = g.getRoot(this.setting).curSelectedList, c = 0, d = b.length; c < d; c++) {
                        a.push(b[c])
                    }
                    return a
                }, isSelectedNode: function (a) {
                    return g.isSelectedNode(this.setting, a)
                }, reAsyncChildNodes: function (a, b, c) {
                    if (this.setting.async.enable) {
                        var d = !a;
                        d && (a = g.getRoot(this.setting));
                        b == "refresh" && (a[this.setting.data.key.children] = [], d ? this.setting.treeObj.empty() : l("#" + a.tId + f.id.UL).empty());
                        i.asyncNode(this.setting, d ? null : a, !!c)
                    }
                }, refresh: function () {
                    this.setting.treeObj.empty();
                    var a = g.getRoot(this.setting), b = a[this.setting.data.key.children];
                    g.initRoot(this.setting);
                    a[this.setting.data.key.children] = b;
                    g.initCache(this.setting);
                    i.createNodes(this.setting, 0, a[this.setting.data.key.children])
                }, selectNode: function (a, b) {
                    a && k.uCanDo(this.setting) && (b = d.view.selectedMulti && b, a.parentTId ? i.expandCollapseParentNode(this.setting, a.getParentNode(), !0, !1, function () {
                        l("#" + a.tId + f.id.ICON).focus().blur()
                    }) : l("#" + a.tId + f.id.ICON).focus().blur(), i.selectNode(this.setting, a, b))
                }, transformTozTreeNodes: function (a) {
                    return g.transformTozTreeFormat(this.setting, a)
                }, transformToArray: function (a) {
                    return g.transformToArrayFormat(this.setting, a)
                }, updateNode: function (a) {
                    a && l("#" + a.tId).get(0) && k.uCanDo(this.setting) && (i.setNodeName(this.setting, a), i.setNodeTarget(a), i.setNodeUrl(this.setting, a), i.setNodeLineIcos(this.setting, a), i.setNodeFontCss(this.setting, a))
                }
            };
            b.treeTools = c;
            g.setZTreeTools(d, c);
            b[a] && b[a].length > 0 ? i.createNodes(d, 0, b[a]) : d.async.enable && d.async.url && d.async.url !== "" && i.asyncNode(d);
            return c
        }
    };
    var L = l.fn.zTree, f = L.consts
})(jQuery);
(function (k) {
    var c, b, a, d = {
        event: {CHECK: "ztree_check"},
        id: {CHECK: "_check"},
        checkbox: {
            STYLE: "checkbox",
            DEFAULT: "chk",
            DISABLED: "disable",
            FALSE: "false",
            TRUE: "true",
            FULL: "full",
            PART: "part",
            FOCUS: "focus"
        },
        radio: {STYLE: "radio", TYPE_ALL: "all", TYPE_LEVEL: "level"}
    }, u = {
        check: {
            enable: !1,
            autoCheckTrigger: !1,
            chkStyle: d.checkbox.STYLE,
            nocheckInherit: !1,
            radioType: d.radio.TYPE_LEVEL,
            chkboxType: {Y: "ps", N: "ps"}
        }, data: {key: {checked: "checked"}}, callback: {beforeCheck: null, onCheck: null}
    };
    c = function (j, g) {
        if (g.chkDisabled === !0) {
            return !1
        }
        var e = l.getSetting(j.data.treeId), h = e.data.key.checked;
        if (f.apply(e.callback.beforeCheck, [e.treeId, g], !0) == !1) {
            return !0
        }
        g[h] = !g[h];
        m.checkNodeRelation(e, g);
        h = k("#" + g.tId + i.id.CHECK);
        m.setChkClass(e, h, g);
        m.repairParentChkClassWithSelf(e, g);
        e.treeObj.trigger(i.event.CHECK, [e.treeId, g]);
        return !0
    };
    b = function (j, g) {
        if (g.chkDisabled === !0) {
            return !1
        }
        var e = l.getSetting(j.data.treeId), h = k("#" + g.tId + i.id.CHECK);
        g.check_Focus = !0;
        m.setChkClass(e, h, g);
        return !0
    };
    a = function (j, g) {
        if (g.chkDisabled === !0) {
            return !1
        }
        var e = l.getSetting(j.data.treeId), h = k("#" + g.tId + i.id.CHECK);
        g.check_Focus = !1;
        m.setChkClass(e, h, g);
        return !0
    };
    k.extend(!0, k.fn.zTree.consts, d);
    k.extend(!0, k.fn.zTree._z, {
        tools: {}, view: {
            checkNodeRelation: function (q, h) {
                var e, p, o, j = q.data.key.children, g = q.data.key.checked;
                e = i.radio;
                if (q.check.chkStyle == e.STYLE) {
                    var n = l.getRadioCheckedList(q);
                    if (h[g]) {
                        if (q.check.radioType == e.TYPE_ALL) {
                            for (p = n.length - 1; p >= 0; p--) {
                                e = n[p], e[g] = !1, n.splice(p, 1), m.setChkClass(q, k("#" + e.tId + i.id.CHECK), e), e.parentTId != h.parentTId && m.repairParentChkClassWithSelf(q, e)
                            }
                            n.push(h)
                        } else {
                            n = h.parentTId ? h.getParentNode() : l.getRoot(q);
                            for (p = 0, o = n[j].length; p < o; p++) {
                                e = n[j][p], e[g] && e != h && (e[g] = !1, m.setChkClass(q, k("#" + e.tId + i.id.CHECK), e))
                            }
                        }
                    } else {
                        if (q.check.radioType == e.TYPE_ALL) {
                            for (p = 0, o = n.length; p < o; p++) {
                                if (h == n[p]) {
                                    n.splice(p, 1);
                                    break
                                }
                            }
                        }
                    }
                } else {
                    h[g] && (!h[j] || h[j].length == 0 || q.check.chkboxType.Y.indexOf("s") > -1) && m.setSonNodeCheckBox(q, h, !0), !h[g] && (!h[j] || h[j].length == 0 || q.check.chkboxType.N.indexOf("s") > -1) && m.setSonNodeCheckBox(q, h, !1), h[g] && q.check.chkboxType.Y.indexOf("p") > -1 && m.setParentNodeCheckBox(q, h, !0), !h[g] && q.check.chkboxType.N.indexOf("p") > -1 && m.setParentNodeCheckBox(q, h, !1)
                }
            }, makeChkClass: function (o, g) {
                var e = o.data.key.checked, n = i.checkbox, j = i.radio, h = "", h = g.chkDisabled === !0 ? n.DISABLED : g.halfCheck ? n.PART : o.check.chkStyle == j.STYLE ? g.check_Child_State < 1 ? n.FULL : n.PART : g[e] ? g.check_Child_State === 2 || g.check_Child_State === -1 ? n.FULL : n.PART : g.check_Child_State < 1 ? n.FULL : n.PART, e = o.check.chkStyle + "_" + (g[e] ? n.TRUE : n.FALSE) + "_" + h, e = g.check_Focus && g.chkDisabled !== !0 ? e + "_" + n.FOCUS : e;
                return n.DEFAULT + " " + e
            }, repairAllChk: function (q, h) {
                if (q.check.enable && q.check.chkStyle === i.checkbox.STYLE) {
                    for (var e = q.data.key.checked, p = q.data.key.children, o = l.getRoot(q), j = 0, g = o[p].length; j < g; j++) {
                        var n = o[p][j];
                        n.nocheck !== !0 && (n[e] = h);
                        m.setSonNodeCheckBox(q, n, h)
                    }
                }
            }, repairChkClass: function (h, g) {
                if (g) {
                    l.makeChkFlag(h, g);
                    var e = k("#" + g.tId + i.id.CHECK);
                    m.setChkClass(h, e, g)
                }
            }, repairParentChkClass: function (h, g) {
                if (g && g.parentTId) {
                    var e = g.getParentNode();
                    m.repairChkClass(h, e);
                    m.repairParentChkClass(h, e)
                }
            }, repairParentChkClassWithSelf: function (h, g) {
                if (g) {
                    var e = h.data.key.children;
                    g[e] && g[e].length > 0 ? m.repairParentChkClass(h, g[e][0]) : m.repairParentChkClass(h, g)
                }
            }, repairSonChkDisabled: function (o, g, e) {
                if (g) {
                    var n = o.data.key.children;
                    if (g.chkDisabled != e) {
                        g.chkDisabled = e, g.nocheck !== !0 && m.repairChkClass(o, g)
                    }
                    if (g[n]) {
                        for (var j = 0, h = g[n].length; j < h; j++) {
                            m.repairSonChkDisabled(o, g[n][j], e)
                        }
                    }
                }
            }, repairParentChkDisabled: function (h, g, e) {
                if (g) {
                    if (g.chkDisabled != e) {
                        g.chkDisabled = e, g.nocheck !== !0 && m.repairChkClass(h, g)
                    }
                    m.repairParentChkDisabled(h, g.getParentNode(), e)
                }
            }, setChkClass: function (h, g, e) {
                g && (e.nocheck === !0 ? g.hide() : g.show(), g.removeClass(), g.addClass(m.makeChkClass(h, e)))
            }, setParentNodeCheckBox: function (p, r, q, o) {
                var n = p.data.key.children, h = p.data.key.checked, g = k("#" + r.tId + i.id.CHECK);
                o || (o = r);
                l.makeChkFlag(p, r);
                r.nocheck !== !0 && r.chkDisabled !== !0 && (r[h] = q, m.setChkClass(p, g, r), p.check.autoCheckTrigger && r != o && r.nocheck !== !0 && p.treeObj.trigger(i.event.CHECK, [p.treeId, r]));
                if (r.parentTId) {
                    g = !0;
                    if (!q) {
                        for (var n = r.getParentNode()[n], j = 0, e = n.length; j < e; j++) {
                            if (n[j].nocheck !== !0 && n[j][h] || n[j].nocheck === !0 && n[j].check_Child_State > 0) {
                                g = !1;
                                break
                            }
                        }
                    }
                    g && m.setParentNodeCheckBox(p, r.getParentNode(), q, o)
                }
            }, setSonNodeCheckBox: function (t, x, w, s) {
                if (x) {
                    var r = t.data.key.children, p = t.data.key.checked, j = k("#" + x.tId + i.id.CHECK);
                    s || (s = x);
                    var q = !1;
                    if (x[r]) {
                        for (var h = 0, g = x[r].length; h < g && x.chkDisabled !== !0; h++) {
                            var e = x[r][h];
                            m.setSonNodeCheckBox(t, e, w, s);
                            e.chkDisabled === !0 && (q = !0)
                        }
                    }
                    if (x != l.getRoot(t) && x.chkDisabled !== !0) {
                        q && x.nocheck !== !0 && l.makeChkFlag(t, x);
                        if (x.nocheck !== !0) {
                            if (x[p] = w, !q) {
                                x.check_Child_State = x[r] && x[r].length > 0 ? w ? 2 : 0 : -1
                            }
                        } else {
                            x.check_Child_State = -1
                        }
                        m.setChkClass(t, j, x);
                        t.check.autoCheckTrigger && x != s && x.nocheck !== !0 && t.treeObj.trigger(i.event.CHECK, [t.treeId, x])
                    }
                }
            }
        }, event: {}, data: {
            getRadioCheckedList: function (j) {
                for (var g = l.getRoot(j).radioCheckedList, e = 0, h = g.length; e < h; e++) {
                    l.getNodeCache(j, g[e].tId) || (g.splice(e, 1), e--, h--)
                }
                return g
            }, getCheckStatus: function (h, g) {
                if (!h.check.enable || g.nocheck) {
                    return null
                }
                var e = h.data.key.checked;
                return {
                    checked: g[e],
                    half: g.halfCheck ? g.halfCheck : h.check.chkStyle == i.radio.STYLE ? g.check_Child_State === 2 : g[e] ? g.check_Child_State > -1 && g.check_Child_State < 2 : g.check_Child_State > 0
                }
            }, getTreeCheckedNodes: function (r, h, g, q) {
                if (!h) {
                    return []
                }
                for (var o = r.data.key.children, j = r.data.key.checked, q = !q ? [] : q, p = 0, n = h.length; p < n; p++) {
                    h[p].nocheck !== !0 && h[p][j] == g && q.push(h[p]), l.getTreeCheckedNodes(r, h[p][o], g, q)
                }
                return q
            }, getTreeChangeCheckedNodes: function (q, h, g) {
                if (!h) {
                    return []
                }
                for (var p = q.data.key.children, n = q.data.key.checked, g = !g ? [] : g, j = 0, o = h.length; j < o; j++) {
                    h[j].nocheck !== !0 && h[j][n] != h[j].checkedOld && g.push(h[j]), l.getTreeChangeCheckedNodes(q, h[j][p], g)
                }
                return g
            }, makeChkFlag: function (t, x) {
                if (x) {
                    var w = t.data.key.children, s = t.data.key.checked, q = -1;
                    if (x[w]) {
                        for (var r = !1, p = 0, n = x[w].length; p < n; p++) {
                            var j = x[w][p], o = -1;
                            if (t.check.chkStyle == i.radio.STYLE) {
                                if (o = j.nocheck === !0 ? j.check_Child_State : j.halfCheck === !0 ? 2 : j.nocheck !== !0 && j[s] ? 2 : j.check_Child_State > 0 ? 2 : 0, o == 2) {
                                    q = 2;
                                    break
                                } else {
                                    o == 0 && (q = 0)
                                }
                            } else {
                                if (t.check.chkStyle == i.checkbox.STYLE) {
                                    o = j.nocheck === !0 ? j.check_Child_State : j.halfCheck === !0 ? 1 : j.nocheck !== !0 && j[s] ? j.check_Child_State === -1 || j.check_Child_State === 2 ? 2 : 1 : j.check_Child_State > 0 ? 1 : 0;
                                    if (o === 1) {
                                        q = 1;
                                        break
                                    } else {
                                        if (o === 2 && r && o !== q) {
                                            q = 1;
                                            break
                                        } else {
                                            if (q === 2 && o > -1 && o < 2) {
                                                q = 1;
                                                break
                                            } else {
                                                o > -1 && (q = o)
                                            }
                                        }
                                    }
                                    r || (r = j.nocheck !== !0)
                                }
                            }
                        }
                    }
                    x.check_Child_State = q
                }
            }
        }
    });
    var d = k.fn.zTree, f = d._z.tools, i = d.consts, m = d._z.view, l = d._z.data;
    l.exSetting(u);
    l.addInitBind(function (h) {
        var g = h.treeObj, e = i.event;
        g.unbind(e.CHECK);
        g.bind(e.CHECK, function (n, j, o) {
            f.apply(h.callback.onCheck, [n, j, o])
        })
    });
    l.addInitCache(function () {
    });
    l.addInitNode(function (p, h, g, o, j, n) {
        if (g) {
            h = p.data.key.checked;
            typeof g[h] == "string" && (g[h] = f.eqs(g[h], "true"));
            g[h] = !!g[h];
            g.checkedOld = g[h];
            g.nocheck = !!g.nocheck || p.check.nocheckInherit && o && !!o.nocheck;
            g.chkDisabled = !!g.chkDisabled || o && !!o.chkDisabled;
            if (typeof g.halfCheck == "string") {
                g.halfCheck = f.eqs(g.halfCheck, "true")
            }
            g.halfCheck = !!g.halfCheck;
            g.check_Child_State = -1;
            g.check_Focus = !1;
            g.getCheckStatus = function () {
                return l.getCheckStatus(p, g)
            };
            n && l.makeChkFlag(p, o)
        }
    });
    l.addInitProxy(function (r) {
        var j = r.target, g = l.getSetting(r.data.treeId), q = "", o = null, p = "", n = null;
        if (f.eqs(r.type, "mouseover")) {
            if (g.check.enable && f.eqs(j.tagName, "button") && j.getAttribute("treeNode" + i.id.CHECK) !== null) {
                q = j.parentNode.id, p = "mouseoverCheck"
            }
        } else {
            if (f.eqs(r.type, "mouseout")) {
                if (g.check.enable && f.eqs(j.tagName, "button") && j.getAttribute("treeNode" + i.id.CHECK) !== null) {
                    q = j.parentNode.id, p = "mouseoutCheck"
                }
            } else {
                if (f.eqs(r.type, "click") && g.check.enable && f.eqs(j.tagName, "button") && j.getAttribute("treeNode" + i.id.CHECK) !== null) {
                    q = j.parentNode.id, p = "checkNode"
                }
            }
        }
        if (q.length > 0) {
            switch (o = l.getNodeCache(g, q), p) {
                case"checkNode":
                    n = c;
                    break;
                case"mouseoverCheck":
                    n = b;
                    break;
                case"mouseoutCheck":
                    n = a
            }
        }
        return {stop: !1, node: o, nodeEventType: p, nodeEventCallback: n, treeEventType: "", treeEventCallback: null}
    });
    l.addInitRoot(function (e) {
        l.getRoot(e).radioCheckedList = []
    });
    l.addBeforeA(function (j, g, e) {
        var h = j.data.key.checked;
        j.check.enable && (l.makeChkFlag(j, g), j.check.chkStyle == i.radio.STYLE && j.check.radioType == i.radio.TYPE_ALL && g[h] && l.getRoot(j).radioCheckedList.push(g), e.push("<button type='button' ID='", g.tId, i.id.CHECK, "' class='", m.makeChkClass(j, g), "' treeNode", i.id.CHECK, " onfocus='this.blur();' ", g.nocheck === !0 ? "style='display:none;'" : "", "></button>"))
    });
    l.addZTreeTools(function (h, g) {
        g.checkNode = function (o, j, q, n) {
            var p = this.setting.data.key.checked;
            if (o.chkDisabled !== !0 && (j !== !0 && j !== !1 && (j = !o[p]), n = !!n, (o[p] !== j || q) && !(n && f.apply(this.setting.callback.beforeCheck, [this.setting.treeId, o], !0) == !1) && f.uCanDo(this.setting) && this.setting.check.enable && o.nocheck !== !0)) {
                o[p] = j, j = k("#" + o.tId + i.id.CHECK), (q || this.setting.check.chkStyle === i.radio.STYLE) && m.checkNodeRelation(this.setting, o), m.setChkClass(this.setting, j, o), m.repairParentChkClassWithSelf(this.setting, o), n && h.treeObj.trigger(i.event.CHECK, [h.treeId, o])
            }
        };
        g.checkAllNodes = function (j) {
            m.repairAllChk(this.setting, !!j)
        };
        g.getCheckedNodes = function (n) {
            var j = this.setting.data.key.children;
            return l.getTreeCheckedNodes(this.setting, l.getRoot(h)[j], n !== !1)
        };
        g.getChangeCheckedNodes = function () {
            var j = this.setting.data.key.children;
            return l.getTreeChangeCheckedNodes(this.setting, l.getRoot(h)[j])
        };
        g.setChkDisabled = function (n, j) {
            j = !!j;
            m.repairSonChkDisabled(this.setting, n, j);
            j || m.repairParentChkDisabled(this.setting, n, j)
        };
        var e = g.updateNode;
        g.updateNode = function (o, n) {
            e && e.apply(g, arguments);
            if (o && this.setting.check.enable && k("#" + o.tId).get(0) && f.uCanDo(this.setting)) {
                var j = k("#" + o.tId + i.id.CHECK);
                (n == !0 || this.setting.check.chkStyle === i.radio.STYLE) && m.checkNodeRelation(this.setting, o);
                m.setChkClass(this.setting, j, o);
                m.repairParentChkClassWithSelf(this.setting, o)
            }
        }
    });
    var v = m.createNodes;
    m.createNodes = function (j, g, e, h) {
        v && v.apply(m, arguments);
        e && m.repairParentChkClassWithSelf(j, h)
    }
})(jQuery);
(function (e) {
    var a = {
        onHoverOverNode: function (d, f) {
            var m = c.getSetting(d.data.treeId), h = c.getRoot(m);
            if (h.curHoverNode != f) {
                a.onHoverOutNode(d)
            }
            h.curHoverNode = f;
            i.addHoverDom(m, f)
        }, onHoverOutNode: function (d) {
            var d = c.getSetting(d.data.treeId), f = c.getRoot(d);
            if (f.curHoverNode && !c.isSelectedNode(d, f.curHoverNode)) {
                i.removeTreeDom(d, f.curHoverNode), f.curHoverNode = null
            }
        }, onMousedownNode: function (aa, ab) {
            function Z(ad) {
                if (h.dragFlag == 0 && Math.abs(y - ad.clientX) < X.edit.drag.minMoveSize && Math.abs(o - ad.clientY) < X.edit.drag.minMoveSize) {
                    return !0
                }
                var ae, ac, M, J, L;
                L = X.data.key.children;
                g.noSel(X);
                e("body").css("cursor", "pointer");
                if (h.dragFlag == 0) {
                    if (g.apply(X.callback.beforeDrag, [X.treeId, S], !0) == !1) {
                        return V(ad), !0
                    }
                    for (ae = 0, ac = S.length; ae < ac; ae++) {
                        if (ae == 0) {
                            h.dragNodeShowBefore = []
                        }
                        M = S[ae];
                        M.isParent && M.open ? (i.expandCollapseNode(X, M, !M.open), h.dragNodeShowBefore[M.tId] = !0) : h.dragNodeShowBefore[M.tId] = !1
                    }
                    h.dragFlag = 1;
                    h.showHoverDom = !1;
                    g.showIfameMask(X, !0);
                    M = !0;
                    J = -1;
                    if (S.length > 1) {
                        var C = S[0].parentTId ? S[0].getParentNode()[L] : c.getNodes(X);
                        L = [];
                        for (ae = 0, ac = C.length; ae < ac; ae++) {
                            if (h.dragNodeShowBefore[C[ae].tId] !== void 0 && (M && J > -1 && J + 1 !== ae && (M = !1), L.push(C[ae]), J = ae), S.length === L.length) {
                                S = L;
                                break
                            }
                        }
                    }
                    M && (O = S[0].getPreNode(), m = S[S.length - 1].getNextNode());
                    A = e("<ul class='zTreeDragUL'></ul>");
                    for (ae = 0, ac = S.length; ae < ac; ae++) {
                        if (M = S[ae], M.editNameFlag = !1, i.selectNode(X, M, ae > 0), i.removeTreeDom(X, M), J = e("<li id='" + M.tId + "_tmp'></li>"), J.append(e("#" + M.tId + j.id.A).clone()), J.css("padding", "0"), J.children("#" + M.tId + j.id.A).removeClass(j.node.CURSELECTED), A.append(J), ae == X.edit.drag.maxShowNodeNum - 1) {
                            J = e("<li id='" + M.tId + "_moretmp'><a>  ...  </a></li>");
                            A.append(J);
                            break
                        }
                    }
                    A.attr("id", S[0].tId + j.id.UL + "_tmp");
                    A.addClass(X.treeObj.attr("class"));
                    A.appendTo("body");
                    G = e("<button class='tmpzTreeMove_arrow'></button>");
                    G.attr("id", "zTreeMove_arrow_tmp");
                    G.appendTo("body");
                    X.treeObj.trigger(j.event.DRAG, [X.treeId, S])
                }
                if (h.dragFlag == 1 && G.attr("id") != ad.target.id) {
                    P && (P.removeClass(j.node.TMPTARGET_TREE), B && e("#" + B + j.id.A, P).removeClass(j.node.TMPTARGET_NODE));
                    B = P = null;
                    N = !1;
                    U = X;
                    M = c.getSettings();
                    for (var D in M) {
                        if (M[D].treeId && M[D].edit.enable && M[D].treeId != X.treeId && (ad.target.id == M[D].treeId || e(ad.target).parents("#" + M[D].treeId).length > 0)) {
                            N = !0, U = M[D]
                        }
                    }
                    D = s.scrollTop();
                    J = s.scrollLeft();
                    L = U.treeObj.offset();
                    ae = U.treeObj.get(0).scrollHeight;
                    M = U.treeObj.get(0).scrollWidth;
                    ac = ad.clientY + D - L.top;
                    var z = U.treeObj.height() + L.top - ad.clientY - D, F = ad.clientX + J - L.left, I = U.treeObj.width() + L.left - ad.clientX - J;
                    L = ac < X.edit.drag.borderMax && ac > X.edit.drag.borderMin;
                    var C = z < X.edit.drag.borderMax && z > X.edit.drag.borderMin, u = F < X.edit.drag.borderMax && F > X.edit.drag.borderMin, x = I < X.edit.drag.borderMax && I > X.edit.drag.borderMin, z = ac > X.edit.drag.borderMin && z > X.edit.drag.borderMin && F > X.edit.drag.borderMin && I > X.edit.drag.borderMin, F = L && U.treeObj.scrollTop() <= 0, I = C && U.treeObj.scrollTop() + U.treeObj.height() + 10 >= ae, t = u && U.treeObj.scrollLeft() <= 0, r = x && U.treeObj.scrollLeft() + U.treeObj.width() + 10 >= M;
                    if (ad.target.id && U.treeObj.find("#" + ad.target.id).length > 0) {
                        for (var H = ad.target; H && H.tagName && !g.eqs(H.tagName, "li") && H.id != U.treeId;) {
                            H = H.parentNode
                        }
                        var v = !0;
                        for (ae = 0, ac = S.length; ae < ac; ae++) {
                            if (M = S[ae], H.id === M.tId) {
                                v = !1;
                                break
                            } else {
                                if (e("#" + M.tId).find("#" + H.id).length > 0) {
                                    v = !1;
                                    break
                                }
                            }
                        }
                        if (v && ad.target.id && (ad.target.id == H.id + j.id.A || e(ad.target).parents("#" + H.id + j.id.A).length > 0)) {
                            P = e(H), B = H.id
                        }
                    }
                    M = S[0];
                    if (z && (ad.target.id == U.treeId || e(ad.target).parents("#" + U.treeId).length > 0)) {
                        if (!P && (ad.target.id == U.treeId || F || I || t || r) && (N || !N && M.parentTId)) {
                            P = U.treeObj
                        }
                        L ? U.treeObj.scrollTop(U.treeObj.scrollTop() - 10) : C && U.treeObj.scrollTop(U.treeObj.scrollTop() + 10);
                        u ? U.treeObj.scrollLeft(U.treeObj.scrollLeft() - 10) : x && U.treeObj.scrollLeft(U.treeObj.scrollLeft() + 10);
                        P && P != U.treeObj && P.offset().left < U.treeObj.offset().left && U.treeObj.scrollLeft(U.treeObj.scrollLeft() + P.offset().left - U.treeObj.offset().left)
                    }
                    A.css({top: ad.clientY + D + 3 + "px", left: ad.clientX + J + 3 + "px"});
                    J = ae = 0;
                    if (P && P.attr("id") != U.treeId) {
                        var w = B == null ? null : c.getNodeCache(U, B);
                        ac = ad.ctrlKey && X.edit.drag.isMove && X.edit.drag.isCopy || !X.edit.drag.isMove && X.edit.drag.isCopy;
                        ae = !!(O && B === O.tId);
                        L = !!(m && B === m.tId);
                        J = M.parentTId && M.parentTId == B;
                        M = (ac || !L) && g.apply(U.edit.drag.prev, [U.treeId, S, w], !!U.edit.drag.prev);
                        ae = (ac || !ae) && g.apply(U.edit.drag.next, [U.treeId, S, w], !!U.edit.drag.next);
                        L = (ac || !J) && !(U.data.keep.leaf && !w.isParent) && g.apply(U.edit.drag.inner, [U.treeId, S, w], !!U.edit.drag.inner);
                        if (!M && !ae && !L) {
                            if (P = null, B = "", K = j.move.TYPE_INNER, G.css({display: "none"}), window.zTreeMoveTimer) {
                                clearTimeout(window.zTreeMoveTimer), window.zTreeMoveTargetNodeTId = null
                            }
                        } else {
                            ac = e("#" + B + j.id.A, P);
                            ac.addClass(j.node.TMPTARGET_NODE);
                            J = M ? L ? 0.25 : ae ? 0.5 : 1 : -1;
                            L = ae ? L ? 0.75 : M ? 0.5 : 0 : -1;
                            ad = (ad.clientY + D - ac.offset().top) / ac.height();
                            (J == 1 || ad <= J && ad >= -0.2) && M ? (ae = 1 - G.width(), J = 0 - G.height() / 2, K = j.move.TYPE_PREV) : (L == 0 || ad >= L && ad <= 1.2) && ae ? (ae = 1 - G.width(), J = ac.height() - G.height() / 2, K = j.move.TYPE_NEXT) : (ae = 5 - G.width(), J = 0, K = j.move.TYPE_INNER);
                            G.css({
                                display: "block",
                                top: ac.offset().top + J + "px",
                                left: ac.offset().left + ae + "px"
                            });
                            if (f != B || d != K) {
                                E = (new Date).getTime()
                            }
                            if (w && w.isParent && K == j.move.TYPE_INNER && (ad = !0, window.zTreeMoveTimer && window.zTreeMoveTargetNodeTId !== w.tId ? (clearTimeout(window.zTreeMoveTimer), window.zTreeMoveTargetNodeTId = null) : window.zTreeMoveTimer && window.zTreeMoveTargetNodeTId === w.tId && (ad = !1), ad)) {
                                window.zTreeMoveTimer = setTimeout(function () {
                                    K == j.move.TYPE_INNER && w && w.isParent && !w.open && (new Date).getTime() - E > U.edit.drag.autoOpenTime && g.apply(U.callback.beforeDragOpen, [U.treeId, w], !0) && (i.switchNode(U, w), U.edit.drag.autoExpandTrigger && U.treeObj.trigger(j.event.EXPAND, [U.treeId, w]))
                                }, U.edit.drag.autoOpenTime + 50), window.zTreeMoveTargetNodeTId = w.tId
                            }
                        }
                    } else {
                        if (K = j.move.TYPE_INNER, P && g.apply(U.edit.drag.inner, [U.treeId, S, null], !!U.edit.drag.inner) ? P.addClass(j.node.TMPTARGET_TREE) : P = null, G.css({display: "none"}), window.zTreeMoveTimer) {
                            clearTimeout(window.zTreeMoveTimer), window.zTreeMoveTargetNodeTId = null
                        }
                    }
                    f = B;
                    d = K
                }
                return !1
            }

            function V(r) {
                if (window.zTreeMoveTimer) {
                    clearTimeout(window.zTreeMoveTimer), window.zTreeMoveTargetNodeTId = null
                }
                d = f = null;
                s.unbind("mousemove", Z);
                s.unbind("mouseup", V);
                s.unbind("selectstart", Y);
                e("body").css("cursor", "auto");
                P && (P.removeClass(j.node.TMPTARGET_TREE), B && e("#" + B + j.id.A, P).removeClass(j.node.TMPTARGET_NODE));
                g.showIfameMask(X, !1);
                h.showHoverDom = !0;
                if (h.dragFlag != 0) {
                    h.dragFlag = 0;
                    var u, t, v;
                    for (u = 0, t = S.length; u < t; u++) {
                        v = S[u], v.isParent && h.dragNodeShowBefore[v.tId] && !v.open && (i.expandCollapseNode(X, v, !v.open), delete h.dragNodeShowBefore[v.tId])
                    }
                    A && A.remove();
                    G && G.remove();
                    var x = r.ctrlKey && X.edit.drag.isMove && X.edit.drag.isCopy || !X.edit.drag.isMove && X.edit.drag.isCopy;
                    !x && P && B && S[0].parentTId && B == S[0].parentTId && K == j.move.TYPE_INNER && (P = null);
                    if (P) {
                        var z = B == null ? null : c.getNodeCache(U, B);
                        if (g.apply(X.callback.beforeDrop, [U.treeId, S, z, K], !0) != !1) {
                            var w = x ? g.clone(S) : S, r = function () {
                                if (N) {
                                    if (!x) {
                                        for (var p = 0, C = S.length; p < C; p++) {
                                            i.removeNode(X, S[p])
                                        }
                                    }
                                    if (K == j.move.TYPE_INNER) {
                                        i.addNodes(U, z, w)
                                    } else {
                                        if (i.addNodes(U, z.getParentNode(), w), K == j.move.TYPE_PREV) {
                                            for (p = 0, C = w.length; p < C; p++) {
                                                i.moveNode(U, z, w[p], K, !1)
                                            }
                                        } else {
                                            for (p = -1, C = w.length - 1; p < C; C--) {
                                                i.moveNode(U, z, w[C], K, !1)
                                            }
                                        }
                                    }
                                } else {
                                    if (x && K == j.move.TYPE_INNER) {
                                        i.addNodes(U, z, w)
                                    } else {
                                        if (x && i.addNodes(U, z.getParentNode(), w), K == j.move.TYPE_PREV) {
                                            for (p = 0, C = w.length; p < C; p++) {
                                                i.moveNode(U, z, w[p], K, !1)
                                            }
                                        } else {
                                            for (p = -1, C = w.length - 1; p < C; C--) {
                                                i.moveNode(U, z, w[C], K, !1)
                                            }
                                        }
                                    }
                                }
                                for (p = 0, C = w.length; p < C; p++) {
                                    i.selectNode(U, w[p], p > 0)
                                }
                                e("#" + w[0].tId + j.id.ICON).focus().blur()
                            };
                            K == j.move.TYPE_INNER && g.canAsync(U, z) ? i.asyncNode(U, z, !1, r) : r();
                            X.treeObj.trigger(j.event.DROP, [U.treeId, w, z, K])
                        }
                    } else {
                        for (u = 0, t = S.length; u < t; u++) {
                            i.selectNode(U, S[u], u > 0)
                        }
                        X.treeObj.trigger(j.event.DROP, [X.treeId, null, null, null])
                    }
                }
            }

            function Y() {
                return !1
            }

            var T, W, X = c.getSetting(aa.data.treeId), h = c.getRoot(X);
            if (aa.button == 2 || !X.edit.enable || !X.edit.drag.isCopy && !X.edit.drag.isMove) {
                return !0
            }
            var R = aa.target, Q = c.getRoot(X).curSelectedList, S = [];
            if (c.isSelectedNode(X, ab)) {
                for (T = 0, W = Q.length; T < W; T++) {
                    if (Q[T].editNameFlag && g.eqs(R.tagName, "input") && R.getAttribute("treeNode" + j.id.INPUT) !== null) {
                        return !0
                    }
                    S.push(Q[T]);
                    if (S[0].parentTId !== Q[T].parentTId) {
                        S = [ab];
                        break
                    }
                }
            } else {
                S = [ab]
            }
            i.editNodeBlur = !0;
            i.cancelCurEditNode(X, null, !0);
            var s = e(document), A, G, P, N = !1, U = X, O, m, f = null, d = null, B = null, K = j.move.TYPE_INNER, y = aa.clientX, o = aa.clientY, E = (new Date).getTime();
            g.uCanDo(X) && s.bind("mousemove", Z);
            s.bind("mouseup", V);
            s.bind("selectstart", Y);
            aa.preventDefault && aa.preventDefault();
            return !0
        }
    }, b = {
        tools: {
            getAbs: function (d) {
                d = d.getBoundingClientRect();
                return [d.left, d.top]
            }, inputFocus: function (d) {
                d.get(0) && (d.focus(), g.setCursorPosition(d.get(0), d.val().length))
            }, inputSelect: function (d) {
                d.get(0) && (d.focus(), d.select())
            }, setCursorPosition: function (d, f) {
                if (d.setSelectionRange) {
                    d.focus(), d.setSelectionRange(f, f)
                } else {
                    if (d.createTextRange) {
                        var h = d.createTextRange();
                        h.collapse(!0);
                        h.moveEnd("character", f);
                        h.moveStart("character", f);
                        h.select()
                    }
                }
            }, showIfameMask: function (h, m) {
                for (var u = c.getRoot(h); u.dragMaskList.length > 0;) {
                    u.dragMaskList[0].remove(), u.dragMaskList.shift()
                }
                if (m) {
                    for (var o = e("iframe"), s = 0, t = o.length; s < t; s++) {
                        var r = o.get(s), p = g.getAbs(r), r = e("<div id='zTreeMask_" + s + "' class='zTreeMask' style='background-color:yellow;opacity: 0.3;filter: alpha(opacity=30);    top:" + p[1] + "px; left:" + p[0] + "px; width:" + r.offsetWidth + "px; height:" + r.offsetHeight + "px;'></div>");
                        r.appendTo("body");
                        u.dragMaskList.push(r)
                    }
                }
            }
        }, view: {
            addEditBtn: function (d, f) {
                if (!(f.editNameFlag || e("#" + f.tId + j.id.EDIT).length > 0) && g.apply(d.edit.showRenameBtn, [d.treeId, f], d.edit.showRenameBtn)) {
                    var m = e("#" + f.tId + j.id.A), h = "<button type='button' class='edit' id='" + f.tId + j.id.EDIT + "' title='" + g.apply(d.edit.renameTitle, [d.treeId, f], d.edit.renameTitle) + "' treeNode" + j.id.EDIT + " onfocus='this.blur();' style='display:none;'></button>";
                    m.append(h);
                    e("#" + f.tId + j.id.EDIT).bind("click", function () {
                        if (!g.uCanDo(d) || g.apply(d.callback.beforeEditName, [d.treeId, f], !0) == !1) {
                            return !0
                        }
                        i.editNode(d, f);
                        return !1
                    }).show()
                }
            }, addRemoveBtn: function (d, f) {
                if (!(f.editNameFlag || e("#" + f.tId + j.id.REMOVE).length > 0) && g.apply(d.edit.showRemoveBtn, [d.treeId, f], d.edit.showRemoveBtn)) {
                    var m = e("#" + f.tId + j.id.A), h = "<button type='button' class='remove' id='" + f.tId + j.id.REMOVE + "' title='" + g.apply(d.edit.removeTitle, [d.treeId, f], d.edit.removeTitle) + "' treeNode" + j.id.REMOVE + " onfocus='this.blur();' style='display:none;'></button>";
                    m.append(h);
                    e("#" + f.tId + j.id.REMOVE).bind("click", function () {
                        if (!g.uCanDo(d) || g.apply(d.callback.beforeRemove, [d.treeId, f], !0) == !1) {
                            return !0
                        }
                        i.removeNode(d, f);
                        d.treeObj.trigger(j.event.REMOVE, [d.treeId, f]);
                        return !1
                    }).bind("mousedown", function () {
                        return !0
                    }).show()
                }
            }, addHoverDom: function (d, f) {
                if (c.getRoot(d).showHoverDom) {
                    f.isHover = !0, d.edit.enable && (i.addEditBtn(d, f), i.addRemoveBtn(d, f)), g.apply(d.view.addHoverDom, [d.treeId, f])
                }
            }, cancelCurEditNode: function (d, h, iscancel) {
                var r = c.getRoot(d), m = d.data.key.name, p = r.curEditNode;
                if (p) {
                    var f = r.curEditInput, o = h ? h : iscancel ? p[m] : f.val();
                    if (!h && g.apply(d.callback.beforeRename, [d.treeId, p, o, iscancel], !0) === !1) {
                        return p.editNameFlag = !0, !1
                    } else {
                        p[m] = o ? o : f.val(), h || d.treeObj.trigger(j.event.RENAME, [d.treeId, p, iscancel])
                    }
                    e("#" + p.tId + j.id.A).removeClass(j.node.CURSELECTED_EDIT);
                    f.unbind();
                    i.setNodeName(d, p);
                    p.editNameFlag = !1;
                    r.curEditNode = null;
                    r.curEditInput = null;
                    i.selectNode(d, p, !1)
                }
                return r.noSelection = !0
            }, editNode: function (d, f) {
                var o = c.getRoot(d);
                i.editNodeBlur = !1;
                if (c.isSelectedNode(d, f) && o.curEditNode == f && f.editNameFlag) {
                    setTimeout(function () {
                        g.inputFocus(o.curEditInput)
                    }, 0)
                } else {
                    var h = d.data.key.name;
                    f.editNameFlag = !0;
                    i.removeTreeDom(d, f);
                    i.cancelCurEditNode(d);
                    i.selectNode(d, f, !1);
                    e("#" + f.tId + j.id.SPAN).html("<input type=text class='rename' id='" + f.tId + j.id.INPUT + "' treeNode" + j.id.INPUT + " >");
                    var m = e("#" + f.tId + j.id.INPUT);
                    m.attr("value", f[h]);
                    d.edit.editNameSelectAll ? g.inputSelect(m) : g.inputFocus(m);
                    m.bind("blur", function () {
                        i.editNodeBlur || i.cancelCurEditNode(d)
                    }).bind("keydown", function (p) {
                        p.keyCode == "13" ? (i.editNodeBlur = !0, i.cancelCurEditNode(d)) : p.keyCode == "27" && i.cancelCurEditNode(d, null, !0)
                    }).bind("click", function () {
                        return !1
                    }).bind("dblclick", function () {
                        return !1
                    });
                    e("#" + f.tId + j.id.A).addClass(j.node.CURSELECTED_EDIT);
                    o.curEditInput = m;
                    o.noSelection = !1;
                    o.curEditNode = f
                }
            }, moveNode: function (E, G, D, v, B, t) {
                var y = c.getRoot(E), A = E.data.key.children;
                if (G != D && (!E.data.keep.leaf || !G || G.isParent || v != j.move.TYPE_INNER)) {
                    var z = D.parentTId ? D.getParentNode() : y, o = G === null || G == y;
                    o && G === null && (G = y);
                    if (o) {
                        v = j.move.TYPE_INNER
                    }
                    y = G.parentTId ? G.getParentNode() : y;
                    if (v != j.move.TYPE_PREV && v != j.move.TYPE_NEXT) {
                        v = j.move.TYPE_INNER
                    }
                    var m, s;
                    o ? s = m = E.treeObj : t || (v == j.move.TYPE_INNER ? i.expandCollapseNode(E, G, !0, !1) : i.expandCollapseNode(E, G.getParentNode(), !0, !1), m = e("#" + G.tId), s = e("#" + G.tId + j.id.UL));
                    var F = e("#" + D.tId).remove();
                    s && v == j.move.TYPE_INNER ? s.append(F) : m && v == j.move.TYPE_PREV ? m.before(F) : m && v == j.move.TYPE_NEXT && m.after(F);
                    var H = -1, I = 0, d = null;
                    m = null;
                    var f = D.level;
                    if (D.isFirstNode) {
                        if (H = 0, z[A].length > 1) {
                            d = z[A][1], d.isFirstNode = !0
                        }
                    } else {
                        if (D.isLastNode) {
                            H = z[A].length - 1, d = z[A][H - 1], d.isLastNode = !0
                        } else {
                            for (s = 0, F = z[A].length; s < F; s++) {
                                if (z[A][s].tId == D.tId) {
                                    H = s;
                                    break
                                }
                            }
                        }
                    }
                    H >= 0 && z[A].splice(H, 1);
                    if (v != j.move.TYPE_INNER) {
                        for (s = 0, F = y[A].length; s < F; s++) {
                            y[A][s].tId == G.tId && (I = s)
                        }
                    }
                    if (v == j.move.TYPE_INNER) {
                        o ? D.parentTId = null : (G.isParent = !0, G.open = !1, D.parentTId = G.tId);
                        G[A] || (G[A] = []);
                        if (G[A].length > 0) {
                            m = G[A][G[A].length - 1], m.isLastNode = !1
                        }
                        G[A].splice(G[A].length, 0, D);
                        D.isLastNode = !0;
                        D.isFirstNode = G[A].length == 1
                    } else {
                        G.isFirstNode && v == j.move.TYPE_PREV ? (y[A].splice(I, 0, D), m = G, m.isFirstNode = !1, D.parentTId = G.parentTId, D.isFirstNode = !0, D.isLastNode = !1) : G.isLastNode && v == j.move.TYPE_NEXT ? (y[A].splice(I + 1, 0, D), m = G, m.isLastNode = !1, D.parentTId = G.parentTId, D.isFirstNode = !1, D.isLastNode = !0) : (v == j.move.TYPE_PREV ? y[A].splice(I, 0, D) : y[A].splice(I + 1, 0, D), D.parentTId = G.parentTId, D.isFirstNode = !1, D.isLastNode = !1)
                    }
                    c.fixPIdKeyValue(E, D);
                    c.setSonNodeLevel(E, D.getParentNode(), D);
                    i.setNodeLineIcos(E, D);
                    i.repairNodeLevelClass(E, D, f);
                    !E.data.keep.parent && z[A].length < 1 ? (z.isParent = !1, z.open = !1, G = e("#" + z.tId + j.id.UL), v = e("#" + z.tId + j.id.SWITCH), A = e("#" + z.tId + j.id.ICON), i.replaceSwitchClass(z, v, j.folder.DOCU), i.replaceIcoClass(z, A, j.folder.DOCU), G.css("display", "none")) : d && i.setNodeLineIcos(E, d);
                    m && i.setNodeLineIcos(E, m);
                    E.check.enable && i.repairChkClass && (i.repairChkClass(E, z), i.repairParentChkClassWithSelf(E, z), z != D.parent && i.repairParentChkClassWithSelf(E, D));
                    t || i.expandCollapseParentNode(E, D.getParentNode(), !0, B)
                }
            }, removeChildNodes: function (d, h) {
                if (h) {
                    var p = d.data.key.children, m = h[p];
                    if (m) {
                        e("#" + h.tId + j.id.UL).remove();
                        for (var o = 0, f = m.length; o < f; o++) {
                            c.removeNodeCache(d, m[o])
                        }
                        c.removeSelectedNode(d);
                        delete h[p];
                        if (!d.data.keep.parent) {
                            h.isParent = !1, h.open = !1, p = e("#" + h.tId + j.id.SWITCH), m = e("#" + h.tId + j.id.ICON), i.replaceSwitchClass(h, p, j.folder.DOCU), i.replaceIcoClass(h, m, j.folder.DOCU)
                        }
                    }
                }
            }, removeEditBtn: function (d) {
                e("#" + d.tId + j.id.EDIT).unbind().remove()
            }, removeNode: function (t, u) {
                var s = c.getRoot(t), f = t.data.key.children, r = u.parentTId ? u.getParentNode() : s;
                if (s.curEditNode === u) {
                    s.curEditNode = null
                }
                u.isFirstNode = !1;
                u.isLastNode = !1;
                u.getPreNode = function () {
                    return null
                };
                u.getNextNode = function () {
                    return null
                };
                e("#" + u.tId).remove();
                c.removeNodeCache(t, u);
                c.removeSelectedNode(t, u);
                for (var d = 0, m = r[f].length; d < m; d++) {
                    if (r[f][d].tId == u.tId) {
                        r[f].splice(d, 1);
                        break
                    }
                }
                var p;
                if (!t.data.keep.parent && r[f].length < 1) {
                    r.isParent = !1, r.open = !1, d = e("#" + r.tId + j.id.UL), m = e("#" + r.tId + j.id.SWITCH), p = e("#" + r.tId + j.id.ICON), i.replaceSwitchClass(r, m, j.folder.DOCU), i.replaceIcoClass(r, p, j.folder.DOCU), d.css("display", "none")
                } else {
                    if (t.view.showLine && r[f].length > 0) {
                        var o = r[f][r[f].length - 1];
                        o.isLastNode = !0;
                        o.isFirstNode = r[f].length == 1;
                        d = e("#" + o.tId + j.id.UL);
                        m = e("#" + o.tId + j.id.SWITCH);
                        p = e("#" + o.tId + j.id.ICON);
                        r == s ? r[f].length == 1 ? i.replaceSwitchClass(o, m, j.line.ROOT) : (s = e("#" + r[f][0].tId + j.id.SWITCH), i.replaceSwitchClass(r[f][0], s, j.line.ROOTS), i.replaceSwitchClass(o, m, j.line.BOTTOM)) : i.replaceSwitchClass(o, m, j.line.BOTTOM);
                        d.removeClass(j.line.LINE)
                    }
                }
            }, removeRemoveBtn: function (d) {
                e("#" + d.tId + j.id.REMOVE).unbind().remove()
            }, removeTreeDom: function (d, f) {
                f.isHover = !1;
                i.removeEditBtn(f);
                i.removeRemoveBtn(f);
                g.apply(d.view.removeHoverDom, [d.treeId, f])
            }, repairNodeLevelClass: function (d, f, o) {
                if (o !== f.level) {
                    var d = e("#" + f.tId), h = e("#" + f.tId + j.id.A), m = e("#" + f.tId + j.id.UL), o = "level" + o, f = "level" + f.level;
                    d.removeClass(o);
                    d.addClass(f);
                    h.removeClass(o);
                    h.addClass(f);
                    m.removeClass(o);
                    m.addClass(f)
                }
            }
        }, event: b, data: {
            setSonNodeLevel: function (f, h, p) {
                if (p) {
                    var o = f.data.key.children;
                    p.level = h ? h.level + 1 : 0;
                    if (p[o]) {
                        for (var h = 0, m = p[o].length; h < m; h++) {
                            p[o][h] && c.setSonNodeLevel(f, p, p[o][h])
                        }
                    }
                }
            }
        }
    };
    e.extend(!0, e.fn.zTree.consts, {
        event: {
            DRAG: "ztree_drag",
            DROP: "ztree_drop",
            REMOVE: "ztree_remove",
            RENAME: "ztree_rename"
        },
        id: {EDIT: "_edit", INPUT: "_input", REMOVE: "_remove"},
        move: {TYPE_INNER: "inner", TYPE_PREV: "prev", TYPE_NEXT: "next"},
        node: {
            CURSELECTED_EDIT: "curSelectedNode_Edit",
            TMPTARGET_TREE: "tmpTargetzTree",
            TMPTARGET_NODE: "tmpTargetNode"
        }
    });
    e.extend(!0, e.fn.zTree._z, b);
    var b = e.fn.zTree, g = b._z.tools, j = b.consts, i = b._z.view, c = b._z.data, b = b._z.event;
    c.exSetting({
        edit: {
            enable: !1,
            editNameSelectAll: !1,
            showRemoveBtn: !0,
            showRenameBtn: !0,
            removeTitle: "remove",
            renameTitle: "rename",
            drag: {
                autoExpandTrigger: !1,
                isCopy: !0,
                isMove: !0,
                prev: !0,
                next: !0,
                inner: !0,
                minMoveSize: 5,
                borderMax: 10,
                borderMin: -5,
                maxShowNodeNum: 5,
                autoOpenTime: 500
            }
        },
        view: {addHoverDom: null, removeHoverDom: null},
        callback: {
            beforeDrag: null,
            beforeDragOpen: null,
            beforeDrop: null,
            beforeEditName: null,
            beforeRemove: null,
            beforeRename: null,
            onDrag: null,
            onDrop: null,
            onRemove: null,
            onRename: null
        }
    });
    c.addInitBind(function (d) {
        var f = d.treeObj, h = j.event;
        f.unbind(h.RENAME);
        f.bind(h.RENAME, function (m, p, o, iscancel) {
            g.apply(d.callback.onRename, [m, p, o, iscancel])
        });
        f.unbind(h.REMOVE);
        f.bind(h.REMOVE, function (m, p, o) {
            g.apply(d.callback.onRemove, [m, p, o])
        });
        f.unbind(h.DRAG);
        f.bind(h.DRAG, function (m, p, o) {
            g.apply(d.callback.onDrag, [m, p, o])
        });
        f.unbind(h.DROP);
        f.bind(h.DROP, function (m, s, r, p, o) {
            g.apply(d.callback.onDrop, [m, s, r, p, o])
        })
    });
    c.addInitCache(function () {
    });
    c.addInitNode(function (d, f, h) {
        if (h) {
            h.isHover = !1, h.editNameFlag = !1
        }
    });
    c.addInitProxy(function (u) {
        var v = u.target, t = c.getSetting(u.data.treeId), r = u.relatedTarget, s = "", h = null, o = "", p = null, d = null;
        if (g.eqs(u.type, "mouseover")) {
            if (d = g.getMDom(t, v, [{tagName: "a", attrName: "treeNode" + j.id.A}])) {
                s = d.parentNode.id, o = "hoverOverNode"
            }
        } else {
            if (g.eqs(u.type, "mouseout")) {
                d = g.getMDom(t, r, [{
                    tagName: "a",
                    attrName: "treeNode" + j.id.A
                }]), d || (s = "remove", o = "hoverOutNode")
            } else {
                if (g.eqs(u.type, "mousedown") && (d = g.getMDom(t, v, [{
                        tagName: "a",
                        attrName: "treeNode" + j.id.A
                    }]))) {
                    s = d.parentNode.id, o = "mousedownNode"
                }
            }
        }
        if (s.length > 0) {
            switch (h = c.getNodeCache(t, s), o) {
                case"mousedownNode":
                    p = a.onMousedownNode;
                    break;
                case"hoverOverNode":
                    p = a.onHoverOverNode;
                    break;
                case"hoverOutNode":
                    p = a.onHoverOutNode
            }
        }
        return {stop: !1, node: h, nodeEventType: o, nodeEventCallback: p, treeEventType: "", treeEventCallback: null}
    });
    c.addInitRoot(function (d) {
        d = c.getRoot(d);
        d.curEditNode = null;
        d.curEditInput = null;
        d.curHoverNode = null;
        d.dragFlag = 0;
        d.dragNodeShowBefore = [];
        d.dragMaskList = [];
        d.showHoverDom = !0
    });
    c.addZTreeTools(function (d, f) {
        f.addNodes = function (m, r, p) {
            function h() {
                i.addNodes(d, m, o, p == !0)
            }

            if (!r) {
                return null
            }
            m || (m = null);
            if (m && !m.isParent && d.data.keep.leaf) {
                return null
            }
            var o = g.clone(g.isArray(r) ? r : [r]);
            d.async.enable && g.canAsync(d, m) ? i.asyncNode(d, m, p, h) : h();
            return o
        };
        f.cancelEditName = function (m) {
            var r = c.getRoot(d), p = d.data.key.name, o = r.curEditNode;
            r.curEditNode && i.cancelCurEditNode(d, m ? m : null, !0)
        };
        f.copyNode = function (m, o, r, h) {
            if (!o) {
                return null
            }
            if (m && !m.isParent && d.data.keep.leaf && r === j.move.TYPE_INNER) {
                return null
            }
            var p = g.clone(o);
            if (!m) {
                m = null, r = j.move.TYPE_INNER
            }
            r == j.move.TYPE_INNER ? (o = function () {
                i.addNodes(d, m, [p], h)
            }, d.async.enable && g.canAsync(d, m) ? i.asyncNode(d, m, h, o) : o()) : (i.addNodes(d, m.parentNode, [p], h), i.moveNode(d, m, p, r, !1, h));
            return p
        };
        f.editName = function (h) {
            h && h.tId && h === c.getNodeCache(d, h.tId) && (h.parentTId && i.expandCollapseParentNode(d, h.getParentNode(), !0), i.editNode(d, h))
        };
        f.moveNode = function (m, o, r, h) {
            function p() {
                i.moveNode(d, m, o, r, !1, h)
            }

            if (!o) {
                return o
            }
            if (m && !m.isParent && d.data.keep.leaf && r === j.move.TYPE_INNER) {
                return null
            } else {
                if (m && (o.parentTId == m.tId && r == j.move.TYPE_INNER || e("#" + o.tId).find("#" + m.tId).length > 0)) {
                    return null
                } else {
                    m || (m = null)
                }
            }
            d.async.enable && g.canAsync(d, m) ? i.asyncNode(d, m, h, p) : p();
            return o
        };
        f.removeNode = function (h, m) {
            h && (m = !!m, m && g.apply(d.callback.beforeRemove, [d.treeId, h], !0) == !1 || (i.removeNode(d, h), m && this.setting.treeObj.trigger(j.event.REMOVE, [d.treeId, h])))
        };
        f.removeChildNodes = function (h) {
            if (!h) {
                return null
            }
            var m = h[d.data.key.children];
            i.removeChildNodes(d, h);
            return m ? m : null
        };
        f.setEditable = function (h) {
            d.edit.enable = h;
            return this.refresh()
        }
    });
    var l = i.cancelPreSelectedNode;
    i.cancelPreSelectedNode = function (f, h) {
        for (var p = c.getRoot(f).curSelectedList, o = 0, m = p.length; o < m; o++) {
            if (!h || h === p[o]) {
                if (i.removeTreeDom(f, p[o]), h) {
                    break
                }
            }
        }
        l && l.apply(i, arguments)
    };
    var k = i.createNodes;
    i.createNodes = function (f, h, o, m) {
        k && k.apply(i, arguments);
        o && i.repairParentChkClassWithSelf && i.repairParentChkClassWithSelf(f, m)
    };
    i.makeNodeUrl = function (d, f) {
        return f.url && !d.edit.enable ? f.url : null
    };
    var q = i.selectNode;
    i.selectNode = function (f, h, o) {
        var m = c.getRoot(f);
        if (c.isSelectedNode(f, h) && m.curEditNode == h && h.editNameFlag) {
            return !1
        }
        q && q.apply(i, arguments);
        i.addHoverDom(f, h);
        return !0
    };
    var n = g.uCanDo;
    g.uCanDo = function (d, f) {
        var h = c.getRoot(d);
        return f && (g.eqs(f.type, "mouseover") || g.eqs(f.type, "mouseout") || g.eqs(f.type, "mousedown") || g.eqs(f.type, "mouseup")) ? !0 : !h.curEditNode && (n ? n.apply(i, arguments) : !0)
    }
})(jQuery);
(function (i) {
    i.extend(!0, i.fn.zTree._z, {
        view: {
            clearOldFirstNode: function (c, a) {
                for (var b = a.getNextNode(); b;) {
                    if (b.isFirstNode) {
                        b.isFirstNode = !1;
                        d.setNodeLineIcos(c, b);
                        break
                    }
                    if (b.isLastNode)break;
                    b = b.getNextNode()
                }
            }, clearOldLastNode: function (c, a, b) {
                for (a = a.getPreNode(); a;) {
                    if (a.isLastNode) {
                        a.isLastNode = !1;
                        b && d.setNodeLineIcos(c, a);
                        break
                    }
                    if (a.isFirstNode)break;
                    a = a.getPreNode()
                }
            }, makeDOMNodeMainBefore: function (c, a, b) {
                c.push("<li ", b.isHidden ? "style='display:none;' " : "", "id='", b.tId, "' class='", l.className.LEVEL, b.level, "' tabindex='0' hidefocus='true' treenode>")
            }, showNode: function (c, a) {
                a.isHidden = !1;
                f.initShowForExCheck(c, a);
                j(a, c).show()
            }, showNodes: function (c, a, b) {
                if (a && a.length != 0) {
                    var e = {}, g, k;
                    for (g = 0, k = a.length; g < k; g++) {
                        var h = a[g];
                        if (!e[h.parentTId]) {
                            var i = h.getParentNode();
                            e[h.parentTId] = i === null ? f.getRoot(c) : h.getParentNode()
                        }
                        d.showNode(c, h, b)
                    }
                    for (var j in e)a = e[j][c.data.key.children], d.setFirstNodeForShow(c, a), d.setLastNodeForShow(c, a)
                }
            }, hideNode: function (c, a) {
                a.isHidden = !0;
                a.isFirstNode = !1;
                a.isLastNode = !1;
                f.initHideForExCheck(c, a);
                d.cancelPreSelectedNode(c, a);
                j(a, c).hide()
            }, hideNodes: function (c, a, b) {
                if (a && a.length != 0) {
                    var e = {}, g, k;
                    for (g = 0, k = a.length; g < k; g++) {
                        var h = a[g];
                        if ((h.isFirstNode || h.isLastNode) && !e[h.parentTId]) {
                            var i = h.getParentNode();
                            e[h.parentTId] = i === null ? f.getRoot(c) : h.getParentNode()
                        }
                        d.hideNode(c, h, b)
                    }
                    for (var j in e)a = e[j][c.data.key.children], d.setFirstNodeForHide(c, a), d.setLastNodeForHide(c, a)
                }
            }, setFirstNode: function (c, a) {
                var b = c.data.key.children, e = a[b].length;
                e > 0 && !a[b][0].isHidden ? a[b][0].isFirstNode = !0 : e > 0 && d.setFirstNodeForHide(c, a[b])
            }, setLastNode: function (c, a) {
                var b = c.data.key.children, e = a[b].length;
                e > 0 && !a[b][0].isHidden ? a[b][e - 1].isLastNode = !0 : e > 0 && d.setLastNodeForHide(c, a[b])
            }, setFirstNodeForHide: function (c, a) {
                var b, e, g;
                for (e = 0, g = a.length; e < g; e++) {
                    b = a[e];
                    if (b.isFirstNode)break;
                    if (!b.isHidden && !b.isFirstNode) {
                        b.isFirstNode = !0;
                        d.setNodeLineIcos(c, b);
                        break
                    } else b = null
                }
                return b
            }, setFirstNodeForShow: function (c, a) {
                var b, e, g, f, h;
                for (e = 0, g = a.length; e < g; e++)if (b = a[e], !f && !b.isHidden && b.isFirstNode) {
                    f = b;
                    break
                } else if (!f && !b.isHidden && !b.isFirstNode)b.isFirstNode = !0, f = b, d.setNodeLineIcos(c, b); else if (f && b.isFirstNode) {
                    b.isFirstNode = !1;
                    h = b;
                    d.setNodeLineIcos(c, b);
                    break
                }
                return {"new": f, old: h}
            }, setLastNodeForHide: function (c, a) {
                var b, e;
                for (e = a.length - 1; e >= 0; e--) {
                    b = a[e];
                    if (b.isLastNode)break;
                    if (!b.isHidden && !b.isLastNode) {
                        b.isLastNode = !0;
                        d.setNodeLineIcos(c, b);
                        break
                    } else b = null
                }
                return b
            }, setLastNodeForShow: function (c, a) {
                var b, e, g, f;
                for (e = a.length - 1; e >= 0; e--)if (b = a[e], !g && !b.isHidden && b.isLastNode) {
                    g = b;
                    break
                } else if (!g && !b.isHidden && !b.isLastNode)b.isLastNode = !0, g = b, d.setNodeLineIcos(c, b); else if (g && b.isLastNode) {
                    b.isLastNode = !1;
                    f = b;
                    d.setNodeLineIcos(c, b);
                    break
                }
                return {"new": g, old: f}
            }
        }, data: {
            initHideForExCheck: function (c, a) {
                if (a.isHidden && c.check && c.check.enable) {
                    if (typeof a._nocheck == "undefined")a._nocheck = !!a.nocheck, a.nocheck = !0;
                    a.check_Child_State = -1;
                    d.repairParentChkClassWithSelf && d.repairParentChkClassWithSelf(c, a)
                }
            }, initShowForExCheck: function (c, a) {
                if (!a.isHidden && c.check && c.check.enable) {
                    if (typeof a._nocheck != "undefined")a.nocheck = a._nocheck, delete a._nocheck;
                    if (d.setChkClass) {
                        var b = j(a, l.id.CHECK, c);
                        d.setChkClass(c, b, a)
                    }
                    d.repairParentChkClassWithSelf && d.repairParentChkClassWithSelf(c, a)
                }
            }
        }
    });
    var i = i.fn.zTree, m = i._z.tools, l = i.consts, d = i._z.view, f = i._z.data, j = m.$;
    f.addInitNode(function (c, a, b) {
        if (typeof b.isHidden == "string")b.isHidden = m.eqs(b.isHidden, "true");
        b.isHidden = !!b.isHidden;
        f.initHideForExCheck(c, b)
    });
    f.addBeforeA(function () {
    });
    f.addZTreeTools(function (c, a) {
        a.showNodes = function (a, b) {
            d.showNodes(c, a, b)
        };
        a.showNode = function (a, b) {
            a && d.showNodes(c, [a], b)
        };
        a.hideNodes = function (a, b) {
            d.hideNodes(c, a, b)
        };
        a.hideNode = function (a, b) {
            a && d.hideNodes(c, [a], b)
        };
        var b = a.checkNode;
        if (b)a.checkNode = function (c, d, f, h) {
            (!c || !c.isHidden) && b.apply(a, arguments)
        }
    });
    var n = f.initNode;
    f.initNode = function (c, a, b, e, g, i, h) {
        var j = (e ? e : f.getRoot(c))[c.data.key.children];
        f.tmpHideFirstNode = d.setFirstNodeForHide(c, j);
        f.tmpHideLastNode = d.setLastNodeForHide(c, j);
        h && (d.setNodeLineIcos(c, f.tmpHideFirstNode), d.setNodeLineIcos(c, f.tmpHideLastNode));
        g = f.tmpHideFirstNode === b;
        i = f.tmpHideLastNode === b;
        n && n.apply(f, arguments);
        h && i && d.clearOldLastNode(c, b, h)
    };
    var o = f.makeChkFlag;
    if (o)f.makeChkFlag = function (c, a) {
        (!a || !a.isHidden) && o.apply(f, arguments)
    };
    var p = f.getTreeCheckedNodes;
    if (p)f.getTreeCheckedNodes = function (c, a, b, e) {
        if (a && a.length > 0) {
            var d = a[0].getParentNode();
            if (d && d.isHidden)return []
        }
        return p.apply(f, arguments)
    };
    var q = f.getTreeChangeCheckedNodes;
    if (q)f.getTreeChangeCheckedNodes = function (c, a, b) {
        if (a && a.length > 0) {
            var d = a[0].getParentNode();
            if (d && d.isHidden)return []
        }
        return q.apply(f, arguments)
    };
    var r = d.expandCollapseSonNode;
    if (r)d.expandCollapseSonNode = function (c, a, b, e, f) {
        (!a || !a.isHidden) && r.apply(d, arguments)
    };
    var s = d.setSonNodeCheckBox;
    if (s)d.setSonNodeCheckBox = function (c, a, b, e) {
        (!a || !a.isHidden) && s.apply(d, arguments)
    };
    var t = d.repairParentChkClassWithSelf;
    if (t)d.repairParentChkClassWithSelf = function (c, a) {
        (!a || !a.isHidden) && t.apply(d, arguments)
    }
})(jQuery);

/*! iCheck v1.0.2 by Damir Sultanov, http://git.io/arlzeA, MIT Licensed */
(function (f) {
    function A(a, b, d) {
        var c = a[0], g = /er/.test(d) ? _indeterminate : /bl/.test(d) ? n : k, e = d == _update ? {
            checked: c[k],
            disabled: c[n],
            indeterminate: "true" == a.attr(_indeterminate) || "false" == a.attr(_determinate)
        } : c[g];
        if (/^(ch|di|in)/.test(d) && !e)x(a, g); else if (/^(un|en|de)/.test(d) && e)q(a, g); else if (d == _update)for (var f in e)e[f] ? x(a, f, !0) : q(a, f, !0); else if (!b || "toggle" == d) {
            if (!b)a[_callback]("ifClicked");
            e ? c[_type] !== r && q(a, g) : x(a, g)
        }
    }

    function x(a, b, d) {
        var c = a[0], g = a.parent(), e = b == k, u = b == _indeterminate,
            v = b == n, s = u ? _determinate : e ? y : "enabled", F = l(a, s + t(c[_type])), B = l(a, b + t(c[_type]));
        if (!0 !== c[b]) {
            if (!d && b == k && c[_type] == r && c.name) {
                var w = a.closest("form"), p = 'input[name="' + c.name + '"]', p = w.length ? w.find(p) : f(p);
                p.each(function () {
                    this !== c && f(this).data(m) && q(f(this), b)
                })
            }
            u ? (c[b] = !0, c[k] && q(a, k, "force")) : (d || (c[b] = !0), e && c[_indeterminate] && q(a, _indeterminate, !1));
            D(a, e, b, d)
        }
        c[n] && l(a, _cursor, !0) && g.find("." + C).css(_cursor, "default");
        g[_add](B || l(a, b) || "");
        g.attr("role") && !u && g.attr("aria-" + (v ? n : k), "true");
        g[_remove](F || l(a, s) || "")
    }

    function q(a, b, d) {
        var c = a[0], g = a.parent(), e = b == k, f = b == _indeterminate, m = b == n, s = f ? _determinate : e ? y : "enabled", q = l(a, s + t(c[_type])), r = l(a, b + t(c[_type]));
        if (!1 !== c[b]) {
            if (f || !d || "force" == d)c[b] = !1;
            D(a, e, s, d)
        }
        !c[n] && l(a, _cursor, !0) && g.find("." + C).css(_cursor, "pointer");
        g[_remove](r || l(a, b) || "");
        g.attr("role") && !f && g.attr("aria-" + (m ? n : k), "false");
        g[_add](q || l(a, s) || "")
    }

    function E(a, b) {
        if (a.data(m)) {
            a.parent().html(a.attr("style", a.data(m).s || ""));
            if (b)a[_callback](b);
            a.off(".i").unwrap();
            f(_label + '[for="' + a[0].id + '"]').add(a.closest(_label)).off(".i")
        }
    }

    function l(a, b, f) {
        if (a.data(m))return a.data(m).o[b + (f ? "" : "Class")]
    }

    function t(a) {
        return a.charAt(0).toUpperCase() + a.slice(1)
    }

    function D(a, b, f, c) {
        if (!c) {
            if (b)a[_callback]("ifToggled");
            a[_callback]("ifChanged")[_callback]("if" + t(f))
        }
    }

    var m = "iCheck", C = m + "-helper", r = "radio", k = "checked", y = "un" + k, n = "disabled";
    _determinate = "determinate";
    _indeterminate = "in" + _determinate;
    _update = "update";
    _type = "type";
    _click = "click";
    _touch = "touchbegin.i touchend.i";
    _add = "addClass";
    _remove = "removeClass";
    _callback = "trigger";
    _label = "label";
    _cursor = "cursor";
    _mobile = /ipad|iphone|ipod|android|blackberry|windows phone|opera mini|silk/i.test(navigator.userAgent);
    f.fn[m] = function (a, b) {
        var d = 'input[type="checkbox"], input[type="' + r + '"]', c = f(), g = function (a) {
            a.each(function () {
                var a = f(this);
                c = a.is(d) ? c.add(a) : c.add(a.find(d))
            })
        };
        if (/^(check|uncheck|toggle|indeterminate|determinate|disable|enable|update|destroy)$/i.test(a))return a = a.toLowerCase(), g(this), c.each(function () {
            var c =
                f(this);
            "destroy" == a ? E(c, "ifDestroyed") : A(c, !0, a);
            f.isFunction(b) && b()
        });
        if ("object" != typeof a && a)return this;
        var e = f.extend({
            checkedClass: k,
            disabledClass: n,
            indeterminateClass: _indeterminate,
            labelHover: !0
        }, a), l = e.handle, v = e.hoverClass || "hover", s = e.focusClass || "focus", t = e.activeClass || "active", B = !!e.labelHover, w = e.labelHoverClass || "hover", p = ("" + e.increaseArea).replace("%", "") | 0;
        if ("checkbox" == l || l == r)d = 'input[type="' + l + '"]';
        -50 > p && (p = -50);
        g(this);
        return c.each(function () {
            var a = f(this);
            E(a);
            var c = this,
                b = c.id, g = -p + "%", d = 100 + 2 * p + "%", d = {
                    position: "absolute",
                    top: g,
                    left: g,
                    display: "block",
                    width: d,
                    height: d,
                    margin: 0,
                    padding: 0,
                    background: "#fff",
                    border: 0,
                    opacity: 0
                }, g = _mobile ? {position: "absolute", visibility: "hidden"} : p ? d : {
                    position: "absolute",
                    opacity: 0
                }, l = "checkbox" == c[_type] ? e.checkboxClass || "icheckbox" : e.radioClass || "i" + r, z = f(_label + '[for="' + b + '"]').add(a.closest(_label)), u = !!e.aria, y = m + "-" + Math.random().toString(36).substr(2, 6), h = '<div class="' + l + '" ' + (u ? 'role="' + c[_type] + '" ' : "");
            u && z.each(function () {
                h +=
                    'aria-labelledby="';
                this.id ? h += this.id : (this.id = y, h += y);
                h += '"'
            });
            h = a.wrap(h + "/>")[_callback]("ifCreated").parent().append(e.insert);
            d = f('<ins class="' + C + '"/>').css(d).appendTo(h);
            a.data(m, {o: e, s: a.attr("style")}).css(g);
            e.inheritClass && h[_add](c.className || "");
            e.inheritID && b && h.attr("id", m + "-" + b);
            "static" == h.css("position") && h.css("position", "relative");
            A(a, !0, _update);
            if (z.length)z.on(_click + ".i mouseover.i mouseout.i " + _touch, function (b) {
                var d = b[_type], e = f(this);
                if (!c[n]) {
                    if (d == _click) {
                        if (f(b.target).is("a"))return;
                        A(a, !1, !0)
                    } else B && (/ut|nd/.test(d) ? (h[_remove](v), e[_remove](w)) : (h[_add](v), e[_add](w)));
                    if (_mobile)b.stopPropagation(); else return !1
                }
            });
            a.on(_click + ".i focus.i blur.i keyup.i keydown.i keypress.i", function (b) {
                var d = b[_type];
                b = b.keyCode;
                if (d == _click)return !1;
                if ("keydown" == d && 32 == b)return c[_type] == r && c[k] || (c[k] ? q(a, k) : x(a, k)), !1;
                if ("keyup" == d && c[_type] == r)!c[k] && x(a, k); else if (/us|ur/.test(d))h["blur" == d ? _remove : _add](s)
            });
            d.on(_click + " mousedown mouseup mouseover mouseout " + _touch, function (b) {
                var d =
                    b[_type], e = /wn|up/.test(d) ? t : v;
                if (!c[n]) {
                    if (d == _click)A(a, !1, !0); else {
                        if (/wn|er|in/.test(d))h[_add](e); else h[_remove](e + " " + t);
                        if (z.length && B && e == v)z[/ut|nd/.test(d) ? _remove : _add](w)
                    }
                    if (_mobile)b.stopPropagation(); else return !1
                }
            })
        })
    }
})(window.jQuery || window.Zepto);

//password Strength
$.fn.passwordStrength = function (options) {
    return this.each(function () {
        var that = this;
        that.opts = {};
        that.opts = $.extend({}, $.fn.passwordStrength.defaults, options);
        that.div = $(that.opts.targetDiv);
        that.defaultClass = that.div.attr("class");
        that.percents = (that.opts.classes.length) ? 100 / that.opts.classes.length : 100;
        v = $(this).keyup(function () {
            if (typeof el == "undefined") {
                this.el = $(this)
            }
            var s = $.passwordStrength.getPasswordStrength(this.value);
            var p = this.percents;
            var t = Math.floor(s / p);
            if (100 <= s) {
                t = this.opts.classes.length - 1
            }
            this.div.removeAttr("class").addClass(this.defaultClass).addClass(this.opts.classes[t])
        })
    })
};
$.fn.passwordStrength.defaults = {
    classes: Array("is0", "is10", "is20", "is30", "is40", "is50", "is60", "is70", "is80", "is90", "is100"),
    targetDiv: "#passwordStrengthDiv",
    cache: {}
};
$.passwordStrength = {};
$.passwordStrength.getPasswordStrength = function (H) {
    var D = (H.length);
    if (D > 5) {
        D = 5
    }
    var F = H.replace(/[0-9]/g, "");
    var G = (H.length - F.length);
    if (G > 3) {
        G = 3
    }
    var A = H.replace(/\W/g, "");
    var C = (H.length - A.length);
    if (C > 3) {
        C = 3
    }
    var B = H.replace(/[A-Z]/g, "");
    var I = (H.length - B.length);
    if (I > 3) {
        I = 3
    }
    var E = ((D * 10) - 20) + (G * 10) + (C * 15) + (I * 10);
    if (E < 0) {
        E = 0
    }
    if (E > 100) {
        E = 100
    }
    return E
};
//select2
!function (a) {
    "undefined" == typeof a.fn.each2 && a.extend(a.fn, {
        each2: function (b) {
            for (var c = a([0]), d = -1, e = this.length; ++d < e && (c.context = c[0] = this[d]) && b.call(c[0], d, c) !== !1;);
            return this
        }
    })
}(jQuery), function (a, b) {
    "use strict";
    function n(b) {
        var c = a(document.createTextNode(""));
        b.before(c), c.before(b), c.remove()
    }

    function o(a) {
        function b(a) {
            return m[a] || a
        }

        return a.replace(/[^\u0000-\u007E]/g, b)
    }

    function p(a, b) {
        for (var c = 0, d = b.length; d > c; c += 1)if (r(a, b[c]))return c;
        return -1
    }

    function q() {
        var b = a(l);
        b.appendTo(document.body);
        var c = {width: b.width() - b[0].clientWidth, height: b.height() - b[0].clientHeight};
        return b.remove(), c
    }

    function r(a, c) {
        return a === c ? !0 : a === b || c === b ? !1 : null === a || null === c ? !1 : a.constructor === String ? a + "" == c + "" : c.constructor === String ? c + "" == a + "" : !1
    }

    function s(a, b, c) {
        var d, e, f;
        if (null === a || a.length < 1)return [];
        for (d = a.split(b), e = 0, f = d.length; f > e; e += 1)d[e] = c(d[e]);
        return d
    }

    function t(a) {
        return a.outerWidth(!1) - a.width()
    }

    function u(c) {
        var d = "keyup-change-value";
        c.on("keydown", function () {
            a.data(c, d) === b && a.data(c, d, c.val())
        }), c.on("keyup", function () {
            var e = a.data(c, d);
            e !== b && c.val() !== e && (a.removeData(c, d), c.trigger("keyup-change"))
        })
    }

    function v(c) {
        c.on("mousemove", function (c) {
            var d = h;
            (d === b || d.x !== c.pageX || d.y !== c.pageY) && a(c.target).trigger("mousemove-filtered", c)
        })
    }

    function w(a, c, d) {
        d = d || b;
        var e;
        return function () {
            var b = arguments;
            window.clearTimeout(e), e = window.setTimeout(function () {
                c.apply(d, b)
            }, a)
        }
    }

    function x(a, b) {
        var c = w(a, function (a) {
            b.trigger("scroll-debounced", a)
        });
        b.on("scroll", function (a) {
            p(a.target, b.get()) >= 0 && c(a)
        })
    }

    function y(a) {
        a[0] !== document.activeElement && window.setTimeout(function () {
            var d, b = a[0], c = a.val().length;
            a.focus();
            var e = b.offsetWidth > 0 || b.offsetHeight > 0;
            e && b === document.activeElement && (b.setSelectionRange ? b.setSelectionRange(c, c) : b.createTextRange && (d = b.createTextRange(), d.collapse(!1), d.select()))
        }, 0)
    }

    function z(b) {
        b = a(b)[0];
        var c = 0, d = 0;
        if ("selectionStart"in b)c = b.selectionStart, d = b.selectionEnd - c; else if ("selection"in document) {
            b.focus();
            var e = document.selection.createRange();
            d = document.selection.createRange().text.length, e.moveStart("character", -b.value.length), c = e.text.length - d
        }
        return {offset: c, length: d}
    }

    function A(a) {
        a.preventDefault(), a.stopPropagation()
    }

    function B(a) {
        a.preventDefault(), a.stopImmediatePropagation()
    }

    function C(b) {
        if (!g) {
            var c = b[0].currentStyle || window.getComputedStyle(b[0], null);
            g = a(document.createElement("div")).css({
                position: "absolute",
                left: "-10000px",
                top: "-10000px",
                display: "none",
                fontSize: c.fontSize,
                fontFamily: c.fontFamily,
                fontStyle: c.fontStyle,
                fontWeight: c.fontWeight,
                letterSpacing: c.letterSpacing,
                textTransform: c.textTransform,
                whiteSpace: "nowrap"
            }), g.attr("class", "select2-sizer"), a(document.body).append(g)
        }
        return g.text(b.val()), g.width()
    }

    function D(b, c, d) {
        var e, g, f = [];
        e = a.trim(b.attr("class")), e && (e = "" + e, a(e.split(/\s+/)).each2(function () {
            0 === this.indexOf("select2-") && f.push(this)
        })), e = a.trim(c.attr("class")), e && (e = "" + e, a(e.split(/\s+/)).each2(function () {
            0 !== this.indexOf("select2-") && (g = d(this), g && f.push(g))
        })), b.attr("class", f.join(" "))
    }

    function E(a, b, c, d) {
        var e = o(a.toUpperCase()).indexOf(o(b.toUpperCase())), f = b.length;
        return 0 > e ? (c.push(d(a)), void 0) : (c.push(d(a.substring(0, e))), c.push("<span class='select2-match'>"), c.push(d(a.substring(e, e + f))), c.push("</span>"), c.push(d(a.substring(e + f, a.length))), void 0)
    }

    function F(a) {
        var b = {"\\": "&#92;", "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;", "/": "&#47;"};
        return String(a).replace(/[&<>"'\/\\]/g, function (a) {
            return b[a]
        })
    }

    function G(c) {
        var d, e = null, f = c.quietMillis || 100, g = c.url, h = this;
        return function (i) {
            window.clearTimeout(d), d = window.setTimeout(function () {
                var d = c.data, f = g, j = c.transport || a.fn.select2.ajaxDefaults.transport, k = {
                    type: c.type || "GET",
                    cache: c.cache || !1,
                    jsonpCallback: c.jsonpCallback || b,
                    dataType: c.dataType || "json"
                }, l = a.extend({}, a.fn.select2.ajaxDefaults.params, k);
                d = d ? d.call(h, i.term, i.page, i.context) : null, f = "function" == typeof f ? f.call(h, i.term, i.page, i.context) : f, e && "function" == typeof e.abort && e.abort(), c.params && (a.isFunction(c.params) ? a.extend(l, c.params.call(h)) : a.extend(l, c.params)), a.extend(l, {
                    url: f,
                    dataType: c.dataType,
                    data: d,
                    success: function (a) {
                        var b = c.results(a, i.page, i);
                        i.callback(b)
                    },
                    error: function (a, b, c) {
                        var d = {hasError: !0, jqXHR: a, textStatus: b, errorThrown: c};
                        i.callback(d)
                    }
                }), e = j.call(h, l)
            }, f)
        }
    }

    function H(b) {
        var d, e, c = b, f = function (a) {
            return "" + a.text
        };
        a.isArray(c) && (e = c, c = {results: e}), a.isFunction(c) === !1 && (e = c, c = function () {
            return e
        });
        var g = c();
        return g.text && (f = g.text, a.isFunction(f) || (d = g.text, f = function (a) {
            return a[d]
        })), function (b) {
            var g, d = b.term, e = {results: []};
            return "" === d ? (b.callback(c()), void 0) : (g = function (c, e) {
                var h, i;
                if (c = c[0], c.children) {
                    h = {};
                    for (i in c)c.hasOwnProperty(i) && (h[i] = c[i]);
                    h.children = [], a(c.children).each2(function (a, b) {
                        g(b, h.children)
                    }), (h.children.length || b.matcher(d, f(h), c)) && e.push(h)
                } else b.matcher(d, f(c), c) && e.push(c)
            }, a(c().results).each2(function (a, b) {
                g(b, e.results)
            }), b.callback(e), void 0)
        }
    }

    function I(c) {
        var d = a.isFunction(c);
        return function (e) {
            var f = e.term, g = {results: []}, h = d ? c(e) : c;
            a.isArray(h) && (a(h).each(function () {
                var a = this.text !== b, c = a ? this.text : this;
                ("" === f || e.matcher(f, c)) && g.results.push(a ? this : {id: this, text: this})
            }), e.callback(g))
        }
    }

    function J(b, c) {
        if (a.isFunction(b))return !0;
        if (!b)return !1;
        if ("string" == typeof b)return !0;
        throw new Error(c + " must be a string, function, or falsy value")
    }

    function K(b, c) {
        if (a.isFunction(b)) {
            var d = Array.prototype.slice.call(arguments, 2);
            return b.apply(c, d)
        }
        return b
    }

    function L(b) {
        var c = 0;
        return a.each(b, function (a, b) {
            b.children ? c += L(b.children) : c++
        }), c
    }

    function M(a, c, d, e) {
        var h, i, j, k, l, f = a, g = !1;
        if (!e.createSearchChoice || !e.tokenSeparators || e.tokenSeparators.length < 1)return b;
        for (; ;) {
            for (i = -1, j = 0, k = e.tokenSeparators.length; k > j && (l = e.tokenSeparators[j], i = a.indexOf(l), !(i >= 0)); j++);
            if (0 > i)break;
            if (h = a.substring(0, i), a = a.substring(i + l.length), h.length > 0 && (h = e.createSearchChoice.call(this, h, c), h !== b && null !== h && e.id(h) !== b && null !== e.id(h))) {
                for (g = !1, j = 0, k = c.length; k > j; j++)if (r(e.id(h), e.id(c[j]))) {
                    g = !0;
                    break
                }
                g || d(h)
            }
        }
        return f !== a ? a : void 0
    }

    function N() {
        var b = this;
        a.each(arguments, function (a, c) {
            b[c].remove(), b[c] = null
        })
    }

    function O(b, c) {
        var d = function () {
        };
        return d.prototype = new b, d.prototype.constructor = d, d.prototype.parent = b.prototype, d.prototype = a.extend(d.prototype, c), d
    }

    if (window.Select2 === b) {
        var c, d, e, f, g, i, j, h = {x: 0, y: 0}, k = {
            TAB: 9,
            ENTER: 13,
            ESC: 27,
            SPACE: 32,
            LEFT: 37,
            UP: 38,
            RIGHT: 39,
            DOWN: 40,
            SHIFT: 16,
            CTRL: 17,
            ALT: 18,
            PAGE_UP: 33,
            PAGE_DOWN: 34,
            HOME: 36,
            END: 35,
            BACKSPACE: 8,
            DELETE: 46,
            isArrow: function (a) {
                switch (a = a.which ? a.which : a) {
                    case k.LEFT:
                    case k.RIGHT:
                    case k.UP:
                    case k.DOWN:
                        return !0
                }
                return !1
            },
            isControl: function (a) {
                var b = a.which;
                switch (b) {
                    case k.SHIFT:
                    case k.CTRL:
                    case k.ALT:
                        return !0
                }
                return a.metaKey ? !0 : !1
            },
            isFunctionKey: function (a) {
                return a = a.which ? a.which : a, a >= 112 && 123 >= a
            }
        }, l = "<div class='select2-measure-scrollbar'></div>", m = {
            "\u24b6": "A",
            "\uff21": "A",
            "\xc0": "A",
            "\xc1": "A",
            "\xc2": "A",
            "\u1ea6": "A",
            "\u1ea4": "A",
            "\u1eaa": "A",
            "\u1ea8": "A",
            "\xc3": "A",
            "\u0100": "A",
            "\u0102": "A",
            "\u1eb0": "A",
            "\u1eae": "A",
            "\u1eb4": "A",
            "\u1eb2": "A",
            "\u0226": "A",
            "\u01e0": "A",
            "\xc4": "A",
            "\u01de": "A",
            "\u1ea2": "A",
            "\xc5": "A",
            "\u01fa": "A",
            "\u01cd": "A",
            "\u0200": "A",
            "\u0202": "A",
            "\u1ea0": "A",
            "\u1eac": "A",
            "\u1eb6": "A",
            "\u1e00": "A",
            "\u0104": "A",
            "\u023a": "A",
            "\u2c6f": "A",
            "\ua732": "AA",
            "\xc6": "AE",
            "\u01fc": "AE",
            "\u01e2": "AE",
            "\ua734": "AO",
            "\ua736": "AU",
            "\ua738": "AV",
            "\ua73a": "AV",
            "\ua73c": "AY",
            "\u24b7": "B",
            "\uff22": "B",
            "\u1e02": "B",
            "\u1e04": "B",
            "\u1e06": "B",
            "\u0243": "B",
            "\u0182": "B",
            "\u0181": "B",
            "\u24b8": "C",
            "\uff23": "C",
            "\u0106": "C",
            "\u0108": "C",
            "\u010a": "C",
            "\u010c": "C",
            "\xc7": "C",
            "\u1e08": "C",
            "\u0187": "C",
            "\u023b": "C",
            "\ua73e": "C",
            "\u24b9": "D",
            "\uff24": "D",
            "\u1e0a": "D",
            "\u010e": "D",
            "\u1e0c": "D",
            "\u1e10": "D",
            "\u1e12": "D",
            "\u1e0e": "D",
            "\u0110": "D",
            "\u018b": "D",
            "\u018a": "D",
            "\u0189": "D",
            "\ua779": "D",
            "\u01f1": "DZ",
            "\u01c4": "DZ",
            "\u01f2": "Dz",
            "\u01c5": "Dz",
            "\u24ba": "E",
            "\uff25": "E",
            "\xc8": "E",
            "\xc9": "E",
            "\xca": "E",
            "\u1ec0": "E",
            "\u1ebe": "E",
            "\u1ec4": "E",
            "\u1ec2": "E",
            "\u1ebc": "E",
            "\u0112": "E",
            "\u1e14": "E",
            "\u1e16": "E",
            "\u0114": "E",
            "\u0116": "E",
            "\xcb": "E",
            "\u1eba": "E",
            "\u011a": "E",
            "\u0204": "E",
            "\u0206": "E",
            "\u1eb8": "E",
            "\u1ec6": "E",
            "\u0228": "E",
            "\u1e1c": "E",
            "\u0118": "E",
            "\u1e18": "E",
            "\u1e1a": "E",
            "\u0190": "E",
            "\u018e": "E",
            "\u24bb": "F",
            "\uff26": "F",
            "\u1e1e": "F",
            "\u0191": "F",
            "\ua77b": "F",
            "\u24bc": "G",
            "\uff27": "G",
            "\u01f4": "G",
            "\u011c": "G",
            "\u1e20": "G",
            "\u011e": "G",
            "\u0120": "G",
            "\u01e6": "G",
            "\u0122": "G",
            "\u01e4": "G",
            "\u0193": "G",
            "\ua7a0": "G",
            "\ua77d": "G",
            "\ua77e": "G",
            "\u24bd": "H",
            "\uff28": "H",
            "\u0124": "H",
            "\u1e22": "H",
            "\u1e26": "H",
            "\u021e": "H",
            "\u1e24": "H",
            "\u1e28": "H",
            "\u1e2a": "H",
            "\u0126": "H",
            "\u2c67": "H",
            "\u2c75": "H",
            "\ua78d": "H",
            "\u24be": "I",
            "\uff29": "I",
            "\xcc": "I",
            "\xcd": "I",
            "\xce": "I",
            "\u0128": "I",
            "\u012a": "I",
            "\u012c": "I",
            "\u0130": "I",
            "\xcf": "I",
            "\u1e2e": "I",
            "\u1ec8": "I",
            "\u01cf": "I",
            "\u0208": "I",
            "\u020a": "I",
            "\u1eca": "I",
            "\u012e": "I",
            "\u1e2c": "I",
            "\u0197": "I",
            "\u24bf": "J",
            "\uff2a": "J",
            "\u0134": "J",
            "\u0248": "J",
            "\u24c0": "K",
            "\uff2b": "K",
            "\u1e30": "K",
            "\u01e8": "K",
            "\u1e32": "K",
            "\u0136": "K",
            "\u1e34": "K",
            "\u0198": "K",
            "\u2c69": "K",
            "\ua740": "K",
            "\ua742": "K",
            "\ua744": "K",
            "\ua7a2": "K",
            "\u24c1": "L",
            "\uff2c": "L",
            "\u013f": "L",
            "\u0139": "L",
            "\u013d": "L",
            "\u1e36": "L",
            "\u1e38": "L",
            "\u013b": "L",
            "\u1e3c": "L",
            "\u1e3a": "L",
            "\u0141": "L",
            "\u023d": "L",
            "\u2c62": "L",
            "\u2c60": "L",
            "\ua748": "L",
            "\ua746": "L",
            "\ua780": "L",
            "\u01c7": "LJ",
            "\u01c8": "Lj",
            "\u24c2": "M",
            "\uff2d": "M",
            "\u1e3e": "M",
            "\u1e40": "M",
            "\u1e42": "M",
            "\u2c6e": "M",
            "\u019c": "M",
            "\u24c3": "N",
            "\uff2e": "N",
            "\u01f8": "N",
            "\u0143": "N",
            "\xd1": "N",
            "\u1e44": "N",
            "\u0147": "N",
            "\u1e46": "N",
            "\u0145": "N",
            "\u1e4a": "N",
            "\u1e48": "N",
            "\u0220": "N",
            "\u019d": "N",
            "\ua790": "N",
            "\ua7a4": "N",
            "\u01ca": "NJ",
            "\u01cb": "Nj",
            "\u24c4": "O",
            "\uff2f": "O",
            "\xd2": "O",
            "\xd3": "O",
            "\xd4": "O",
            "\u1ed2": "O",
            "\u1ed0": "O",
            "\u1ed6": "O",
            "\u1ed4": "O",
            "\xd5": "O",
            "\u1e4c": "O",
            "\u022c": "O",
            "\u1e4e": "O",
            "\u014c": "O",
            "\u1e50": "O",
            "\u1e52": "O",
            "\u014e": "O",
            "\u022e": "O",
            "\u0230": "O",
            "\xd6": "O",
            "\u022a": "O",
            "\u1ece": "O",
            "\u0150": "O",
            "\u01d1": "O",
            "\u020c": "O",
            "\u020e": "O",
            "\u01a0": "O",
            "\u1edc": "O",
            "\u1eda": "O",
            "\u1ee0": "O",
            "\u1ede": "O",
            "\u1ee2": "O",
            "\u1ecc": "O",
            "\u1ed8": "O",
            "\u01ea": "O",
            "\u01ec": "O",
            "\xd8": "O",
            "\u01fe": "O",
            "\u0186": "O",
            "\u019f": "O",
            "\ua74a": "O",
            "\ua74c": "O",
            "\u01a2": "OI",
            "\ua74e": "OO",
            "\u0222": "OU",
            "\u24c5": "P",
            "\uff30": "P",
            "\u1e54": "P",
            "\u1e56": "P",
            "\u01a4": "P",
            "\u2c63": "P",
            "\ua750": "P",
            "\ua752": "P",
            "\ua754": "P",
            "\u24c6": "Q",
            "\uff31": "Q",
            "\ua756": "Q",
            "\ua758": "Q",
            "\u024a": "Q",
            "\u24c7": "R",
            "\uff32": "R",
            "\u0154": "R",
            "\u1e58": "R",
            "\u0158": "R",
            "\u0210": "R",
            "\u0212": "R",
            "\u1e5a": "R",
            "\u1e5c": "R",
            "\u0156": "R",
            "\u1e5e": "R",
            "\u024c": "R",
            "\u2c64": "R",
            "\ua75a": "R",
            "\ua7a6": "R",
            "\ua782": "R",
            "\u24c8": "S",
            "\uff33": "S",
            "\u1e9e": "S",
            "\u015a": "S",
            "\u1e64": "S",
            "\u015c": "S",
            "\u1e60": "S",
            "\u0160": "S",
            "\u1e66": "S",
            "\u1e62": "S",
            "\u1e68": "S",
            "\u0218": "S",
            "\u015e": "S",
            "\u2c7e": "S",
            "\ua7a8": "S",
            "\ua784": "S",
            "\u24c9": "T",
            "\uff34": "T",
            "\u1e6a": "T",
            "\u0164": "T",
            "\u1e6c": "T",
            "\u021a": "T",
            "\u0162": "T",
            "\u1e70": "T",
            "\u1e6e": "T",
            "\u0166": "T",
            "\u01ac": "T",
            "\u01ae": "T",
            "\u023e": "T",
            "\ua786": "T",
            "\ua728": "TZ",
            "\u24ca": "U",
            "\uff35": "U",
            "\xd9": "U",
            "\xda": "U",
            "\xdb": "U",
            "\u0168": "U",
            "\u1e78": "U",
            "\u016a": "U",
            "\u1e7a": "U",
            "\u016c": "U",
            "\xdc": "U",
            "\u01db": "U",
            "\u01d7": "U",
            "\u01d5": "U",
            "\u01d9": "U",
            "\u1ee6": "U",
            "\u016e": "U",
            "\u0170": "U",
            "\u01d3": "U",
            "\u0214": "U",
            "\u0216": "U",
            "\u01af": "U",
            "\u1eea": "U",
            "\u1ee8": "U",
            "\u1eee": "U",
            "\u1eec": "U",
            "\u1ef0": "U",
            "\u1ee4": "U",
            "\u1e72": "U",
            "\u0172": "U",
            "\u1e76": "U",
            "\u1e74": "U",
            "\u0244": "U",
            "\u24cb": "V",
            "\uff36": "V",
            "\u1e7c": "V",
            "\u1e7e": "V",
            "\u01b2": "V",
            "\ua75e": "V",
            "\u0245": "V",
            "\ua760": "VY",
            "\u24cc": "W",
            "\uff37": "W",
            "\u1e80": "W",
            "\u1e82": "W",
            "\u0174": "W",
            "\u1e86": "W",
            "\u1e84": "W",
            "\u1e88": "W",
            "\u2c72": "W",
            "\u24cd": "X",
            "\uff38": "X",
            "\u1e8a": "X",
            "\u1e8c": "X",
            "\u24ce": "Y",
            "\uff39": "Y",
            "\u1ef2": "Y",
            "\xdd": "Y",
            "\u0176": "Y",
            "\u1ef8": "Y",
            "\u0232": "Y",
            "\u1e8e": "Y",
            "\u0178": "Y",
            "\u1ef6": "Y",
            "\u1ef4": "Y",
            "\u01b3": "Y",
            "\u024e": "Y",
            "\u1efe": "Y",
            "\u24cf": "Z",
            "\uff3a": "Z",
            "\u0179": "Z",
            "\u1e90": "Z",
            "\u017b": "Z",
            "\u017d": "Z",
            "\u1e92": "Z",
            "\u1e94": "Z",
            "\u01b5": "Z",
            "\u0224": "Z",
            "\u2c7f": "Z",
            "\u2c6b": "Z",
            "\ua762": "Z",
            "\u24d0": "a",
            "\uff41": "a",
            "\u1e9a": "a",
            "\xe0": "a",
            "\xe1": "a",
            "\xe2": "a",
            "\u1ea7": "a",
            "\u1ea5": "a",
            "\u1eab": "a",
            "\u1ea9": "a",
            "\xe3": "a",
            "\u0101": "a",
            "\u0103": "a",
            "\u1eb1": "a",
            "\u1eaf": "a",
            "\u1eb5": "a",
            "\u1eb3": "a",
            "\u0227": "a",
            "\u01e1": "a",
            "\xe4": "a",
            "\u01df": "a",
            "\u1ea3": "a",
            "\xe5": "a",
            "\u01fb": "a",
            "\u01ce": "a",
            "\u0201": "a",
            "\u0203": "a",
            "\u1ea1": "a",
            "\u1ead": "a",
            "\u1eb7": "a",
            "\u1e01": "a",
            "\u0105": "a",
            "\u2c65": "a",
            "\u0250": "a",
            "\ua733": "aa",
            "\xe6": "ae",
            "\u01fd": "ae",
            "\u01e3": "ae",
            "\ua735": "ao",
            "\ua737": "au",
            "\ua739": "av",
            "\ua73b": "av",
            "\ua73d": "ay",
            "\u24d1": "b",
            "\uff42": "b",
            "\u1e03": "b",
            "\u1e05": "b",
            "\u1e07": "b",
            "\u0180": "b",
            "\u0183": "b",
            "\u0253": "b",
            "\u24d2": "c",
            "\uff43": "c",
            "\u0107": "c",
            "\u0109": "c",
            "\u010b": "c",
            "\u010d": "c",
            "\xe7": "c",
            "\u1e09": "c",
            "\u0188": "c",
            "\u023c": "c",
            "\ua73f": "c",
            "\u2184": "c",
            "\u24d3": "d",
            "\uff44": "d",
            "\u1e0b": "d",
            "\u010f": "d",
            "\u1e0d": "d",
            "\u1e11": "d",
            "\u1e13": "d",
            "\u1e0f": "d",
            "\u0111": "d",
            "\u018c": "d",
            "\u0256": "d",
            "\u0257": "d",
            "\ua77a": "d",
            "\u01f3": "dz",
            "\u01c6": "dz",
            "\u24d4": "e",
            "\uff45": "e",
            "\xe8": "e",
            "\xe9": "e",
            "\xea": "e",
            "\u1ec1": "e",
            "\u1ebf": "e",
            "\u1ec5": "e",
            "\u1ec3": "e",
            "\u1ebd": "e",
            "\u0113": "e",
            "\u1e15": "e",
            "\u1e17": "e",
            "\u0115": "e",
            "\u0117": "e",
            "\xeb": "e",
            "\u1ebb": "e",
            "\u011b": "e",
            "\u0205": "e",
            "\u0207": "e",
            "\u1eb9": "e",
            "\u1ec7": "e",
            "\u0229": "e",
            "\u1e1d": "e",
            "\u0119": "e",
            "\u1e19": "e",
            "\u1e1b": "e",
            "\u0247": "e",
            "\u025b": "e",
            "\u01dd": "e",
            "\u24d5": "f",
            "\uff46": "f",
            "\u1e1f": "f",
            "\u0192": "f",
            "\ua77c": "f",
            "\u24d6": "g",
            "\uff47": "g",
            "\u01f5": "g",
            "\u011d": "g",
            "\u1e21": "g",
            "\u011f": "g",
            "\u0121": "g",
            "\u01e7": "g",
            "\u0123": "g",
            "\u01e5": "g",
            "\u0260": "g",
            "\ua7a1": "g",
            "\u1d79": "g",
            "\ua77f": "g",
            "\u24d7": "h",
            "\uff48": "h",
            "\u0125": "h",
            "\u1e23": "h",
            "\u1e27": "h",
            "\u021f": "h",
            "\u1e25": "h",
            "\u1e29": "h",
            "\u1e2b": "h",
            "\u1e96": "h",
            "\u0127": "h",
            "\u2c68": "h",
            "\u2c76": "h",
            "\u0265": "h",
            "\u0195": "hv",
            "\u24d8": "i",
            "\uff49": "i",
            "\xec": "i",
            "\xed": "i",
            "\xee": "i",
            "\u0129": "i",
            "\u012b": "i",
            "\u012d": "i",
            "\xef": "i",
            "\u1e2f": "i",
            "\u1ec9": "i",
            "\u01d0": "i",
            "\u0209": "i",
            "\u020b": "i",
            "\u1ecb": "i",
            "\u012f": "i",
            "\u1e2d": "i",
            "\u0268": "i",
            "\u0131": "i",
            "\u24d9": "j",
            "\uff4a": "j",
            "\u0135": "j",
            "\u01f0": "j",
            "\u0249": "j",
            "\u24da": "k",
            "\uff4b": "k",
            "\u1e31": "k",
            "\u01e9": "k",
            "\u1e33": "k",
            "\u0137": "k",
            "\u1e35": "k",
            "\u0199": "k",
            "\u2c6a": "k",
            "\ua741": "k",
            "\ua743": "k",
            "\ua745": "k",
            "\ua7a3": "k",
            "\u24db": "l",
            "\uff4c": "l",
            "\u0140": "l",
            "\u013a": "l",
            "\u013e": "l",
            "\u1e37": "l",
            "\u1e39": "l",
            "\u013c": "l",
            "\u1e3d": "l",
            "\u1e3b": "l",
            "\u017f": "l",
            "\u0142": "l",
            "\u019a": "l",
            "\u026b": "l",
            "\u2c61": "l",
            "\ua749": "l",
            "\ua781": "l",
            "\ua747": "l",
            "\u01c9": "lj",
            "\u24dc": "m",
            "\uff4d": "m",
            "\u1e3f": "m",
            "\u1e41": "m",
            "\u1e43": "m",
            "\u0271": "m",
            "\u026f": "m",
            "\u24dd": "n",
            "\uff4e": "n",
            "\u01f9": "n",
            "\u0144": "n",
            "\xf1": "n",
            "\u1e45": "n",
            "\u0148": "n",
            "\u1e47": "n",
            "\u0146": "n",
            "\u1e4b": "n",
            "\u1e49": "n",
            "\u019e": "n",
            "\u0272": "n",
            "\u0149": "n",
            "\ua791": "n",
            "\ua7a5": "n",
            "\u01cc": "nj",
            "\u24de": "o",
            "\uff4f": "o",
            "\xf2": "o",
            "\xf3": "o",
            "\xf4": "o",
            "\u1ed3": "o",
            "\u1ed1": "o",
            "\u1ed7": "o",
            "\u1ed5": "o",
            "\xf5": "o",
            "\u1e4d": "o",
            "\u022d": "o",
            "\u1e4f": "o",
            "\u014d": "o",
            "\u1e51": "o",
            "\u1e53": "o",
            "\u014f": "o",
            "\u022f": "o",
            "\u0231": "o",
            "\xf6": "o",
            "\u022b": "o",
            "\u1ecf": "o",
            "\u0151": "o",
            "\u01d2": "o",
            "\u020d": "o",
            "\u020f": "o",
            "\u01a1": "o",
            "\u1edd": "o",
            "\u1edb": "o",
            "\u1ee1": "o",
            "\u1edf": "o",
            "\u1ee3": "o",
            "\u1ecd": "o",
            "\u1ed9": "o",
            "\u01eb": "o",
            "\u01ed": "o",
            "\xf8": "o",
            "\u01ff": "o",
            "\u0254": "o",
            "\ua74b": "o",
            "\ua74d": "o",
            "\u0275": "o",
            "\u01a3": "oi",
            "\u0223": "ou",
            "\ua74f": "oo",
            "\u24df": "p",
            "\uff50": "p",
            "\u1e55": "p",
            "\u1e57": "p",
            "\u01a5": "p",
            "\u1d7d": "p",
            "\ua751": "p",
            "\ua753": "p",
            "\ua755": "p",
            "\u24e0": "q",
            "\uff51": "q",
            "\u024b": "q",
            "\ua757": "q",
            "\ua759": "q",
            "\u24e1": "r",
            "\uff52": "r",
            "\u0155": "r",
            "\u1e59": "r",
            "\u0159": "r",
            "\u0211": "r",
            "\u0213": "r",
            "\u1e5b": "r",
            "\u1e5d": "r",
            "\u0157": "r",
            "\u1e5f": "r",
            "\u024d": "r",
            "\u027d": "r",
            "\ua75b": "r",
            "\ua7a7": "r",
            "\ua783": "r",
            "\u24e2": "s",
            "\uff53": "s",
            "\xdf": "s",
            "\u015b": "s",
            "\u1e65": "s",
            "\u015d": "s",
            "\u1e61": "s",
            "\u0161": "s",
            "\u1e67": "s",
            "\u1e63": "s",
            "\u1e69": "s",
            "\u0219": "s",
            "\u015f": "s",
            "\u023f": "s",
            "\ua7a9": "s",
            "\ua785": "s",
            "\u1e9b": "s",
            "\u24e3": "t",
            "\uff54": "t",
            "\u1e6b": "t",
            "\u1e97": "t",
            "\u0165": "t",
            "\u1e6d": "t",
            "\u021b": "t",
            "\u0163": "t",
            "\u1e71": "t",
            "\u1e6f": "t",
            "\u0167": "t",
            "\u01ad": "t",
            "\u0288": "t",
            "\u2c66": "t",
            "\ua787": "t",
            "\ua729": "tz",
            "\u24e4": "u",
            "\uff55": "u",
            "\xf9": "u",
            "\xfa": "u",
            "\xfb": "u",
            "\u0169": "u",
            "\u1e79": "u",
            "\u016b": "u",
            "\u1e7b": "u",
            "\u016d": "u",
            "\xfc": "u",
            "\u01dc": "u",
            "\u01d8": "u",
            "\u01d6": "u",
            "\u01da": "u",
            "\u1ee7": "u",
            "\u016f": "u",
            "\u0171": "u",
            "\u01d4": "u",
            "\u0215": "u",
            "\u0217": "u",
            "\u01b0": "u",
            "\u1eeb": "u",
            "\u1ee9": "u",
            "\u1eef": "u",
            "\u1eed": "u",
            "\u1ef1": "u",
            "\u1ee5": "u",
            "\u1e73": "u",
            "\u0173": "u",
            "\u1e77": "u",
            "\u1e75": "u",
            "\u0289": "u",
            "\u24e5": "v",
            "\uff56": "v",
            "\u1e7d": "v",
            "\u1e7f": "v",
            "\u028b": "v",
            "\ua75f": "v",
            "\u028c": "v",
            "\ua761": "vy",
            "\u24e6": "w",
            "\uff57": "w",
            "\u1e81": "w",
            "\u1e83": "w",
            "\u0175": "w",
            "\u1e87": "w",
            "\u1e85": "w",
            "\u1e98": "w",
            "\u1e89": "w",
            "\u2c73": "w",
            "\u24e7": "x",
            "\uff58": "x",
            "\u1e8b": "x",
            "\u1e8d": "x",
            "\u24e8": "y",
            "\uff59": "y",
            "\u1ef3": "y",
            "\xfd": "y",
            "\u0177": "y",
            "\u1ef9": "y",
            "\u0233": "y",
            "\u1e8f": "y",
            "\xff": "y",
            "\u1ef7": "y",
            "\u1e99": "y",
            "\u1ef5": "y",
            "\u01b4": "y",
            "\u024f": "y",
            "\u1eff": "y",
            "\u24e9": "z",
            "\uff5a": "z",
            "\u017a": "z",
            "\u1e91": "z",
            "\u017c": "z",
            "\u017e": "z",
            "\u1e93": "z",
            "\u1e95": "z",
            "\u01b6": "z",
            "\u0225": "z",
            "\u0240": "z",
            "\u2c6c": "z",
            "\ua763": "z",
            "\u0386": "\u0391",
            "\u0388": "\u0395",
            "\u0389": "\u0397",
            "\u038a": "\u0399",
            "\u03aa": "\u0399",
            "\u038c": "\u039f",
            "\u038e": "\u03a5",
            "\u03ab": "\u03a5",
            "\u038f": "\u03a9",
            "\u03ac": "\u03b1",
            "\u03ad": "\u03b5",
            "\u03ae": "\u03b7",
            "\u03af": "\u03b9",
            "\u03ca": "\u03b9",
            "\u0390": "\u03b9",
            "\u03cc": "\u03bf",
            "\u03cd": "\u03c5",
            "\u03cb": "\u03c5",
            "\u03b0": "\u03c5",
            "\u03c9": "\u03c9",
            "\u03c2": "\u03c3"
        };
        i = a(document), f = function () {
            var a = 1;
            return function () {
                return a++
            }
        }(), c = O(Object, {
            bind: function (a) {
                var b = this;
                return function () {
                    a.apply(b, arguments)
                }
            }, init: function (c) {
                var d, e, g = ".select2-results";
                this.opts = c = this.prepareOpts(c), this.id = c.id, c.element.data("select2") !== b && null !== c.element.data("select2") && c.element.data("select2").destroy(), this.container = this.createContainer(), this.liveRegion = a(".select2-hidden-accessible"), 0 == this.liveRegion.length && (this.liveRegion = a("<span>", {
                    role: "status",
                    "aria-live": "polite"
                }).addClass("select2-hidden-accessible").appendTo(document.body)), this.containerId = "s2id_" + (c.element.attr("id") || "autogen" + f()), this.containerEventName = this.containerId.replace(/([.])/g, "_").replace(/([;&,\-\.\+\*\~':"\!\^#$%@\[\]\(\)=>\|])/g, "\\$1"), this.container.attr("id", this.containerId), this.container.attr("title", c.element.attr("title")), this.body = a(document.body), D(this.container, this.opts.element, this.opts.adaptContainerCssClass), this.container.attr("style", c.element.attr("style")), this.container.css(K(c.containerCss, this.opts.element)), this.container.addClass(K(c.containerCssClass, this.opts.element)), this.elementTabIndex = this.opts.element.attr("tabindex"), this.opts.element.data("select2", this).attr("tabindex", "-1").before(this.container).on("click.select2", A), this.container.data("select2", this), this.dropdown = this.container.find(".select2-drop"), D(this.dropdown, this.opts.element, this.opts.adaptDropdownCssClass), this.dropdown.addClass(K(c.dropdownCssClass, this.opts.element)), this.dropdown.data("select2", this), this.dropdown.on("click", A), this.results = d = this.container.find(g), this.search = e = this.container.find("input.select2-input"), this.queryCount = 0, this.resultsPage = 0, this.context = null, this.initContainer(), this.container.on("click", A), v(this.results), this.dropdown.on("mousemove-filtered", g, this.bind(this.highlightUnderEvent)), this.dropdown.on("touchstart touchmove touchend", g, this.bind(function (a) {
                    this._touchEvent = !0, this.highlightUnderEvent(a)
                })), this.dropdown.on("touchmove", g, this.bind(this.touchMoved)), this.dropdown.on("touchstart touchend", g, this.bind(this.clearTouchMoved)), this.dropdown.on("click", this.bind(function () {
                    this._touchEvent && (this._touchEvent = !1, this.selectHighlighted())
                })), x(80, this.results), this.dropdown.on("scroll-debounced", g, this.bind(this.loadMoreIfNeeded)), a(this.container).on("change", ".select2-input", function (a) {
                    a.stopPropagation()
                }), a(this.dropdown).on("change", ".select2-input", function (a) {
                    a.stopPropagation()
                }), a.fn.mousewheel && d.mousewheel(function (a, b, c, e) {
                    var f = d.scrollTop();
                    e > 0 && 0 >= f - e ? (d.scrollTop(0), A(a)) : 0 > e && d.get(0).scrollHeight - d.scrollTop() + e <= d.height() && (d.scrollTop(d.get(0).scrollHeight - d.height()), A(a))
                }), u(e), e.on("keyup-change input paste", this.bind(this.updateResults)), e.on("focus", function () {
                    e.addClass("select2-focused")
                }), e.on("blur", function () {
                    e.removeClass("select2-focused")
                }), this.dropdown.on("mouseup", g, this.bind(function (b) {
                    a(b.target).closest(".select2-result-selectable").length > 0 && (this.highlightUnderEvent(b), this.selectHighlighted(b))
                })), this.dropdown.on("click mouseup mousedown touchstart touchend focusin", function (a) {
                    a.stopPropagation()
                }), this.nextSearchTerm = b, a.isFunction(this.opts.initSelection) && (this.initSelection(), this.monitorSource()), null !== c.maximumInputLength && this.search.attr("maxlength", c.maximumInputLength);
                var h = c.element.prop("disabled");
                h === b && (h = !1), this.enable(!h);
                var i = c.element.prop("readonly");
                i === b && (i = !1), this.readonly(i), j = j || q(), this.autofocus = c.element.prop("autofocus"), c.element.prop("autofocus", !1), this.autofocus && this.focus(), this.search.attr("placeholder", c.searchInputPlaceholder)
            }, destroy: function () {
                var a = this.opts.element, c = a.data("select2"), d = this;
                this.close(), a.length && a[0].detachEvent && d._sync && a.each(function () {
                    d._sync && this.detachEvent("onpropertychange", d._sync)
                }), this.propertyObserver && (this.propertyObserver.disconnect(), this.propertyObserver = null), this._sync = null, c !== b && (c.container.remove(), c.liveRegion.remove(), c.dropdown.remove(), a.show().removeData("select2").off(".select2").prop("autofocus", this.autofocus || !1), this.elementTabIndex ? a.attr({tabindex: this.elementTabIndex}) : a.removeAttr("tabindex"), a.show()), N.call(this, "container", "liveRegion", "dropdown", "results", "search")
            }, optionToData: function (a) {
                return a.is("option") ? {
                    id: a.prop("value"),
                    text: a.text(),
                    element: a.get(),
                    css: a.attr("class"),
                    disabled: a.prop("disabled"),
                    locked: r(a.attr("locked"), "locked") || r(a.data("locked"), !0)
                } : a.is("optgroup") ? {
                    text: a.attr("label"),
                    children: [],
                    element: a.get(),
                    css: a.attr("class")
                } : void 0
            }, prepareOpts: function (c) {
                var d, e, g, h, i = this;
                if (d = c.element, "select" === d.get(0).tagName.toLowerCase() && (this.select = e = c.element), e && a.each(["id", "multiple", "ajax", "query", "createSearchChoice", "initSelection", "data", "tags"], function () {
                        if (this in c)throw new Error("Option '" + this + "' is not allowed for Select2 when attached to a <select> element.")
                    }), c = a.extend({}, {
                        populateResults: function (d, e, g) {
                            var h, j = this.opts.id, k = this.liveRegion;
                            h = function (d, e, l) {
                                var m, n, o, p, q, r, s, t, u, v;
                                d = c.sortResults(d, e, g);
                                var w = [];
                                for (m = 0, n = d.length; n > m; m += 1)o = d[m], q = o.disabled === !0, p = !q && j(o) !== b, r = o.children && o.children.length > 0, s = a("<li></li>"), s.addClass("select2-results-dept-" + l), s.addClass("select2-result"), s.addClass(p ? "select2-result-selectable" : "select2-result-unselectable"), q && s.addClass("select2-disabled"), r && s.addClass("select2-result-with-children"), s.addClass(i.opts.formatResultCssClass(o)), s.attr("role", "presentation"), t = a(document.createElement("div")), t.addClass("select2-result-label"), t.attr("id", "select2-result-label-" + f()), t.attr("role", "option"), v = c.formatResult(o, t, g, i.opts.escapeMarkup), v !== b && (t.html(v), s.append(t)), r && (u = a("<ul></ul>"), u.addClass("select2-result-sub"), h(o.children, u, l + 1), s.append(u)), s.data("select2-data", o), w.push(s[0]);
                                e.append(w), k.text(c.formatMatches(d.length))
                            }, h(e, d, 0)
                        }
                    }, a.fn.select2.defaults, c), "function" != typeof c.id && (g = c.id, c.id = function (a) {
                        return a[g]
                    }), a.isArray(c.element.data("select2Tags"))) {
                    if ("tags"in c)throw"tags specified as both an attribute 'data-select2-tags' and in options of Select2 " + c.element.attr("id");
                    c.tags = c.element.data("select2Tags")
                }
                if (e ? (c.query = this.bind(function (a) {
                        var f, g, h, c = {results: [], more: !1}, e = a.term;
                        h = function (b, c) {
                            var d;
                            b.is("option") ? a.matcher(e, b.text(), b) && c.push(i.optionToData(b)) : b.is("optgroup") && (d = i.optionToData(b), b.children().each2(function (a, b) {
                                h(b, d.children)
                            }), d.children.length > 0 && c.push(d))
                        }, f = d.children(), this.getPlaceholder() !== b && f.length > 0 && (g = this.getPlaceholderOption(), g && (f = f.not(g))), f.each2(function (a, b) {
                            h(b, c.results)
                        }), a.callback(c)
                    }), c.id = function (a) {
                        return a.id
                    }) : "query"in c || ("ajax"in c ? (h = c.element.data("ajax-url"), h && h.length > 0 && (c.ajax.url = h), c.query = G.call(c.element, c.ajax)) : "data"in c ? c.query = H(c.data) : "tags"in c && (c.query = I(c.tags), c.createSearchChoice === b && (c.createSearchChoice = function (b) {
                        return {id: a.trim(b), text: a.trim(b)}
                    }), c.initSelection === b && (c.initSelection = function (b, d) {
                        var e = [];
                        a(s(b.val(), c.separator, c.transformVal)).each(function () {
                            var b = {id: this, text: this}, d = c.tags;
                            a.isFunction(d) && (d = d()), a(d).each(function () {
                                return r(this.id, b.id) ? (b = this, !1) : void 0
                            }), e.push(b)
                        }), d(e)
                    }))), "function" != typeof c.query)throw"query function not defined for Select2 " + c.element.attr("id");
                if ("top" === c.createSearchChoicePosition)c.createSearchChoicePosition = function (a, b) {
                    a.unshift(b)
                }; else if ("bottom" === c.createSearchChoicePosition)c.createSearchChoicePosition = function (a, b) {
                    a.push(b)
                }; else if ("function" != typeof c.createSearchChoicePosition)throw"invalid createSearchChoicePosition option must be 'top', 'bottom' or a custom function";
                return c
            }, monitorSource: function () {
                var d, c = this.opts.element, e = this;
                c.on("change.select2", this.bind(function () {
                    this.opts.element.data("select2-change-triggered") !== !0 && this.initSelection()
                })), this._sync = this.bind(function () {
                    var a = c.prop("disabled");
                    a === b && (a = !1), this.enable(!a);
                    var d = c.prop("readonly");
                    d === b && (d = !1), this.readonly(d), this.container && (D(this.container, this.opts.element, this.opts.adaptContainerCssClass), this.container.addClass(K(this.opts.containerCssClass, this.opts.element))), this.dropdown && (D(this.dropdown, this.opts.element, this.opts.adaptDropdownCssClass), this.dropdown.addClass(K(this.opts.dropdownCssClass, this.opts.element)))
                }), c.length && c[0].attachEvent && c.each(function () {
                    this.attachEvent("onpropertychange", e._sync)
                }), d = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver, d !== b && (this.propertyObserver && (delete this.propertyObserver, this.propertyObserver = null), this.propertyObserver = new d(function (b) {
                    a.each(b, e._sync)
                }), this.propertyObserver.observe(c.get(0), {attributes: !0, subtree: !1}))
            }, triggerSelect: function (b) {
                var c = a.Event("select2-selecting", {val: this.id(b), object: b, choice: b});
                return this.opts.element.trigger(c), !c.isDefaultPrevented()
            }, triggerChange: function (b) {
                b = b || {}, b = a.extend({}, b, {
                    type: "change",
                    val: this.val()
                }), this.opts.element.data("select2-change-triggered", !0), this.opts.element.trigger(b), this.opts.element.data("select2-change-triggered", !1), this.opts.element.click(), this.opts.blurOnChange && this.opts.element.blur()
            }, isInterfaceEnabled: function () {
                return this.enabledInterface === !0
            }, enableInterface: function () {
                var a = this._enabled && !this._readonly, b = !a;
                return a === this.enabledInterface ? !1 : (this.container.toggleClass("select2-container-disabled", b), this.close(), this.enabledInterface = a, !0)
            }, enable: function (a) {
                a === b && (a = !0), this._enabled !== a && (this._enabled = a, this.opts.element.prop("disabled", !a), this.enableInterface())
            }, disable: function () {
                this.enable(!1)
            }, readonly: function (a) {
                a === b && (a = !1), this._readonly !== a && (this._readonly = a, this.opts.element.prop("readonly", a), this.enableInterface())
            }, opened: function () {
                return this.container ? this.container.hasClass("select2-dropdown-open") : !1
            }, positionDropdown: function () {
                var v, w, x, y, z, b = this.dropdown, c = this.container, d = c.offset(), e = c.outerHeight(!1), f = c.outerWidth(!1), g = b.outerHeight(!1), h = a(window), i = h.width(), k = h.height(), l = h.scrollLeft() + i, m = h.scrollTop() + k, n = d.top + e, o = d.left, p = m >= n + g, q = d.top - g >= h.scrollTop(), r = b.outerWidth(!1), s = function () {
                    return l >= o + r
                }, t = function () {
                    return d.left + l + c.outerWidth(!1) > r
                }, u = b.hasClass("select2-drop-above");
                u ? (w = !0, !q && p && (x = !0, w = !1)) : (w = !1, !p && q && (x = !0, w = !0)), x && (b.hide(), d = this.container.offset(), e = this.container.outerHeight(!1), f = this.container.outerWidth(!1), g = b.outerHeight(!1), l = h.scrollLeft() + i, m = h.scrollTop() + k, n = d.top + e, o = d.left, r = b.outerWidth(!1), b.show(), this.focusSearch()), this.opts.dropdownAutoWidth ? (z = a(".select2-results", b)[0], b.addClass("select2-drop-auto-width"), b.css("width", ""), r = b.outerWidth(!1) + (z.scrollHeight === z.clientHeight ? 0 : j.width), r > f ? f = r : r = f, g = b.outerHeight(!1)) : this.container.removeClass("select2-drop-auto-width"), "static" !== this.body.css("position") && (v = this.body.offset(), n -= v.top, o -= v.left), !s() && t() && (o = d.left + this.container.outerWidth(!1) - r), y = {
                    left: o,
                    width: f
                }, w ? (y.top = d.top - g, y.bottom = "auto", this.container.addClass("select2-drop-above"), b.addClass("select2-drop-above")) : (y.top = n, y.bottom = "auto", this.container.removeClass("select2-drop-above"), b.removeClass("select2-drop-above")), y = a.extend(y, K(this.opts.dropdownCss, this.opts.element)), b.css(y)
            }, shouldOpen: function () {
                var b;
                return this.opened() ? !1 : this._enabled === !1 || this._readonly === !0 ? !1 : (b = a.Event("select2-opening"), this.opts.element.trigger(b), !b.isDefaultPrevented())
            }, clearDropdownAlignmentPreference: function () {
                this.container.removeClass("select2-drop-above"), this.dropdown.removeClass("select2-drop-above")
            }, open: function () {
                return this.shouldOpen() ? (this.opening(), i.on("mousemove.select2Event", function (a) {
                    h.x = a.pageX, h.y = a.pageY
                }), !0) : !1
            }, opening: function () {
                var f, b = this.containerEventName, c = "scroll." + b, d = "resize." + b, e = "orientationchange." + b;
                this.container.addClass("select2-dropdown-open").addClass("select2-container-active"), this.clearDropdownAlignmentPreference(), this.dropdown[0] !== this.body.children().last()[0] && this.dropdown.detach().appendTo(this.body), f = a("#select2-drop-mask"), 0 === f.length && (f = a(document.createElement("div")), f.attr("id", "select2-drop-mask").attr("class", "select2-drop-mask"), f.hide(), f.appendTo(this.body), f.on("mousedown touchstart click", function (b) {
                    n(f);
                    var d, c = a("#select2-drop");
                    c.length > 0 && (d = c.data("select2"), d.opts.selectOnBlur && d.selectHighlighted({noFocus: !0}), d.close(), b.preventDefault(), b.stopPropagation())
                })), this.dropdown.prev()[0] !== f[0] && this.dropdown.before(f), a("#select2-drop").removeAttr("id"), this.dropdown.attr("id", "select2-drop"), f.show(), this.positionDropdown(), this.dropdown.show(), this.positionDropdown(), this.dropdown.addClass("select2-drop-active");
                var g = this;
                this.container.parents().add(window).each(function () {
                    a(this).on(d + " " + c + " " + e, function () {
                        g.opened() && g.positionDropdown()
                    })
                })
            }, close: function () {
                if (this.opened()) {
                    var b = this.containerEventName, c = "scroll." + b, d = "resize." + b, e = "orientationchange." + b;
                    this.container.parents().add(window).each(function () {
                        a(this).off(c).off(d).off(e)
                    }), this.clearDropdownAlignmentPreference(), a("#select2-drop-mask").hide(), this.dropdown.removeAttr("id"), this.dropdown.hide(), this.container.removeClass("select2-dropdown-open").removeClass("select2-container-active"), this.results.empty(), i.off("mousemove.select2Event"), this.clearSearch(), this.search.removeClass("select2-active"), this.opts.element.trigger(a.Event("select2-close"))
                }
            }, externalSearch: function (a) {
                this.open(), this.search.val(a), this.updateResults(!1)
            }, clearSearch: function () {
            }, getMaximumSelectionSize: function () {
                return K(this.opts.maximumSelectionSize, this.opts.element)
            }, ensureHighlightVisible: function () {
                var c, d, e, f, g, h, i, j, b = this.results;
                if (d = this.highlight(), !(0 > d)) {
                    if (0 == d)return b.scrollTop(0), void 0;
                    c = this.findHighlightableChoices().find(".select2-result-label"), e = a(c[d]), j = (e.offset() || {}).top || 0, f = j + e.outerHeight(!0), d === c.length - 1 && (i = b.find("li.select2-more-results"), i.length > 0 && (f = i.offset().top + i.outerHeight(!0))), g = b.offset().top + b.outerHeight(!1), f > g && b.scrollTop(b.scrollTop() + (f - g)), h = j - b.offset().top, 0 > h && "none" != e.css("display") && b.scrollTop(b.scrollTop() + h)
                }
            }, findHighlightableChoices: function () {
                return this.results.find(".select2-result-selectable:not(.select2-disabled):not(.select2-selected)")
            }, moveHighlight: function (b) {
                for (var c = this.findHighlightableChoices(), d = this.highlight(); d > -1 && d < c.length;) {
                    d += b;
                    var e = a(c[d]);
                    if (e.hasClass("select2-result-selectable") && !e.hasClass("select2-disabled") && !e.hasClass("select2-selected")) {
                        this.highlight(d);
                        break
                    }
                }
            }, highlight: function (b) {
                var d, e, c = this.findHighlightableChoices();
                return 0 === arguments.length ? p(c.filter(".select2-highlighted")[0], c.get()) : (b >= c.length && (b = c.length - 1), 0 > b && (b = 0), this.removeHighlight(), d = a(c[b]), d.addClass("select2-highlighted"), this.search.attr("aria-activedescendant", d.find(".select2-result-label").attr("id")), this.ensureHighlightVisible(), this.liveRegion.text(d.text()), e = d.data("select2-data"), e && this.opts.element.trigger({
                    type: "select2-highlight",
                    val: this.id(e),
                    choice: e
                }), void 0)
            }, removeHighlight: function () {
                this.results.find(".select2-highlighted").removeClass("select2-highlighted")
            }, touchMoved: function () {
                this._touchMoved = !0
            }, clearTouchMoved: function () {
                this._touchMoved = !1
            }, countSelectableResults: function () {
                return this.findHighlightableChoices().length
            }, highlightUnderEvent: function (b) {
                var c = a(b.target).closest(".select2-result-selectable");
                if (c.length > 0 && !c.is(".select2-highlighted")) {
                    var d = this.findHighlightableChoices();
                    this.highlight(d.index(c))
                } else 0 == c.length && this.removeHighlight()
            }, loadMoreIfNeeded: function () {
                var c, a = this.results, b = a.find("li.select2-more-results"), d = this.resultsPage + 1, e = this, f = this.search.val(), g = this.context;
                0 !== b.length && (c = b.offset().top - a.offset().top - a.height(), c <= this.opts.loadMorePadding && (b.addClass("select2-active"), this.opts.query({
                    element: this.opts.element,
                    term: f,
                    page: d,
                    context: g,
                    matcher: this.opts.matcher,
                    callback: this.bind(function (c) {
                        e.opened() && (e.opts.populateResults.call(this, a, c.results, {
                            term: f,
                            page: d,
                            context: g
                        }), e.postprocessResults(c, !1, !1), c.more === !0 ? (b.detach().appendTo(a).html(e.opts.escapeMarkup(K(e.opts.formatLoadMore, e.opts.element, d + 1))), window.setTimeout(function () {
                            e.loadMoreIfNeeded()
                        }, 10)) : b.remove(), e.positionDropdown(), e.resultsPage = d, e.context = c.context, this.opts.element.trigger({
                            type: "select2-loaded",
                            items: c
                        }))
                    })
                })))
            }, tokenize: function () {
            }, updateResults: function (c) {
                function m() {
                    d.removeClass("select2-active"), h.positionDropdown(), e.find(".select2-no-results,.select2-selection-limit,.select2-searching").length ? h.liveRegion.text(e.text()) : h.liveRegion.text(h.opts.formatMatches(e.find('.select2-result-selectable:not(".select2-selected")').length))
                }

                function n(a) {
                    e.html(a), m()
                }

                var g, i, l, d = this.search, e = this.results, f = this.opts, h = this, j = d.val(), k = a.data(this.container, "select2-last-term");
                if ((c === !0 || !k || !r(j, k)) && (a.data(this.container, "select2-last-term", j), c === !0 || this.showSearchInput !== !1 && this.opened())) {
                    l = ++this.queryCount;
                    var o = this.getMaximumSelectionSize();
                    if (o >= 1 && (g = this.data(), a.isArray(g) && g.length >= o && J(f.formatSelectionTooBig, "formatSelectionTooBig")))return n("<li class='select2-selection-limit'>" + K(f.formatSelectionTooBig, f.element, o) + "</li>"), void 0;
                    if (d.val().length < f.minimumInputLength)return J(f.formatInputTooShort, "formatInputTooShort") ? n("<li class='select2-no-results'>" + K(f.formatInputTooShort, f.element, d.val(), f.minimumInputLength) + "</li>") : n(""), c && this.showSearch && this.showSearch(!0), void 0;
                    if (f.maximumInputLength && d.val().length > f.maximumInputLength)return J(f.formatInputTooLong, "formatInputTooLong") ? n("<li class='select2-no-results'>" + K(f.formatInputTooLong, f.element, d.val(), f.maximumInputLength) + "</li>") : n(""), void 0;
                    f.formatSearching && 0 === this.findHighlightableChoices().length && n("<li class='select2-searching'>" + K(f.formatSearching, f.element) + "</li>"), d.addClass("select2-active"), this.removeHighlight(), i = this.tokenize(), i != b && null != i && d.val(i), this.resultsPage = 1, f.query({
                        element: f.element,
                        term: d.val(),
                        page: this.resultsPage,
                        context: null,
                        matcher: f.matcher,
                        callback: this.bind(function (g) {
                            var i;
                            if (l == this.queryCount) {
                                if (!this.opened())return this.search.removeClass("select2-active"), void 0;
                                if (g.hasError !== b && J(f.formatAjaxError, "formatAjaxError"))return n("<li class='select2-ajax-error'>" + K(f.formatAjaxError, f.element, g.jqXHR, g.textStatus, g.errorThrown) + "</li>"), void 0;
                                if (this.context = g.context === b ? null : g.context, this.opts.createSearchChoice && "" !== d.val() && (i = this.opts.createSearchChoice.call(h, d.val(), g.results), i !== b && null !== i && h.id(i) !== b && null !== h.id(i) && 0 === a(g.results).filter(function () {
                                        return r(h.id(this), h.id(i))
                                    }).length && this.opts.createSearchChoicePosition(g.results, i)), 0 === g.results.length && J(f.formatNoMatches, "formatNoMatches"))return n("<li class='select2-no-results'>" + K(f.formatNoMatches, f.element, d.val()) + "</li>"), void 0;
                                e.empty(), h.opts.populateResults.call(this, e, g.results, {
                                    term: d.val(),
                                    page: this.resultsPage,
                                    context: null
                                }), g.more === !0 && J(f.formatLoadMore, "formatLoadMore") && (e.append("<li class='select2-more-results'>" + f.escapeMarkup(K(f.formatLoadMore, f.element, this.resultsPage)) + "</li>"), window.setTimeout(function () {
                                    h.loadMoreIfNeeded()
                                }, 10)), this.postprocessResults(g, c), m(), this.opts.element.trigger({
                                    type: "select2-loaded",
                                    items: g
                                })
                            }
                        })
                    })
                }
            }, cancel: function () {
                this.close()
            }, blur: function () {
                this.opts.selectOnBlur && this.selectHighlighted({noFocus: !0}), this.close(), this.container.removeClass("select2-container-active"), this.search[0] === document.activeElement && this.search.blur(), this.clearSearch(), this.selection.find(".select2-search-choice-focus").removeClass("select2-search-choice-focus")
            }, focusSearch: function () {
                y(this.search)
            }, selectHighlighted: function (a) {
                if (this._touchMoved)return this.clearTouchMoved(), void 0;
                var b = this.highlight(), c = this.results.find(".select2-highlighted"), d = c.closest(".select2-result").data("select2-data");
                d ? (this.highlight(b), this.onSelect(d, a)) : a && a.noFocus && this.close()
            }, getPlaceholder: function () {
                var a;
                return this.opts.element.attr("placeholder") || this.opts.element.attr("data-placeholder") || this.opts.element.data("placeholder") || this.opts.placeholder || ((a = this.getPlaceholderOption()) !== b ? a.text() : b)
            }, getPlaceholderOption: function () {
                if (this.select) {
                    var c = this.select.children("option").first();
                    if (this.opts.placeholderOption !== b)return "first" === this.opts.placeholderOption && c || "function" == typeof this.opts.placeholderOption && this.opts.placeholderOption(this.select);
                    if ("" === a.trim(c.text()) && "" === c.val())return c
                }
            }, initContainerWidth: function () {
                function c() {
                    var c, d, e, f, g, h;
                    if ("off" === this.opts.width)return null;
                    if ("element" === this.opts.width)return 0 === this.opts.element.outerWidth(!1) ? "auto" : this.opts.element.outerWidth(!1) + "px";
                    if ("copy" === this.opts.width || "resolve" === this.opts.width) {
                        if (c = this.opts.element.attr("style"), c !== b)for (d = c.split(";"), f = 0, g = d.length; g > f; f += 1)if (h = d[f].replace(/\s/g, ""), e = h.match(/^width:(([-+]?([0-9]*\.)?[0-9]+)(px|em|ex|%|in|cm|mm|pt|pc))/i), null !== e && e.length >= 1)return e[1];
                        return "resolve" === this.opts.width ? (c = this.opts.element.css("width"), c.indexOf("%") > 0 ? c : 0 === this.opts.element.outerWidth(!1) ? "auto" : this.opts.element.outerWidth(!1) + "px") : null
                    }
                    return a.isFunction(this.opts.width) ? this.opts.width() : this.opts.width
                }

                var d = c.call(this);
                null !== d && this.container.css("width", d)
            }
        }), d = O(c, {
            createContainer: function () {
                var b = a(document.createElement("div")).attr({"class": "select2-container"}).html(["<a href='javascript:void(0)' class='select2-choice' tabindex='-1'>", "   <span class='select2-chosen'>&#160;</span><abbr class='select2-search-choice-close'></abbr>", "   <span class='select2-arrow' role='presentation'><b role='presentation'></b></span>", "</a>", "<label for='' class='select2-offscreen'></label>", "<input class='select2-focusser select2-offscreen' type='text' aria-haspopup='true' role='button' />", "<div class='select2-drop select2-display-none'>", "   <div class='select2-search'>", "       <label for='' class='select2-offscreen'></label>", "       <input type='text' autocomplete='off' autocorrect='off' autocapitalize='off' spellcheck='false' class='select2-input' role='combobox' aria-expanded='true'", "       aria-autocomplete='list' />", "   </div>", "   <ul class='select2-results' role='listbox'>", "   </ul>", "</div>"].join(""));
                return b
            }, enableInterface: function () {
                this.parent.enableInterface.apply(this, arguments) && this.focusser.prop("disabled", !this.isInterfaceEnabled())
            }, opening: function () {
                var c, d, e;
                this.opts.minimumResultsForSearch >= 0 && this.showSearch(!0), this.parent.opening.apply(this, arguments), this.showSearchInput !== !1 && this.search.val(this.focusser.val()), this.opts.shouldFocusInput(this) && (this.search.focus(), c = this.search.get(0), c.createTextRange ? (d = c.createTextRange(), d.collapse(!1), d.select()) : c.setSelectionRange && (e = this.search.val().length, c.setSelectionRange(e, e))), "" === this.search.val() && this.nextSearchTerm != b && (this.search.val(this.nextSearchTerm), this.search.select()), this.focusser.prop("disabled", !0).val(""), this.updateResults(!0), this.opts.element.trigger(a.Event("select2-open"))
            }, close: function () {
                this.opened() && (this.parent.close.apply(this, arguments), this.focusser.prop("disabled", !1), this.opts.shouldFocusInput(this) && this.focusser.focus())
            }, focus: function () {
                this.opened() ? this.close() : (this.focusser.prop("disabled", !1), this.opts.shouldFocusInput(this) && this.focusser.focus())
            }, isFocused: function () {
                return this.container.hasClass("select2-container-active")
            }, cancel: function () {
                this.parent.cancel.apply(this, arguments), this.focusser.prop("disabled", !1), this.opts.shouldFocusInput(this) && this.focusser.focus()
            }, destroy: function () {
                a("label[for='" + this.focusser.attr("id") + "']").attr("for", this.opts.element.attr("id")), this.parent.destroy.apply(this, arguments), N.call(this, "selection", "focusser")
            }, initContainer: function () {
                var b, g, c = this.container, d = this.dropdown, e = f();
                this.opts.minimumResultsForSearch < 0 ? this.showSearch(!1) : this.showSearch(!0), this.selection = b = c.find(".select2-choice"), this.focusser = c.find(".select2-focusser"), b.find(".select2-chosen").attr("id", "select2-chosen-" + e), this.focusser.attr("aria-labelledby", "select2-chosen-" + e), this.results.attr("id", "select2-results-" + e), this.search.attr("aria-owns", "select2-results-" + e), this.focusser.attr("id", "s2id_autogen" + e), g = a("label[for='" + this.opts.element.attr("id") + "']"), this.opts.element.focus(this.bind(function () {
                    this.focus()
                })), this.focusser.prev().text(g.text()).attr("for", this.focusser.attr("id"));
                var h = this.opts.element.attr("title");
                this.opts.element.attr("title", h || g.text()), this.focusser.attr("tabindex", this.elementTabIndex), this.search.attr("id", this.focusser.attr("id") + "_search"), this.search.prev().text(a("label[for='" + this.focusser.attr("id") + "']").text()).attr("for", this.search.attr("id")), this.search.on("keydown", this.bind(function (a) {
                    if (this.isInterfaceEnabled() && 229 != a.keyCode) {
                        if (a.which === k.PAGE_UP || a.which === k.PAGE_DOWN)return A(a), void 0;
                        switch (a.which) {
                            case k.UP:
                            case k.DOWN:
                                return this.moveHighlight(a.which === k.UP ? -1 : 1), A(a), void 0;
                            case k.ENTER:
                                return this.selectHighlighted(), A(a), void 0;
                            case k.TAB:
                                return this.selectHighlighted({noFocus: !0}), void 0;
                            case k.ESC:
                                return this.cancel(a), A(a), void 0
                        }
                    }
                })), this.search.on("blur", this.bind(function () {
                    document.activeElement === this.body.get(0) && window.setTimeout(this.bind(function () {
                        this.opened() && this.search.focus()
                    }), 0)
                })), this.focusser.on("keydown", this.bind(function (a) {
                    if (this.isInterfaceEnabled() && a.which !== k.TAB && !k.isControl(a) && !k.isFunctionKey(a) && a.which !== k.ESC) {
                        if (this.opts.openOnEnter === !1 && a.which === k.ENTER)return A(a), void 0;
                        if (a.which == k.DOWN || a.which == k.UP || a.which == k.ENTER && this.opts.openOnEnter) {
                            if (a.altKey || a.ctrlKey || a.shiftKey || a.metaKey)return;
                            return this.open(), A(a), void 0
                        }
                        return a.which == k.DELETE || a.which == k.BACKSPACE ? (this.opts.allowClear && this.clear(), A(a), void 0) : void 0
                    }
                })), u(this.focusser), this.focusser.on("keyup-change input", this.bind(function (a) {
                    if (this.opts.minimumResultsForSearch >= 0) {
                        if (a.stopPropagation(), this.opened())return;
                        this.open()
                    }
                })), b.on("mousedown touchstart", "abbr", this.bind(function (a) {
                    this.isInterfaceEnabled() && (this.clear(), B(a), this.close(), this.selection && this.selection.focus())
                })), b.on("mousedown touchstart", this.bind(function (c) {
                    n(b), this.container.hasClass("select2-container-active") || this.opts.element.trigger(a.Event("select2-focus")), this.opened() ? this.close() : this.isInterfaceEnabled() && this.open(), A(c)
                })), d.on("mousedown touchstart", this.bind(function () {
                    this.opts.shouldFocusInput(this) && this.search.focus()
                })), b.on("focus", this.bind(function (a) {
                    A(a)
                })), this.focusser.on("focus", this.bind(function () {
                    this.container.hasClass("select2-container-active") || this.opts.element.trigger(a.Event("select2-focus")), this.container.addClass("select2-container-active")
                })).on("blur", this.bind(function () {
                    this.opened() || (this.container.removeClass("select2-container-active"), this.opts.element.trigger(a.Event("select2-blur")))
                })), this.search.on("focus", this.bind(function () {
                    this.container.hasClass("select2-container-active") || this.opts.element.trigger(a.Event("select2-focus")), this.container.addClass("select2-container-active")
                })), this.initContainerWidth(), this.opts.element.hide(), this.setPlaceholder()
            }, clear: function (b) {
                var c = this.selection.data("select2-data");
                if (c) {
                    var d = a.Event("select2-clearing");
                    if (this.opts.element.trigger(d), d.isDefaultPrevented())return;
                    var e = this.getPlaceholderOption();
                    this.opts.element.val(e ? e.val() : ""), this.selection.find(".select2-chosen").empty(), this.selection.removeData("select2-data"), this.setPlaceholder(), b !== !1 && (this.opts.element.trigger({
                        type: "select2-removed",
                        val: this.id(c),
                        choice: c
                    }), this.triggerChange({removed: c}))
                }
            }, initSelection: function () {
                if (this.isPlaceholderOptionSelected())this.updateSelection(null), this.close(), this.setPlaceholder(); else {
                    var c = this;
                    this.opts.initSelection.call(null, this.opts.element, function (a) {
                        a !== b && null !== a && (c.updateSelection(a), c.close(), c.setPlaceholder(), c.nextSearchTerm = c.opts.nextSearchTerm(a, c.search.val()))
                    })
                }
            }, isPlaceholderOptionSelected: function () {
                var a;
                return this.getPlaceholder() === b ? !1 : (a = this.getPlaceholderOption()) !== b && a.prop("selected") || "" === this.opts.element.val() || this.opts.element.val() === b || null === this.opts.element.val()
            }, prepareOpts: function () {
                var b = this.parent.prepareOpts.apply(this, arguments), c = this;
                return "select" === b.element.get(0).tagName.toLowerCase() ? b.initSelection = function (a, b) {
                    var d = a.find("option").filter(function () {
                        return this.selected && !this.disabled
                    });
                    b(c.optionToData(d))
                } : "data"in b && (b.initSelection = b.initSelection || function (c, d) {
                        var e = c.val(), f = null;
                        b.query({
                            matcher: function (a, c, d) {
                                var g = r(e, b.id(d));
                                return g && (f = d), g
                            }, callback: a.isFunction(d) ? function () {
                                d(f)
                            } : a.noop
                        })
                    }), b
            }, getPlaceholder: function () {
                return this.select && this.getPlaceholderOption() === b ? b : this.parent.getPlaceholder.apply(this, arguments)
            }, setPlaceholder: function () {
                var a = this.getPlaceholder();
                if (this.isPlaceholderOptionSelected() && a !== b) {
                    if (this.select && this.getPlaceholderOption() === b)return;
                    this.selection.find(".select2-chosen").html(this.opts.escapeMarkup(a)), this.selection.addClass("select2-default"), this.container.removeClass("select2-allowclear")
                }
            }, postprocessResults: function (a, b, c) {
                var d = 0, e = this;
                if (this.findHighlightableChoices().each2(function (a, b) {
                        return r(e.id(b.data("select2-data")), e.opts.element.val()) ? (d = a, !1) : void 0
                    }), c !== !1 && (b === !0 && d >= 0 ? this.highlight(d) : this.highlight(0)), b === !0) {
                    var g = this.opts.minimumResultsForSearch;
                    g >= 0 && this.showSearch(L(a.results) >= g)
                }
            }, showSearch: function (b) {
                this.showSearchInput !== b && (this.showSearchInput = b, this.dropdown.find(".select2-search").toggleClass("select2-search-hidden", !b), this.dropdown.find(".select2-search").toggleClass("select2-offscreen", !b), a(this.dropdown, this.container).toggleClass("select2-with-searchbox", b))
            }, onSelect: function (a, b) {
                if (this.triggerSelect(a)) {
                    var c = this.opts.element.val(), d = this.data();
                    this.opts.element.val(this.id(a)), this.updateSelection(a), this.opts.element.trigger({
                        type: "select2-selected",
                        val: this.id(a),
                        choice: a
                    }), this.nextSearchTerm = this.opts.nextSearchTerm(a, this.search.val()), this.close(), b && b.noFocus || !this.opts.shouldFocusInput(this) || this.focusser.focus(), r(c, this.id(a)) || this.triggerChange({
                        added: a,
                        removed: d
                    })
                }
            }, updateSelection: function (a) {
                var d, e, c = this.selection.find(".select2-chosen");
                this.selection.data("select2-data", a), c.empty(), null !== a && (d = this.opts.formatSelection(a, c, this.opts.escapeMarkup)), d !== b && c.append(d), e = this.opts.formatSelectionCssClass(a, c), e !== b && c.addClass(e), this.selection.removeClass("select2-default"), this.opts.allowClear && this.getPlaceholder() !== b && this.container.addClass("select2-allowclear")
            }, val: function () {
                var a, c = !1, d = null, e = this, f = this.data();
                if (0 === arguments.length)return this.opts.element.val();
                if (a = arguments[0], arguments.length > 1 && (c = arguments[1]), this.select)this.select.val(a).find("option").filter(function () {
                    return this.selected
                }).each2(function (a, b) {
                    return d = e.optionToData(b), !1
                }), this.updateSelection(d), this.setPlaceholder(), c && this.triggerChange({
                    added: d,
                    removed: f
                }); else {
                    if (!a && 0 !== a)return this.clear(c), void 0;
                    if (this.opts.initSelection === b)throw new Error("cannot call val() if initSelection() is not defined");
                    this.opts.element.val(a), this.opts.initSelection(this.opts.element, function (a) {
                        e.opts.element.val(a ? e.id(a) : ""), e.updateSelection(a), e.setPlaceholder(), c && e.triggerChange({
                            added: a,
                            removed: f
                        })
                    })
                }
            }, clearSearch: function () {
                this.search.val(""), this.focusser.val("")
            }, data: function (a) {
                var c, d = !1;
                return 0 === arguments.length ? (c = this.selection.data("select2-data"), c == b && (c = null), c) : (arguments.length > 1 && (d = arguments[1]), a ? (c = this.data(), this.opts.element.val(a ? this.id(a) : ""), this.updateSelection(a), d && this.triggerChange({
                    added: a,
                    removed: c
                })) : this.clear(d), void 0)
            }
        }), e = O(c, {
            createContainer: function () {
                var b = a(document.createElement("div")).attr({"class": "select2-container select2-container-multi"}).html(["<ul class='select2-choices'>", "  <li class='select2-search-field'>", "    <label for='' class='select2-offscreen'></label>", "    <input type='text' autocomplete='off' autocorrect='off' autocapitalize='off' spellcheck='false' class='select2-input'>", "  </li>", "</ul>", "<div class='select2-drop select2-drop-multi select2-display-none'>", "   <ul class='select2-results'>", "   </ul>", "</div>"].join(""));
                return b
            }, prepareOpts: function () {
                var b = this.parent.prepareOpts.apply(this, arguments), c = this;
                return "select" === b.element.get(0).tagName.toLowerCase() ? b.initSelection = function (a, b) {
                    var d = [];
                    a.find("option").filter(function () {
                        return this.selected && !this.disabled
                    }).each2(function (a, b) {
                        d.push(c.optionToData(b))
                    }), b(d)
                } : "data"in b && (b.initSelection = b.initSelection || function (c, d) {
                        var e = s(c.val(), b.separator, b.transformVal), f = [];
                        b.query({
                            matcher: function (c, d, g) {
                                var h = a.grep(e, function (a) {
                                    return r(a, b.id(g))
                                }).length;
                                return h && f.push(g), h
                            }, callback: a.isFunction(d) ? function () {
                                for (var a = [], c = 0; c < e.length; c++)for (var g = e[c], h = 0; h < f.length; h++) {
                                    var i = f[h];
                                    if (r(g, b.id(i))) {
                                        a.push(i), f.splice(h, 1);
                                        break
                                    }
                                }
                                d(a)
                            } : a.noop
                        })
                    }), b
            }, selectChoice: function (a) {
                var b = this.container.find(".select2-search-choice-focus");
                b.length && a && a[0] == b[0] || (b.length && this.opts.element.trigger("choice-deselected", b), b.removeClass("select2-search-choice-focus"), a && a.length && (this.close(), a.addClass("select2-search-choice-focus"), this.opts.element.trigger("choice-selected", a)))
            }, destroy: function () {
                a("label[for='" + this.search.attr("id") + "']").attr("for", this.opts.element.attr("id")), this.parent.destroy.apply(this, arguments), N.call(this, "searchContainer", "selection")
            }, initContainer: function () {
                var c, b = ".select2-choices";
                this.searchContainer = this.container.find(".select2-search-field"), this.selection = c = this.container.find(b);
                var d = this;
                this.selection.on("click", ".select2-container:not(.select2-container-disabled) .select2-search-choice:not(.select2-locked)", function () {
                    d.search[0].focus(), d.selectChoice(a(this))
                }), this.search.attr("id", "s2id_autogen" + f()), this.search.prev().text(a("label[for='" + this.opts.element.attr("id") + "']").text()).attr("for", this.search.attr("id")), this.opts.element.focus(this.bind(function () {
                    this.focus()
                })), this.search.on("input paste", this.bind(function () {
                    this.search.attr("placeholder") && 0 == this.search.val().length || this.isInterfaceEnabled() && (this.opened() || this.open())
                })), this.search.attr("tabindex", this.elementTabIndex), this.keydowns = 0, this.search.on("keydown", this.bind(function (a) {
                    if (this.isInterfaceEnabled()) {
                        ++this.keydowns;
                        var b = c.find(".select2-search-choice-focus"), d = b.prev(".select2-search-choice:not(.select2-locked)"), e = b.next(".select2-search-choice:not(.select2-locked)"), f = z(this.search);
                        if (b.length && (a.which == k.LEFT || a.which == k.RIGHT || a.which == k.BACKSPACE || a.which == k.DELETE || a.which == k.ENTER)) {
                            var g = b;
                            return a.which == k.LEFT && d.length ? g = d : a.which == k.RIGHT ? g = e.length ? e : null : a.which === k.BACKSPACE ? this.unselect(b.first()) && (this.search.width(10), g = d.length ? d : e) : a.which == k.DELETE ? this.unselect(b.first()) && (this.search.width(10), g = e.length ? e : null) : a.which == k.ENTER && (g = null), this.selectChoice(g), A(a), g && g.length || this.open(), void 0
                        }
                        if ((a.which === k.BACKSPACE && 1 == this.keydowns || a.which == k.LEFT) && 0 == f.offset && !f.length)return this.selectChoice(c.find(".select2-search-choice:not(.select2-locked)").last()), A(a), void 0;
                        if (this.selectChoice(null), this.opened())switch (a.which) {
                            case k.UP:
                            case k.DOWN:
                                return this.moveHighlight(a.which === k.UP ? -1 : 1), A(a), void 0;
                            case k.ENTER:
                                return this.selectHighlighted(), A(a), void 0;
                            case k.TAB:
                                return this.selectHighlighted({noFocus: !0}), this.close(), void 0;
                            case k.ESC:
                                return this.cancel(a), A(a), void 0
                        }
                        if (a.which !== k.TAB && !k.isControl(a) && !k.isFunctionKey(a) && a.which !== k.BACKSPACE && a.which !== k.ESC) {
                            if (a.which === k.ENTER) {
                                if (this.opts.openOnEnter === !1)return;
                                if (a.altKey || a.ctrlKey || a.shiftKey || a.metaKey)return
                            }
                            this.open(), (a.which === k.PAGE_UP || a.which === k.PAGE_DOWN) && A(a), a.which === k.ENTER && A(a)
                        }
                    }
                })), this.search.on("keyup", this.bind(function () {
                    this.keydowns = 0, this.resizeSearch()
                })), this.search.on("blur", this.bind(function (b) {
                    this.container.removeClass("select2-container-active"), this.search.removeClass("select2-focused"), this.selectChoice(null), this.opened() || this.clearSearch(), b.stopImmediatePropagation(), this.opts.element.trigger(a.Event("select2-blur"))
                })), this.container.on("click", b, this.bind(function (b) {
                    this.isInterfaceEnabled() && (a(b.target).closest(".select2-search-choice").length > 0 || (this.selectChoice(null), this.clearPlaceholder(), this.container.hasClass("select2-container-active") || this.opts.element.trigger(a.Event("select2-focus")), this.open(), this.focusSearch(), b.preventDefault()))
                })), this.container.on("focus", b, this.bind(function () {
                    this.isInterfaceEnabled() && (this.container.hasClass("select2-container-active") || this.opts.element.trigger(a.Event("select2-focus")), this.container.addClass("select2-container-active"), this.dropdown.addClass("select2-drop-active"), this.clearPlaceholder())
                })), this.initContainerWidth(), this.opts.element.hide(), this.clearSearch()
            }, enableInterface: function () {
                this.parent.enableInterface.apply(this, arguments) && this.search.prop("disabled", !this.isInterfaceEnabled())
            }, initSelection: function () {
                if ("" === this.opts.element.val() && "" === this.opts.element.text() && (this.updateSelection([]), this.close(), this.clearSearch()), this.select || "" !== this.opts.element.val()) {
                    var c = this;
                    this.opts.initSelection.call(null, this.opts.element, function (a) {
                        a !== b && null !== a && (c.updateSelection(a), c.close(), c.clearSearch())
                    })
                }
            }, clearSearch: function () {
                var a = this.getPlaceholder(), c = this.getMaxSearchWidth();
                a !== b && 0 === this.getVal().length && this.search.hasClass("select2-focused") === !1 ? (this.search.val(a).addClass("select2-default"), this.search.width(c > 0 ? c : this.container.css("width"))) : this.search.val("").width(10)
            }, clearPlaceholder: function () {
                this.search.hasClass("select2-default") && this.search.val("").removeClass("select2-default")
            }, opening: function () {
                this.clearPlaceholder(), this.resizeSearch(), this.parent.opening.apply(this, arguments), this.focusSearch(), "" === this.search.val() && this.nextSearchTerm != b && (this.search.val(this.nextSearchTerm), this.search.select()), this.updateResults(!0), this.opts.shouldFocusInput(this) && this.search.focus(), this.opts.element.trigger(a.Event("select2-open"))
            }, close: function () {
                this.opened() && this.parent.close.apply(this, arguments)
            }, focus: function () {
                this.close(), this.search.focus()
            }, isFocused: function () {
                return this.search.hasClass("select2-focused")
            }, updateSelection: function (b) {
                var c = [], d = [], e = this;
                a(b).each(function () {
                    p(e.id(this), c) < 0 && (c.push(e.id(this)), d.push(this))
                }), b = d, this.selection.find(".select2-search-choice").remove(), a(b).each(function () {
                    e.addSelectedChoice(this)
                }), e.postprocessResults()
            }, tokenize: function () {
                var a = this.search.val();
                a = this.opts.tokenizer.call(this, a, this.data(), this.bind(this.onSelect), this.opts), null != a && a != b && (this.search.val(a), a.length > 0 && this.open())
            }, onSelect: function (a, c) {
                this.triggerSelect(a) && "" !== a.text && (this.addSelectedChoice(a), this.opts.element.trigger({
                    type: "selected",
                    val: this.id(a),
                    choice: a
                }), this.nextSearchTerm = this.opts.nextSearchTerm(a, this.search.val()), this.clearSearch(), this.updateResults(), (this.select || !this.opts.closeOnSelect) && this.postprocessResults(a, !1, this.opts.closeOnSelect === !0), this.opts.closeOnSelect ? (this.close(), this.search.width(10)) : this.countSelectableResults() > 0 ? (this.search.width(10), this.resizeSearch(), this.getMaximumSelectionSize() > 0 && this.val().length >= this.getMaximumSelectionSize() ? this.updateResults(!0) : this.nextSearchTerm != b && (this.search.val(this.nextSearchTerm), this.updateResults(), this.search.select()), this.positionDropdown()) : (this.close(), this.search.width(10)), this.triggerChange({added: a}), c && c.noFocus || this.focusSearch())
            }, cancel: function () {
                this.close(), this.focusSearch()
            }, addSelectedChoice: function (c) {
                var j, k, d = !c.locked, e = a("<li class='select2-search-choice'>    <div></div>    <a href='#' class='select2-search-choice-close' tabindex='-1'></a></li>"), f = a("<li class='select2-search-choice select2-locked'><div></div></li>"), g = d ? e : f, h = this.id(c), i = this.getVal();
                j = this.opts.formatSelection(c, g.find("div"), this.opts.escapeMarkup), j != b && g.find("div").replaceWith(a("<div></div>").html(j)), k = this.opts.formatSelectionCssClass(c, g.find("div")), k != b && g.addClass(k), d && g.find(".select2-search-choice-close").on("mousedown", A).on("click dblclick", this.bind(function (b) {
                    this.isInterfaceEnabled() && (this.unselect(a(b.target)), this.selection.find(".select2-search-choice-focus").removeClass("select2-search-choice-focus"), A(b), this.close(), this.focusSearch())
                })).on("focus", this.bind(function () {
                    this.isInterfaceEnabled() && (this.container.addClass("select2-container-active"), this.dropdown.addClass("select2-drop-active"))
                })), g.data("select2-data", c), g.insertBefore(this.searchContainer), i.push(h), this.setVal(i)
            }, unselect: function (b) {
                var d, e, c = this.getVal();
                if (b = b.closest(".select2-search-choice"), 0 === b.length)throw"Invalid argument: " + b + ". Must be .select2-search-choice";
                if (d = b.data("select2-data")) {
                    var f = a.Event("select2-removing");
                    if (f.val = this.id(d), f.choice = d, this.opts.element.trigger(f), f.isDefaultPrevented())return !1;
                    for (; (e = p(this.id(d), c)) >= 0;)c.splice(e, 1), this.setVal(c), this.select && this.postprocessResults();
                    return b.remove(), this.opts.element.trigger({
                        type: "select2-removed",
                        val: this.id(d),
                        choice: d
                    }), this.triggerChange({removed: d}), !0
                }
            }, postprocessResults: function (a, b, c) {
                var d = this.getVal(), e = this.results.find(".select2-result"), f = this.results.find(".select2-result-with-children"), g = this;
                e.each2(function (a, b) {
                    var c = g.id(b.data("select2-data"));
                    p(c, d) >= 0 && (b.addClass("select2-selected"), b.find(".select2-result-selectable").addClass("select2-selected"))
                }), f.each2(function (a, b) {
                    b.is(".select2-result-selectable") || 0 !== b.find(".select2-result-selectable:not(.select2-selected)").length || b.addClass("select2-selected")
                }), -1 == this.highlight() && c !== !1 && this.opts.closeOnSelect === !0 && g.highlight(0), !this.opts.createSearchChoice && !e.filter(".select2-result:not(.select2-selected)").length > 0 && (!a || a && !a.more && 0 === this.results.find(".select2-no-results").length) && J(g.opts.formatNoMatches, "formatNoMatches") && this.results.append("<li class='select2-no-results'>" + K(g.opts.formatNoMatches, g.opts.element, g.search.val()) + "</li>")
            }, getMaxSearchWidth: function () {
                return this.selection.width() - t(this.search)
            }, resizeSearch: function () {
                var a, b, c, d, e, f = t(this.search);
                a = C(this.search) + 10, b = this.search.offset().left, c = this.selection.width(), d = this.selection.offset().left, e = c - (b - d) - f, a > e && (e = c - f), 40 > e && (e = c - f), 0 >= e && (e = a), this.search.width(Math.floor(e))
            }, getVal: function () {
                var a;
                return this.select ? (a = this.select.val(), null === a ? [] : a) : (a = this.opts.element.val(), s(a, this.opts.separator, this.opts.transformVal))
            }, setVal: function (b) {
                var c;
                this.select ? this.select.val(b) : (c = [], a(b).each(function () {
                    p(this, c) < 0 && c.push(this)
                }), this.opts.element.val(0 === c.length ? "" : c.join(this.opts.separator)))
            }, buildChangeDetails: function (a, b) {
                for (var b = b.slice(0), a = a.slice(0), c = 0; c < b.length; c++)for (var d = 0; d < a.length; d++)r(this.opts.id(b[c]), this.opts.id(a[d])) && (b.splice(c, 1), c > 0 && c--, a.splice(d, 1), d--);
                return {added: b, removed: a}
            }, val: function (c, d) {
                var e, f = this;
                if (0 === arguments.length)return this.getVal();
                if (e = this.data(), e.length || (e = []), !c && 0 !== c)return this.opts.element.val(""), this.updateSelection([]), this.clearSearch(), d && this.triggerChange({
                    added: this.data(),
                    removed: e
                }), void 0;
                if (this.setVal(c), this.select)this.opts.initSelection(this.select, this.bind(this.updateSelection)), d && this.triggerChange(this.buildChangeDetails(e, this.data())); else {
                    if (this.opts.initSelection === b)throw new Error("val() cannot be called if initSelection() is not defined");
                    this.opts.initSelection(this.opts.element, function (b) {
                        var c = a.map(b, f.id);
                        f.setVal(c), f.updateSelection(b), f.clearSearch(), d && f.triggerChange(f.buildChangeDetails(e, f.data()))
                    })
                }
                this.clearSearch()
            }, onSortStart: function () {
                if (this.select)throw new Error("Sorting of elements is not supported when attached to <select>. Attach to <input type='hidden'/> instead.");
                this.search.width(0), this.searchContainer.hide()
            }, onSortEnd: function () {
                var b = [], c = this;
                this.searchContainer.show(), this.searchContainer.appendTo(this.searchContainer.parent()), this.resizeSearch(), this.selection.find(".select2-search-choice").each(function () {
                    b.push(c.opts.id(a(this).data("select2-data")))
                }), this.setVal(b), this.triggerChange()
            }, data: function (b, c) {
                var e, f, d = this;
                return 0 === arguments.length ? this.selection.children(".select2-search-choice").map(function () {
                    return a(this).data("select2-data")
                }).get() : (f = this.data(), b || (b = []), e = a.map(b, function (a) {
                    return d.opts.id(a)
                }), this.setVal(e), this.updateSelection(b), this.clearSearch(), c && this.triggerChange(this.buildChangeDetails(f, this.data())), void 0)
            }
        }), a.fn.select2 = function () {
            var d, e, f, g, h, c = Array.prototype.slice.call(arguments, 0), i = ["val", "destroy", "opened", "open", "close", "focus", "isFocused", "container", "dropdown", "onSortStart", "onSortEnd", "enable", "disable", "readonly", "positionDropdown", "data", "search"], j = ["opened", "isFocused", "container", "dropdown"], k = ["val", "data"], l = {search: "externalSearch"};
            return this.each(function () {
                if (0 === c.length || "object" == typeof c[0])d = 0 === c.length ? {} : a.extend({}, c[0]), d.element = a(this), "select" === d.element.get(0).tagName.toLowerCase() ? h = d.element.prop("multiple") : (h = d.multiple || !1, "tags"in d && (d.multiple = h = !0)), e = h ? new window.Select2["class"].multi : new window.Select2["class"].single, e.init(d); else {
                    if ("string" != typeof c[0])throw"Invalid arguments to select2 plugin: " + c;
                    if (p(c[0], i) < 0)throw"Unknown method: " + c[0];
                    if (g = b, e = a(this).data("select2"), e === b)return;
                    if (f = c[0], "container" === f ? g = e.container : "dropdown" === f ? g = e.dropdown : (l[f] && (f = l[f]), g = e[f].apply(e, c.slice(1))), p(c[0], j) >= 0 || p(c[0], k) >= 0 && 1 == c.length)return !1
                }
            }), g === b ? this : g
        }, a.fn.select2.defaults = {
            width: "copy",
            loadMorePadding: 0,
            closeOnSelect: !0,
            openOnEnter: !0,
            containerCss: {},
            dropdownCss: {},
            containerCssClass: "",
            dropdownCssClass: "",
            formatResult: function (a, b, c, d) {
                var e = [];
                return E(this.text(a), c.term, e, d), e.join("")
            },
            transformVal: function (b) {
                return a.trim(b)
            },
            formatSelection: function (a, c, d) {
                return a ? d(this.text(a)) : b
            },
            sortResults: function (a) {
                return a
            },
            formatResultCssClass: function (a) {
                return a.css
            },
            formatSelectionCssClass: function () {
                return b
            },
            minimumResultsForSearch: 0,
            minimumInputLength: 0,
            maximumInputLength: null,
            maximumSelectionSize: 0,
            id: function (a) {
                return a == b ? null : a.id
            },
            text: function (b) {
                return b && this.data && this.data.text ? a.isFunction(this.data.text) ? this.data.text(b) : b[this.data.text] : b.text
            },
            matcher: function (a, b) {
                return o("" + b).toUpperCase().indexOf(o("" + a).toUpperCase()) >= 0
            },
            separator: ",",
            tokenSeparators: [],
            tokenizer: M,
            escapeMarkup: F,
            blurOnChange: !1,
            selectOnBlur: !1,
            adaptContainerCssClass: function (a) {
                return a
            },
            adaptDropdownCssClass: function () {
                return null
            },
            nextSearchTerm: function () {
                return b
            },
            searchInputPlaceholder: "",
            createSearchChoicePosition: "top",
            shouldFocusInput: function (a) {
                var b = "ontouchstart"in window || navigator.msMaxTouchPoints > 0;
                return b ? a.opts.minimumResultsForSearch < 0 ? !1 : !0 : !0
            }
        }, a.fn.select2.locales = [], a.fn.select2.locales.en = {
            formatMatches: function (a) {
                return 1 === a ? "One result is available, press enter to select it." : a + " results are available, use up and down arrow keys to navigate."
            }, formatNoMatches: function () {
                return "No matches found"
            }, formatAjaxError: function () {
                return "Loading failed"
            }, formatInputTooShort: function (a, b) {
                var c = b - a.length;
                return "Please enter " + c + " or more character" + (1 == c ? "" : "s")
            }, formatInputTooLong: function (a, b) {
                var c = a.length - b;
                return "Please delete " + c + " character" + (1 == c ? "" : "s")
            }, formatSelectionTooBig: function (a) {
                return "You can only select " + a + " item" + (1 == a ? "" : "s")
            }, formatLoadMore: function () {
                return "Loading more results\u2026"
            }, formatSearching: function () {
                return "Searching\u2026"
            }
        }, a.extend(a.fn.select2.defaults, a.fn.select2.locales.en), a.fn.select2.ajaxDefaults = {
            transport: a.ajax,
            params: {type: "GET", cache: !1, dataType: "json"}
        }, window.Select2 = {
            query: {ajax: G, local: H, tags: I},
            util: {debounce: w, markMatch: E, escapeMarkup: F, stripDiacritics: o},
            "class": {"abstract": c, single: d, multi: e}
        }
    }
}(jQuery);//stk 控件
/**
 * Select2 Chinese translation
 */
(function ($) {
    "use strict";
    $.fn.select2.locales['zh-CN'] = {
        formatNoMatches: function () {
            return "没有找到匹配项";
        },
        formatInputTooShort: function (input, min) {
            var n = min - input.length;
            return "请再输入" + n + "个字符";
        },
        formatInputTooLong: function (input, max) {
            var n = input.length - max;
            return "请删掉" + n + "个字符";
        },
        formatSelectionTooBig: function (limit) {
            return "你只能选择最多" + limit + "项";
        },
        formatLoadMore: function (pageNumber) {
            return "加载结果中…";
        },
        formatSearching: function () {
            return "搜索中…";
        }
    };

    $.extend($.fn.select2.defaults, $.fn.select2.locales['zh-CN']);
})(jQuery);

(function ($) {
    $.extend($.fn, {
        stk_autocomplete: function (setting) {
            var opt = $.extend({
                clazz: "",
                keyId: "keyid",
                welcomeText: "",
                showId: false,
                maxNum: 100,
                width: 100,
                minChars: 1,
                scrollHeight: 150,
                showOnFocus: false
            }, setting);
            var timeErrorMsg;
            var _this = $(this);
            var _initialValue;
            if (_this.val().length == 0) {
                $("#" + opt.keyId).val("");
                _this.val(opt.welcomeText).css({
                    color: "#999"
                });
            } else if (_this.val() == opt.welcomeText) {
                $("#" + opt.keyId).val("");
                _this.css({
                    color: "#999"
                });
            } else {
                _initialValue = _this.val();
            }
            _this.focus(function () {
                window.clearInterval(timeErrorMsg);
                if (_this.val() == opt.welcomeText) {
                    _this.val("").css({
                        color: "#3e3e3e"
                    });
                }
            }).blur(function () {
                if (_this.val().length == 0) {
                    _this.val(opt.welcomeText).css({
                        color: "#999"
                    });
                }
                timeErrorMsg = window.setTimeout(function () {
                    if ($("#" + opt.keyId).val() && $("#" + opt.keyId).val().length == 0 && _this.val().length > 0 && _this.val() != opt.welcomeText) {
                        _this.addClass("autocomplete_inputerror");
                    } else {
                        _this.removeClass("autocomplete_inputerror");
                    }
                }, 300);
            }).stk_org_autocomplete(opt.clazz, {
                extraParams: opt.extraParams,
                delay: opt.delay,
                max: opt.maxNum,
                minChars: opt.minChars,
                width: opt.width,
                matchContains: false,
                initialValue: typeof _initialValue == "string" ? _initialValue : "",
                showOnFocus: opt.showOnFocus,
                scrollHeight: opt.scrollHeight,
                cacheLength: opt.cacheLength,
                blurAutoMatchDo: function (data, e) {
                    if (data[0].data.id) {
                        $("#" + opt.keyId).val(data[0].data.id);
                    }
                },
                beginChangeDo: function (e) {
                    //				$('#'+opt.keyId).val('');
                    if (e) {
                        e.removeClass("autocomplete_inputerror");
                    }
                },
                formatItem: function (data, i, max) {
                    var _d = [];
                    if (data.id && data.text) {
                        if (opt.showId) {
                            _d.push('<span style="float:left;width:25px;">' + data.id + "</span>");
                        }
                        if (data.textSub) {
                            _d.push('<span style="float:right">' + data.textSub + "</span>");
                            _d.push('<strong style="float:left;">' + data.text + "</strong>");
                        }
                        else {
                            _d.push('<strong style="float:left;width:99%">' + data.text + "</strong>");
                        }
                    }
                    return _d.join("\n");
                },
                formatMatch: function (data, i, max) {
                    return data.matchValue;
                },
                formatResult: function (data) {
                    return data.text;
                }
            }).result(function (event, data, formatted) {
                if (typeof opt.result == "function") {
                    return opt.result(event, data, formatted);
                }
                _this.css({
                    color: "#3e3e3e"
                });
                $("#" + opt.keyId).val(data.id);
                _this.stk_val(data.id);
                _this.val(data.text);
                if (typeof opt.callback == "function") opt.callback(data);
            });
            _this.bind("keyup", function () {
                if (!$.trim(_this.val())) {
                    $("#" + opt.keyId).val("");
                }
            });
        }
    });
    $.fn.extend({
        stk_org_autocomplete: function (clazz, options) {
            options = $.extend({}, $.Autocompleter.defaults, {
                clazz: clazz,
                data: null,
                delay: options.delay == undefined ? $.Autocompleter.defaults.delay : options.delay,
                max: options && !options.scroll ? 10 : 150
            }, options);
            options.highlight = options.highlight || function (value) {
                    return value;
                };
            options.formatMatch = options.formatMatch || options.formatItem;
            return this.each(function () {
                new $.Autocompleter(this, options);
            });
        },
        result: function (handler) {
            return this.bind("result", handler);
        },
        search: function (handler) {
            return this.trigger("search", [handler]);
        },
        flushCache: function () {
            return this.trigger("flushCache");
        },
        setOptions: function (options) {
            return this.trigger("setOptions", [options]);
        },
        unautocomplete: function () {
            return this.trigger("unautocomplete");
        }
    });
    $.Autocompleter = function (input, options) {
        var KEY = {
            UP: 38,
            DOWN: 40,
            DEL: 46,
            TAB: 9,
            RETURN: 13,
            ESC: 27,
            COMMA: 188,
            PAGEUP: 33,
            PAGEDOWN: 34,
            BACKSPACE: 8
        };
        // Create $ object for input element
        var $input = $(input).attr("autocomplete", "off").addClass(options.inputClass);
        var timeout;
        var previousValue = options.initialValue;
        var cache = $.Autocompleter.Cache(options);
        var hasFocus = 0;
        var firstFocus = true;
        var lastKeyPressCode;
        var config = {
            mouseDownOnSelect: false
        };
        var select = $.Autocompleter.Select(options, input, selectCurrent, config);
        var blockSubmit;
        var cacheLastData;
        //缓存上一次匹配数据,用来解决input  blur时方法
        // prevent form submit in opera when selecting with return key
        $(input.form).on("submit.autocomplete", function () {
            if (blockSubmit) {
                blockSubmit = false;
                return false;
            }
        });
        // only opera doesn't trigger keydown multiple times while pressed, others don't work with keypress at all
        $input.on("keydown" + ".autocomplete", function (event) {
            // track last key pressed
            lastKeyPressCode = event.keyCode;
            switch (event.keyCode) {
                case KEY.UP:
                    event.preventDefault();
                    if (select.visible()) {
                        select.prev();
                    } else {
                        onChange(0, true);
                    }
                    break;

                case KEY.DOWN:
                    event.preventDefault();
                    if (select.visible()) {
                        select.next();
                    } else {
                        onChange(0, true);
                    }
                    break;

                case KEY.PAGEUP:
                    event.preventDefault();
                    if (select.visible()) {
                        select.pageUp();
                    } else {
                        onChange(0, true);
                    }
                    break;

                case KEY.PAGEDOWN:
                    event.preventDefault();
                    if (select.visible()) {
                        select.pageDown();
                    } else {
                        onChange(0, true);
                    }
                    break;

                // matches also semicolon
                case options.multiple && $.trim(options.multipleSeparator) == "," && KEY.COMMA:
                case KEY.TAB:
                case KEY.RETURN:
                    if (selectCurrent()) {
                        // stop default to prevent a form submit, Opera needs special handling
                        event.preventDefault();
                        blockSubmit = true;
                        return false;
                    }
                    break;

                case KEY.ESC:
                    select.hide();
                    break;

                default:
                    // @hack:support for inputing chinese characters in firefox
                    clearTimeout(timeout);
                    timeout = setTimeout(onChange, options.delay);
                    break;
            }
        }).focus(function () {
            // track whether the field has focus, we shouldn't process any
            // results if the field no longer has focus
            if (options.showOnFocus && firstFocus) {
                onChange(0, true);
                firstFocus = false;
            }
            hasFocus++;
        }).blur(function () {
            hasFocus = 0;
            firstFocus = true;
            if (!config.mouseDownOnSelect) {
                hideResults();
            }
            if (typeof options.blurAutoMatchDo == "function") {
                if (cacheLastData && cacheLastData.length == 1 && cacheLastData[0].result == trimWords($input.val())) {
                    options.blurAutoMatchDo(cacheLastData, $input);
                }
            }
        }).click(function () {
            // show select when clicking in a focused field
            if (hasFocus++ > 1 && !select.visible()) {
                onChange(0, true);
            }
        }).on("search", function () {
            // TODO why not just specifying both arguments?
            var fn = arguments.length > 1 ? arguments[1] : null;

            function findValueCallback(q, data) {
                var result;
                if (data && data.length) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].result.toLowerCase() == q.toLowerCase()) {
                            result = data[i];
                            break;
                        }
                    }
                }
                if (typeof fn == "function") fn(result); else $input.trigger("result", result && [result.data, result.value]);
            }

            $.each(trimWords($input.val()), function (i, value) {
                request(value, findValueCallback, findValueCallback);
            });
        }).on("flushCache", function () {
            cache.flush();
        }).on("setOptions", function () {
            $.extend(options, arguments[1]);
            // if we've updated the data, repopulate
            if ("data" in arguments[1]) cache.populate();
        }).on("unautocomplete", function () {
            select.unbind();
            $input.unbind();
            $(input.form).unbind(".autocomplete");
        }).on("input", function () {
            // @hack:support for inputing chinese characters in firefox
            clearTimeout(timeout);
            timeout = setTimeout(onChange, options.delay);
        });
        function selectCurrent() {
            var selected = select.selected();
            if (!selected) return false;
            var v = selected.text;
            previousValue = v;
            if (options.multiple) {
                var words = trimWords($input.val());
                if (words.length > 1) {
                    v = words.slice(0, words.length - 1).join(options.multipleSeparator) + options.multipleSeparator + v;
                }
                v += options.multipleSeparator;
            }
            $input.val(v);
            hideResultsNow();
            $input.trigger("result", [selected]);
            return true;
        }

        function onChange(crap, skipPrevCheck) {
            if (lastKeyPressCode == KEY.DEL) {
                select.hide();
            }
            var currentValue = $input.val();
            if (!skipPrevCheck && currentValue == previousValue) return;
            if (options.beginChangeDo && currentValue != previousValue) {
                options.beginChangeDo($input);
            }
            previousValue = currentValue;
            currentValue = lastWord(currentValue);
            if (currentValue.length >= options.minChars || currentValue.length == 0 && options.showOnFocus) {
                $input.addClass(options.loadingClass);
                if (!options.matchCase) currentValue = currentValue.toLowerCase();
                request(currentValue, receiveData, hideResultsNow);
            } else {
                stopLoading();
                select.hide();
            }
        }

        function trimWords(value) {
            if (!value) {
                return [""];
            }
            var words = value.split(options.multipleSeparator);
            var result = [];
            $.each(words, function (i, value) {
                if ($.trim(value)) result[i] = $.trim(value);
            });
            return result;
        }

        function lastWord(value) {
            if (!options.multiple) return value;
            var words = trimWords(value);
            return words[words.length - 1];
        }

        // fills in the input box w/the first match (assumed to be the best match)
        // q: the term entered
        // sValue: the first matching result
        function autoFill(q, sValue) {
            // autofill in the complete box w/the first match as long as the user hasn't entered in more data
            // if the last user key pressed was backspace, don't autofill
            if (options.autoFill && lastWord($input.val()).toLowerCase() == q.toLowerCase() && lastKeyPressCode != KEY.BACKSPACE) {
                // fill in the value (keep the case the user has typed)
                $input.val($input.val() + sValue.substring(lastWord(previousValue).length));
                // select the portion of the value not typed by the user (so the next character will erase)
                $.Autocompleter.Selection(input, previousValue.length, previousValue.length + sValue.length);
            }
        }

        function hideResults() {
            clearTimeout(timeout);
            timeout = setTimeout(hideResultsNow, 200);
        }

        function hideResultsNow() {
            var wasVisible = select.visible();
            select.hide();
            clearTimeout(timeout);
            stopLoading();
            if (options.mustMatch) {
                // call search and run callback
                $input.search(function (result) {
                    // if no value found, clear the input box
                    if (!result) {
                        if (options.multiple) {
                            var words = trimWords($input.val()).slice(0, -1);
                            $input.val(words.join(options.multipleSeparator) + (words.length ? options.multipleSeparator : ""));
                        } else $input.val("");
                    }
                });
            }
            if (wasVisible) {
                firstFocus = false;
                // position cursor at end of input field
                $.Autocompleter.Selection(input, input.value.length, input.value.length);
            } else {
                firstFocus = true;
            }
        }

        function receiveData(q, data) {
            if (data && data.length && (hasFocus || options.showOnFocus && firstFocus)) {
                stopLoading();
                select.display(data, q);
                autoFill(q, data[0].value);
                select.show();
            } else {
                hideResultsNow();
            }
        }

        function request(term, success, failure) {
            if (!options.matchCase) term = term.toLowerCase();
            var data = cache.load(term);
            // recieve the cached data
            if (data && data.length) {
                cacheLastData = data;
                success(term, data);
            } else if (StringUtils.isNotBlank(options.clazz)) {
                var param = {};
                if (typeof options.extraParams == "function") param = options.extraParams();
                SpiritAutoCompleteAction.call(term, options, param, {
                    callback: function (data) {
                        cacheLastData = data;
                        cache.add(term, data);
                        success(term, data);
                    },
                    exceptionHandler: function (msg) {
                        stk.alert("error：" + msg);
                        failure(term);
                    }
                });
            } else {
                // if we have a failure, we need to empty the list -- this prevents the the [TAB] key from selecting the last successful match
                select.emptyList();
                failure(term);
            }
        }

        function parse(data) {
            var parsed = [];
            var rows = data;
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                if (row) {
                    parsed[parsed.length] = {
                        data: row,
                        value: row.matchValue,
                        result: options.formatResult && options.formatResult(row, row[0]) || row[0]
                    };
                }
            }
            return parsed;
        }

        function stopLoading() {
            $input.removeClass(options.loadingClass);
        }
    };
    $.Autocompleter.defaults = {
        inputClass: "autocomplete_input",
        resultsClass: "autocomplete_style1",
        loadingClass: "autocomplete_loading",
        minChars: 1,
        delay: 50,
        initialValue: "",
        matchCase: false,
        matchSubset: true,
        matchContains: false,
        cacheLength: 30,
        max: 100,
        dataType: "json",
        mustMatch: false,
        selectFirst: true,
        formatItem: function (row) {
            return row[0];
        },
        formatMatch: null,
        autoFill: false,
        width: 0,
        multiple: false,
        multipleSeparator: ", ",
        blurAutoMatchDo: null,
        //当今有一条结果并且输入内容与待展现内容相同,是否进行的操作
        showOnFocus: false,
        //focus触发
        highlight: function (value, term) {
            return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<font>$1</font>");
        },
        scroll: true,
        scrollHeight: 180
    };
    $.Autocompleter.Cache = function (options) {
        var data = {};
        var empty;
        var length = 0;

        function matchSubset(s, sub) {
            if (!s) {
                return false;
            }
            if (!options.matchCase) s = s.toLowerCase();
            var i = s.indexOf(sub);
            if (options.matchContains == "word") {
                i = s.toLowerCase().search("\\b" + sub.toLowerCase());
            }
            if (i == -1) return false;
            return i == 0 || options.matchContains;
        }

        function add(q, value) {
            if (length > options.cacheLength) {
                flush();
            }
            if (!q) {
                empty = value;
                return;
            }
            if (!data[q]) {
                length++;
            }
            data[q] = value;
        }

        function populate() {
            if (!options.data) return false;
            // track the matches
            var stMatchSets = {}, nullData = 0;
            // no url was specified, we need to adjust the cache length to make sure it fits the local data store
            if (!options.url) options.cacheLength = 1;
            // track all options for minChars = 0
            stMatchSets[""] = [];
            // loop through the array and create a lookup structure
            for (var i = 0, ol = options.data.length; i < ol; i++) {
                var rawValue = options.data[i];
                // if rawValue is a string, make an array otherwise just reference the array
                rawValue = typeof rawValue == "string" ? [rawValue] : rawValue;
                var value = options.formatMatch(rawValue, i + 1, options.data.length);
                if (value === false) continue;
                var firstChar = value.charAt(0).toLowerCase();
                // if no lookup array for this character exists, look it up now
                if (!stMatchSets[firstChar]) stMatchSets[firstChar] = [];
                // if the match is a string
                var row = {
                    value: value,
                    data: rawValue,
                    result: options.formatResult && options.formatResult(rawValue) || value
                };
                // push the current match into the set list
                stMatchSets[firstChar].push(row);
                // keep track of minChars zero items
                if (nullData++ < options.max) {
                    stMatchSets[""].push(row);
                }
            }
            // add the data items to the cache
            $.each(stMatchSets, function (i, value) {
                // increase the cache size
                options.cacheLength++;
                // add to the cache
                add(i, value);
            });
        }

        // populate any existing data
        setTimeout(populate, 25);
        function flush() {
            data = {};
            empty = undefined;
            length = 0;
        }

        return {
            flush: flush,
            add: add,
            populate: populate,
            load: function (q) {
                if (!q) {
                    return empty;
                }
                if (!options.cacheLength || !length) return null;
                /*
                 * if dealing w/local data and matchContains than we must make sure
                 * to loop through all the data collections looking for matches
                 */
                if (!options.url && options.matchContains) {
                    // track all matches
                    var csub = [];
                    // loop through all the data grids for matches
                    for (var k in data) {
                        // don't search through the stMatchSets[""] (minChars: 0) cache
                        // this prevents duplicates
                        if (k.length > 0) {
                            var c = data[k];
                            $.each(c, function (i, x) {
                                // if we've got a match, add it to the array
                                if (matchSubset(x.value, q)) {
                                    csub.push(x);
                                }
                            });
                        }
                    }
                    return csub;
                } else // if the exact item exists, use it
                if (data[q]) {
                    return data[q];
                } else if (options.matchSubset) {
                    for (var i = q.length - 1; i >= options.minChars; i--) {
                        var c = data[q.substr(0, i)];
                        if (c) {
                            var csub = [];
                            $.each(c, function (i, x) {
                                if (matchSubset(x.value, q)) {
                                    csub[csub.length] = x;
                                }
                            });
                            return csub;
                        }
                    }
                }
                return null;
            }
        };
    };
    $.Autocompleter.Select = function (options, input, select, config) {
        var CLASSES = {
            ACTIVE: "autocomplete_over"
        };
        var listItems, active = -1, data, term = "", needsInit = true, element, list;
        // Create results
        function init() {
            if (!needsInit) return;
            element = $("<div/>").hide().addClass(options.resultsClass).css("position", "absolute").appendTo(document.body);
            list = $("<ul/>").appendTo(element).mouseover(function (event) {
                if (target(event).nodeName && target(event).nodeName.toUpperCase() == "LI") {
                    active = $("li", list).removeClass(CLASSES.ACTIVE).index(target(event));
                    $(target(event)).addClass(CLASSES.ACTIVE);
                }
            }).click(function (event) {
                if (!target(event).tagName)return false;
                $(target(event)).addClass(CLASSES.ACTIVE);
                select();
                // TODO provide option to avoid setting focus again after selection? useful for cleanup-on-focus
                try {
                    input.focus();
                } catch (e) {
                }
                return false;
            }).mousedown(function (event) {
                if (target(event).tagName)return;
                config.mouseDownOnSelect = true;
                var listObj = list.get(0);
                if (listObj.setCapture) {
                    listObj.onmousemove = function () {
                        //alert('a');
                        listObj.releaseCapture();
                        config.mouseDownOnSelect = false;
                    };
                    listObj.setCapture();
                }
            }).mouseup(function (event) {
                var listObj = list.get(0);
                if (listObj.releaseCapture) {
                    listObj.releaseCapture();
                    listObj.onmouseup = null;
                    config.mouseDownOnSelect = false;
                }
                config.mouseDownOnSelect = false;
            });
            if (options.width > 0) element.css("width", options.width);
            needsInit = false;
        }

        function target(event) {
            var element = event.target;
            while (element && element.tagName != "LI") element = element.parentNode;
            // more fun with IE, sometimes event.target is empty, just ignore it then
            if (!element) return [];
            return element;
        }

        function moveSelect(step) {
            listItems.slice(active, active + 1).removeClass(CLASSES.ACTIVE);
            movePosition(step);
            var activeItem = listItems.slice(active, active + 1).addClass(CLASSES.ACTIVE);
            if (options.scroll) {
                var offset = 0;
                listItems.slice(0, active).each(function () {
                    offset += this.offsetHeight;
                });
                if (offset + activeItem[0].offsetHeight - list.scrollTop() > list[0].clientHeight) {
                    list.scrollTop(offset + activeItem[0].offsetHeight - list.innerHeight());
                } else if (offset < list.scrollTop()) {
                    list.scrollTop(offset);
                }
            }
        }

        function movePosition(step) {
            active += step;
            if (active < 0) {
                active = listItems.size() - 1;
            } else if (active >= listItems.size()) {
                active = 0;
            }
        }

        function limitNumberOfItems(available) {
            return options.max && options.max < available ? options.max : available;
        }

        function fillList() {
            list.empty();
            var max = limitNumberOfItems(data.length);
            for (var i = 0; i < max; i++) {
                if (!data[i]) continue;
                var formatted = options.formatItem(data[i], i + 1, max, term);
                if (formatted === false) continue;
                var li = $("<li/>").html(options.highlight(formatted, term)).addClass(i % 2 == 0 ? "autocomplete_even" : "autocomplete_odd").appendTo(list)[0];
                var title = data[i].text;
                if (data[i].textSub) title += "-" + data[i].textSub;
                $(li).attr("title", title);
                $.data(li, "ac_data", data[i]);
            }
            listItems = list.find("li");
            if (options.selectFirst) {
                listItems.slice(0, 1).addClass(CLASSES.ACTIVE);
                active = 0;
            }
        }

        return {
            display: function (d, q) {
                init();
                data = d;
                term = q;
                fillList();
            },
            next: function () {
                moveSelect(1);
            },
            prev: function () {
                moveSelect(-1);
            },
            pageUp: function () {
                if (active != 0 && active - 8 < 0) {
                    moveSelect(-active);
                } else {
                    moveSelect(-8);
                }
            },
            pageDown: function () {
                if (active != listItems.size() - 1 && active + 8 > listItems.size()) {
                    moveSelect(listItems.size() - 1 - active);
                } else {
                    moveSelect(8);
                }
            },
            hide: function () {
                element && element.hide();
                listItems && listItems.removeClass(CLASSES.ACTIVE);
                active = -1;
            },
            visible: function () {
                return element && element.is(":visible");
            },
            current: function () {
                return this.visible() && (listItems.filter("." + CLASSES.ACTIVE)[0] || options.selectFirst && listItems[0]);
            },
            show: function () {
                var offset = $(input).offset();
                element.css({
                    width: typeof options.width == "string" || options.width > 0 ? options.width : $(input).width(),
                    top: offset.top + input.offsetHeight,
                    left: offset.left
                }).show();
                if (options.scroll) {
                    list.scrollTop(0);
                    list.css({
                        maxHeight: options.scrollHeight,
                        overflow: "auto"
                    });
                }
            },
            selected: function () {
                var selected = listItems && listItems.filter("." + CLASSES.ACTIVE).removeClass(CLASSES.ACTIVE);
                return selected && selected.length && $.data(selected[0], "ac_data");
            },
            emptyList: function () {
                list && list.empty();
            },
            unbind: function () {
                element && element.remove();
            }
        };
    };
    $.Autocompleter.Selection = function (field, start, end) {
        if (field.createTextRange) {
            var selRange = field.createTextRange();
            selRange.collapse(true);
            selRange.moveStart("character", start);
            selRange.moveEnd("character", end);
            selRange.select();
        } else if (field.setSelectionRange) {
            field.setSelectionRange(start, end);
        } else {
            if (field.selectionStart) {
                field.selectionStart = start;
                field.selectionEnd = end;
            }
        }
        try {
            field.focus();
        } catch (e) {
        }
    };
})(jQuery);

$.extend($.fn, {
    stk_button: function (setting) {
        var _this = this;
        if (_this.length < 1) return this;
        var text = _this.text();
        $(_this).html("");
        var comp = $('#' + _this[0].id + '_wrap');
        $(_this).addClass("stk-button " + (comp.attr('themename') || 'stk-button-st-3'));
        if (StringUtils.isNotBlank($(_this).attr("icon"))) {
            $(_this).append("<span class='stk-button-icon " + $(_this).attr("icon") + "'></span>");
        }
        if (StringUtils.isNotBlank(text)) {
            $(_this).append("<span>" + text + "</span>");
        }
        if ("true" == $(_this).attr("clickToShow")) {
            $(_this).on("click", function () {
            });
        }
        return this;
    }
});

(function ($) {
    //jQuery扩展方法
    $.extend($, {
        //获得屏幕可视高度
        offHeight: function () {
            var bdh = document.body.style.height;
            document.body.style.height = "auto";
            var h = document.documentElement.scrollHeight;
            document.body.style.height = bdh;
            return h;
        },
        stopBubble: function (e) {
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.event.cancelBubble = true;
            }
        },
        stopDefault: function (e) {
            if (e && e.preventDefault) e.preventDefault(); else window.event.returnValue = false;
            return false;
        }
    });
    //jQuery扩展方法
    $.extend($.fn, {
        stktip: function (tipId, time) {
            var tip = $("#" + tipId), timeout = time, me = this, height = me.height();
            if ($(tip).length == 0) alert("未找到帮助信息[" + tipId + "]");
            me.mouseenter(function () {
                tip.stop(true, true);
                clearTimeout(timeout);
                var position = me.offset();
                tip.css({
                    top: position.top + height,
                    left: position.left
                });
                tip.fadeIn(200);
            }).mouseleave(function () {
                tip.stop(true, true);
                setTimeout(function () {
                    tip.fadeOut(150);
                }, time);
            });
        },
        stktabs: function (setting) {
            var opt = $.extend({
                tabWidth: 100
            }, setting);
            var _tabs = $(this);
            var _tabAs = [];
            var _conIds = [];
            var curIndex = 0;
            $(this).css({
                border: "1px solid #e3e3e3",
                padding: "3px"
            });
            //var _aw = $(this).children('.stk-ui-tabs-bar').innerWidth()-15;
            //var _num = $(this).children('.stk-ui-tabs-bar').children('.stk-ui-tabs-item').length;
            //_w = (_num * (opt.tabWidth+5) >= _aw ) ? ((_aw/_num)-5) : opt.tabWidth;
            $(this).children(".stk-ui-tabs-bar").children(".stk-ui-tabs-item").each(function (i) {
                //$(this).width(_w);
                $(this).attr("title", $(this).children("a").text());
                var _h = $(this).children("a").attr("href");
                _tabAs.push($(this).children("a"));
                _conIds.push(_h);
                if (i == curIndex) {
                    $(this).children("a").addClass("stk-select");
                    if ($(_h)) $(_h).show();
                }
                $(this).children("a").click(function (event) {
                    $.stopDefault(event);
                    var _curIndex = parseInt(_tabs.data("curIndex")) != Number.NaN ? parseInt(_tabs.data("curIndex")) : curIndex;
                    if (_curIndex == i) {
                        return;
                    }
                    var _id = _conIds[i];
                    if (typeof _id == "string" && /^#.*$/g.test(_id)) {
                        _id = _id.substring(1, _id.length);
                    }
                    _tabAs[_curIndex].removeClass("stk-select");
                    if ($(_conIds[_curIndex])) $(_conIds[_curIndex]).hide();
                    curIndex = i;
                    _tabs.data("curIndex", curIndex);
                    $(this).addClass("stk-select");
                    var _id = _conIds[i];
                    if ($(_conIds[i])) $(_conIds[i]).show();
                    _tabs.trigger("tabsselect", [_id, $(this).html()]);
                    var fixtable = $(_tabs).find("div[cn='tablefix']");
                    $.each(fixtable, function (i, n) {
                        var tableId = $(n).attr("id").replaceAll("_wrap", "");
                        $("#" + tableId).stk_adjust();
                    });
                });
            });
            $(this).data({
                tabAs: _tabAs,
                conIds: _conIds,
                curIndex: curIndex
            });
        },
        stktabsselect: function (index) {
            var _tabs = $(this);
            var _tabAs = $(this).data("tabAs");
            var _conIds = $(this).data("conIds");
            var curIndex = $(this).data("curIndex");
            var _index = 0;
            if (typeof index == "number" && index < _tabAs.length && index >= 0) {
                _index = index;
            } else if (typeof index == "string") {
                index = "#" + index;
                for (var i = 0; i < _conIds.length; i++) {
                    if (index == _conIds[i]) {
                        _index = i;
                    }
                }
            }
            doSelect(_index);
            var _id = _conIds[_index];
            if (typeof _id == "string" && /^#.*$/g.test(_id)) {
                _id = _id.substring(1, _id.length);
            }
            _tabs.trigger("tabsselect", [_id, _tabAs[_index].html()]);
            var fixtable = $(_tabs).find("div[cn='tablefix']");
            $.each(fixtable, function (i, n) {
                var tableId = $(n).attr("id").replaceAll("_wrap", "");
                $("#" + tableId).stk_adjust();
            });
            function doSelect(num) {
                if ($(_conIds[curIndex])) $(_conIds[curIndex]).hide();
                if ($(_conIds[num])) $(_conIds[num]).show();
                _tabAs[curIndex].removeClass("stk-select");
                _tabAs[num].addClass("stk-select");
                _tabs.data("curIndex", num);
            }
        },
        stktabsTitle: function (index, title) {
            var _tabs = $(this);
            var _tabAs = $(this).data("tabAs");
            var _conIds = $(this).data("conIds");
            var curIndex = $(this).data("curIndex");
            var _index;
            if (typeof index == "number" && index < _tabAs.length && index >= 0) {
                _index = index;
            } else if (typeof index == "string") {
                index = "#" + index;
                for (var i = 0; i < _conIds.length; i++) {
                    if (index == _conIds[i]) {
                        _index = i;
                    }
                }
            }
            _tabAs[_index].html(title);
        },
        startsScore: function (setting) {
            if (typeof setting == "boolean") {
                $(this).data("disabled", setting);
                if (setting) {
                    $(this).addClass("stk-starts-ui-disabled");
                } else {
                    $(this).removeClass("stk-starts-ui-disabled");
                }
                return;
            }
            var opt = $.extend({
                name: "starts",
                curStarts: 3,
                maxStarts: 5,
                titles: ["很差", "差", "中", "好", "很好"],
                showTarget: undefined
            }, setting);
            if (typeof opt.maxStarts != "number" || opt.maxStarts <= 0) {
                return;
            }
            if (typeof opt.curStarts != "number" || opt.start > opt.maxStarts) {
                opt.curStarts = opt.maxStarts;
            }
            var _input = $('<input type="hidden" name="' + opt.name + '" value="' + opt.curStarts + '"/>');
            var _this = $(this);
            _this.addClass("stk-starts-ui");
            var _bsArr = [];
            for (var i = 0; i < opt.maxStarts; i++) {
                var _bsItem = $("<b/>").addClass("b-s").appendTo(_this);
                if (opt.titles && opt.titles[i]) {
                    _bsItem.attr("title", opt.titles[i]);
                    if (i == opt.curStarts && opt.showTarget) {
                        opt.showTarget.html(opt.titles[i]);
                    }
                }
                if (i <= opt.curStarts) {
                    _bsItem.addClass("b-sc");
                }
                _bsItem.data("index", i);
                _bsItem.hover(function () {
                    var _disabled = _this.data("disabled");
                    if (_disabled) return;
                    var _cur = parseInt($(this).data("index"));
                    for (var i = 0; i < _bsArr.length; i++) {
                        if (i <= _cur) {
                            _bsArr[i].addClass("b-sc");
                        } else {
                            _bsArr[i].removeClass("b-sc");
                        }
                        if (opt.titles && opt.titles[i] && i == _cur && opt.showTarget) {
                            opt.showTarget.html(opt.titles[i]);
                        }
                    }
                }, function () {
                });
                _bsItem.click(function () {
                    var _disabled = _this.data("disabled");
                    if (_disabled) return;
                    opt.curStarts = parseInt($(this).data("index")) + 1;
                    _input.val(opt.curStarts);
                    if ($(this).attr("title") && opt.showTarget) {
                        opt.showTarget.html($(this).attr("title"));
                    }
                });
                _bsArr.push(_bsItem);
            }
            refreshStartScore();
            _this.append(_input);
            $(this).hover(function () {
            }, function () {
                refreshStartScore();
            });
            function refreshStartScore() {
                for (var i = 0; i < _bsArr.length; i++) {
                    if (i < opt.curStarts) {
                        _bsArr[i].addClass("b-sc");
                    } else {
                        _bsArr[i].removeClass("b-sc");
                    }
                    if (opt.titles && opt.titles[i] && i == opt.curStarts - 1 && opt.showTarget) {
                        opt.showTarget.html(opt.titles[i]);
                    }
                }
            }
        },
        hoverTipBox: function (text, setting) {
            if (typeof text != "string") {
                if (typeof text == "boolean") {
                    $(this).data("enable", false);
                }
                return;
            } else {
                _hoverSetting = $.extend({
                    width: "auto"
                }, setting);
                $(this).data("text", text);
                $(this).data("width", _hoverSetting.width);
                $(this).data("enable", true);
                if (typeof $(this).data("hasBind") != "undefined" && $(this).data("hasBind")) {
                    return;
                }
            }
            var timeout;
            //			= window.setTimeout(function(){
            //				if(_box)_box.remove();
            //			}, 100);
            var _box;
            $(this).data("hasBind", true);
            $(this).hover(function (event) {
                if (_box) _box.remove();
                window.clearTimeout(timeout);
                if (typeof $(this).data("enable") != "undefined" && !$(this).data("enable")) {
                    return;
                }
                var _x = event.pageX;
                var _y = event.pageY;
                var _css = $(this).data("width") === "auto" ? "" : $(this).data("width") + "px";
                _box = $('<div class="stk-alert-tips" style="top:' + (_x + 20) + "px;left:" + (_y - 20) + "px;display:none" + _css + '"><div class="stk-alert-tips-content">' + $(this).data("text") + '</div><b class="stk-alert-tips-arr"></b></div>').appendTo("body");
                _box.show();
            }, function () {
                _box.remove();
            });
            $(this).mouseout(function () {
                timeout = window.setTimeout(function () {
                    if (_box) _box.remove();
                }, 100);
            });
            $(this).mousemove(function (event) {
                if (_box) {
                    var _x = event.pageX;
                    var _y = event.pageY;
                    _box.css({
                        left: _x + 20 + "px",
                        top: _y - 20 + "px"
                    });
                }
            });
        },
        selectMultiple: function (setting) {
            var opt = $.extend({
                selectCfg1: {
                    title: "列1",
                    width: 180
                },
                selectCfg2: {
                    title: "列2",
                    width: 180
                },
                selectHeight: 150,
                data: [],
                selData: []
            }, setting);
            $(this).addClass("stk-select-multiple").css({
                overflow: "hidden"
            });
            var _selBox1 = $("<div/>").addClass("stk-p-1").css({
                width: opt.selectCfg1.width ? opt.selectCfg1.width : 180,
                height: opt.selectHeight
            }).append('<div class="stk-h-1" style="color:#c00;font-weight:bold">' + opt.selectCfg1.title + "</div>").appendTo($(this));
            var _btnBar1 = $("<div/>").addClass("stk-con-but");
            $('<div class="stk-p-2"></div>').css({
                height: opt.selectHeight
            }).append(_btnBar1).appendTo($(this));
            var _selBox2 = $("<div/>").addClass("stk-p-3").css({
                width: opt.selectCfg2.width ? opt.selectCfg2.width : 180,
                height: opt.selectHeight
            }).append('<div class="stk-h-2" style="color:#c00;font-weight:bold">' + opt.selectCfg2.title + "</div>").appendTo($(this));
            var _btnBar2 = $("<div/>").addClass("stk-con-but");
            $('<div class="stk-p-4"></div>').css({
                height: opt.selectHeight
            }).append(_btnBar2).appendTo($(this));
            var _sel1 = $('<select class="stk-ps-1" id="' + (opt.selectCfg1.id ? opt.selectCfg1.id : "") + '" name="' + (opt.selectCfg1.name ? opt.selectCfg1.name : "") + '" multiple="multiple"></select>');
            var _sel2 = $('<select class="stk-ps-2" id="' + (opt.selectCfg2.id ? opt.selectCfg2.id : "") + '" name="' + (opt.selectCfg2.name ? opt.selectCfg2.name : "") + '" multiple="multiple"></select>');
            _sel1.appendTo(_selBox1);
            _sel2.appendTo(_selBox2);
            for (var i = 0; i < opt.data.length; i++) {
                if ($.inArray(opt.data[i].value, opt.selData) < 0) {
                    _sel1.append($('<option value="' + opt.data[i].value + '">' + opt.data[i].name + "</option>"));
                }
            }
            for (var i = 0; i < opt.selData.length; i++) {
                for (var j = 0; j < opt.data.length; j++) {
                    if (opt.selData[i] == opt.data[j].value) _sel2.append($('<option value="' + opt.data[j].value + '">' + opt.data[j].name + "</option>"));
                }
            }
            var _btn1 = $('<a title="全部右移" class="stk-sm-a stk-ui-button stk-abutton-st-1" href="javascript:void(0);"><b class="stk-button-icon ui-icon-arrowthickstop-1-e"></b></a>').appendTo(_btnBar1);
            var _btn2 = $('<a title="右移" class="stk-sm-a stk-ui-button stk-abutton-st-1" href="javascript:void(0);"><b class="stk-button-icon ui-icon-arrowthick-1-e"></b></a>').appendTo(_btnBar1);
            var _btn3 = $('<a title="左移" class="stk-sm-a stk-ui-button stk-abutton-st-1" href="javascript:void(0);"><b class="stk-button-icon ui-icon-arrowthick-1-w"></b></a>').appendTo(_btnBar1);
            var _btn4 = $('<a title="全部左移" class="stk-sm-a stk-ui-button stk-abutton-st-1" href="javascript:void(0);"><b class="stk-button-icon ui-icon-arrowthickstop-1-w"></b></a>').appendTo(_btnBar1);
            var _btn5 = $('<a title="置顶" class="stk-sm-a stk-ui-button stk-abutton-st-1" href="javascript:void(0);"><b class="stk-button-icon ui-icon-arrowthickstop-1-n"></b></a>').appendTo(_btnBar2);
            var _btn6 = $('<a title="上移" class="stk-sm-a stk-ui-button stk-abutton-st-1" href="javascript:void(0);"><b class="stk-button-icon ui-icon-arrowthick-1-n"></b></a>').appendTo(_btnBar2);
            var _btn7 = $('<a title="下移" class="stk-sm-a stk-ui-button stk-abutton-st-1" href="javascript:void(0);"><b class="stk-button-icon ui-icon-arrowthick-1-s"></b></a>').appendTo(_btnBar2);
            var _btn8 = $('<a title="置底" class="stk-sm-a stk-ui-button stk-abutton-st-1" href="javascript:void(0);"><b class="stk-button-icon ui-icon-arrowthickstop-1-s"></b></a>').appendTo(_btnBar2);

            function reverse() {
                var options = _sel2.children("option");
                _sel2.empty();
                $.each(options, function (i, n) {
                    _sel2.prepend(n);
                });
            }

            _sel1.dblclick(function () {
                moveSelect(_sel1, _sel2, false);
            });
            _sel2.dblclick(function () {
                moveSelect(_sel2, _sel1, false);
            });
            _btn1.click(function () {
                moveSelect(_sel1, _sel2, true);
            });
            _btn2.click(function () {
                moveSelect(_sel1, _sel2, false);
            });
            _btn3.click(function () {
                moveSelect(_sel2, _sel1, false);
            });
            _btn4.click(function () {
                moveSelect(_sel2, _sel1, true);
            });
            _btn5.click(function () {
                moveOrder(true, true);
            });
            _btn6.click(function () {
                moveOrder(true, false);
            });
            _btn7.click(function () {
                reverse();
                moveOrder(true, false);
                reverse();
            });
            _btn8.click(function () {
                moveOrder(false, true);
            });
            var moveSelect = function (ori, tar, allFlag) {
                var _fil = "option";
                if (typeof allFlag != "undefiled" && !allFlag) {
                    _fil += ":selected";
                }
                var _items = [];
                ori.children(_fil).each(function () {
                    _items.push('<option value="' + $(this).val() + '">' + $(this).text() + "</option>");
                    $(this).remove();
                });
                tar.append($(_items.join("")));
                if (document.documentMode === 9) {// IE9
                    var _ori = ori.clone(true);
                    var _tar = tar.clone(true);
                    ori.remove();
                    tar.remove();
                    if (_ori.hasClass("stk-ps-1")) {
                        _sel1 = _ori;
                        _sel2 = _tar;
                    } else {
                        _sel2 = _ori;
                        _sel1 = _tar;
                    }
                    _sel1.appendTo(_selBox1);
                    _sel2.appendTo(_selBox2);
                }
            };
            var moveOrder = function (upFlag, allFlag) {
                var _mark;
                _sel2.children("option:selected").each(function (i) {
                    if (upFlag) {
                        if (allFlag) {
                            if (_sel2.children("option:not(:selected):first")) {
                                _sel2.children("option:not(:selected):first").before($(this));
                            }
                        } else {
                            if ($(this).prev("option:not(:selected)")) {
                                $(this).prev("option").before($(this));
                            }
                        }
                    } else {
                        if (allFlag) {
                            if (typeof _mark == "undefined") {
                                if (_sel2.children("option:not(:selected):last")) {
                                    _sel2.children("option:not(:selected):last").after($(this));
                                }
                                _mark = $(this);
                            } else {
                                _mark.after($(this));
                                _mark = $(this);
                            }
                        } else {
                            if ($(this).next("option:not(:selected)")) {
                                $(this).next("option").after($(this));
                            }
                        }
                    }
                });
            };
        },
        tipExtra: function (setting) {
            var opt = $.extend({
                html: "",
                width: "auto",
                baseLine: "left"
            }, setting);
            var tip = $("<div/>").css({
                position: "absolute",
                width: opt.width,
                "z-index": 1e4,
                display: "none",
                border: "1px solid #bfbfbf",
                "background-color": "#fff"
            }).append(opt.html).appendTo("body").show();
            var _x = $(this).offset().left;
            var _y = $(this).offset().top;
            _y = _y + $(this).outerHeight();
            if ("left" != opt.baseLine.toLowerCase()) {
                var _tw = $(this).outerWidth();
                _x = _x + _tw - tip.width();
            } else {
                var self = $(this);
                _x = (self.parents("a.ext.stk-button,div.stk-button.stk-ext-button").offset() || self.offset()).left;
            }
            if (opt.x) _x += opt.x;
            if (opt.y) _y += opt.y;
            tip.css({
                left: _x + "px",
                top: _y + "px"
            });
            $(this).data({
                tip: tip
            });
            return $(this);
        },
        tipExtraCancel: function () {
            var self = $(this);
            var tip = self.data("tip");
            if (tip) {
                tip.remove();
            }
            var cancel = self.data("cancel");
            if (cancel) {
                $(document).unbind("mousedown", cancel);
            }
        },
        tipExtra1: function (setting) {
            var opt = $.extend({
                html: "",
                width: "auto",
                baseLine: "left"
            }, setting);
            var self = $(this);
            opt.html = typeof opt.html == "string" ? $(opt.html) : opt.html;
            opt.html.addClass("deb-bd");
            opt.html = $("<div/>").addClass("stk-disk-extra-box").append(opt.html);
            opt.html.find("a").each(function () {
                var t = $(this);
                t.removeClass().addClass("link");
                var _th = t.html();
                t.html('<span class="mag">' + _th + "</span>");
            });
            self.tipExtra(opt);
            var cancel = function () {
                self.tipExtraCancel();
            };
            self.data("cancel", cancel);
            $(document).one('click', cancel);
        },
        //dialog
        stk_dialog: function (setting) {
            var _bgDiv;
            var opt = $.extend({
                enableBg: true,
                clickBgClose: true,
                bgColor: "#e3e3e3",
                bgOpacity: .5,
                dragBar: null,
                closeButton: null,
                zIndex: 9999,
                topRatio: .2,
                openCallBack: null,
                closeCallBack: null,
                closeRemoveFlag: false
            }, setting);
            var _this = $(this);
            _this.hide();
            // body总高度
            var bodyHeight = $("body").outerHeight(true);
            // body总宽度
            var bodyWidth = $("body").outerWidth(true);
            // 已被卷去的高度
            var scrollTop;
            // 可视区域高度
            var offHeight;
            if (typeof window.pageYOffset != "undefined") {
                scrollTop = window.pageYOffset;
            } else if (typeof document.compatMode != "undefined" && document.compatMode != "BackCompat") {
                scrollTop = document.documentElement.scrollTop;
            } else if (typeof document.body != "undefined") {
                scrollTop = document.body.scrollTop;
            }
            offHeight = window.innerHeight || document.documentElement.clientHeight;
            var bgH = bodyHeight > offHeight ? bodyHeight : offHeight;
            var dialogT = offHeight * opt.topRatio + scrollTop;
            var dialogL = (bodyWidth - _this.width()) / 2;
            dialogL = dialogL > 0 ? dialogL : 0;
            if (opt.enableBg) {
                _bgDiv = $("<div/>").css({
                    "border-width": "0px",
                    margin: "0px",
                    padding: "0px",
                    position: "absolute",
                    top: "0",
                    left: "0",
                    width: bodyWidth + "px",
                    filter: "Alpha(Opacity=" + opt.bgOpacity * 100 + ")",
                    height: bgH + "px",
                    opacity: opt.bgOpacity,
                    "background-color": opt.bgColor,
                    "z-index": opt.zIndex
                });
                _this.data("bg", _bgDiv);
                $("body").append(_bgDiv);
                if (opt.clickBgClose) {
                    _bgDiv.click(function () {
                        hideDiv();
                    });
                }
            }
            _this.css({
                margin: "0px",
                position: "absolute",
                "z-index": opt.zIndex + 1,
                top: dialogT,
                left: dialogL
            }).show();
            if (opt.openCallBack) {
                opt.openCallBack();
            }
            if (opt.dragBar) {
                mouseDrag();
            }
            if (opt.closeButton) {
                opt.closeButton.click(function (e) {
                    hideDiv();
                });
                opt.closeButton.mousedown(function (e) {
                    if (isParent($(this), opt.dragBar)) {
                        stopBubble(e);
                    }
                });
            }
            function isParent(obj, pobj) {
                while (pobj && obj && obj.attr("tagName") && obj.attr("tagName").toUpperCase() != "BODY") {
                    if (obj.get(0) == pobj.get(0)) {
                        return true;
                    }
                    obj = obj.parent();
                }
                return false;
            }

            function stopBubble(e) {
                if (e && e.stopPropagation) {
                    e.stopPropagation();
                } else {
                    window.event.cancelBubble = true;
                }
            }

            function hideDiv() {
                if (_bgDiv) _bgDiv.remove();
                if (_this) {
                    if (opt.closeRemoveFlag) {
                        _this.remove();
                    } else {
                        _this.hide();
                    }
                }
                if (opt.closeCallBack) {
                    opt.closeCallBack(_this);
                }
            }

            function mouseDrag() {
                opt.dragBar.css({
                    cursor: "move",
                    zoom: 1
                });
                var _x, _y;
                var _domW = _this.outerWidth();
                var _domH = _this.outerHeight();
                var _movestop = false;
                opt.dragBar.mousedown(function (event) {
                    _movestop = true;
                    //					_this.css('opacity', '0.5');
                    var offset = _this.offset();
                    _x = event.pageX - offset.left;
                    _y = event.pageY - offset.top;
                });
                $(document).mousemove(function (event) {
                    if (_movestop) {
                        _this.css({
                            left: event.pageX - _x <= 0 ? 0 : event.pageX - _x > bodyWidth - _domW ? bodyWidth - _domW : event.pageX - _x,
                            top: event.pageY - _y <= 0 ? 0 : event.pageY - _y > bgH - _domH ? bgH - _domH : event.pageY - _y
                        });
                    }
                }).mouseup(function (event) {
                    _movestop = false;
                });
            }

            return $(this);
        },
        stk_cancelDialog: function (removeFlag) {
            var _this = $(this).parent().parent();
            if (removeFlag) {
                _this.remove();
            } else {
                _this.hide();
            }
            if (_this.data("bg")) {
                _this.data("bg").remove();
            }
            return $(this);
        },
        //通用上传
        uploadFile: function (setting) {
        },
        //img-loading
        loadingImg: function () {
            $(this).each(function () {
                var img = $(this);
                img.hide();
                var imageReady = new Image();
                imageReady.src = img.attr("src");
                $(imageReady).load(function () {
                    img.show();
                }).each(function () {
                    if (this.complete) $(this).trigger("load");
                });
            });
        },
        //指定模块的内容页面load刷新
        loads: function (url, data, callback) {
            //Constant.ajaxLoading.show();
            $(this).load(url, data, function () {
                if (typeof callback == "function") {
                    callback();
                }
                //Constant.ajaxLoading.hide();
                STKCommon.initMainDiv();
            });
        },
        //自动浮动功能
        autoFloatFixed: function (setting) {
            var opt = $.extend({
                speed: "slow",
                top: false,
                bottom: false,
                beforeSlideDo: null,
                afterSlideDo: null
            }, setting);
            var $this = $(this);
            var _isNumberType = true;
            var _isTop = false;
            $this.css({
                position: "absolute"
            });
            if ((typeof opt.top == "number" || typeof opt.top == "string") && /^[0-9]+%?$/.test(opt.top)) {
                _isTop = true;
                if (/^[0-9]+%$/.test(opt.top)) {
                    _isNumberType = false;
                    opt.top = parseFloat(opt.top.replace("%", ""));
                    $this.css({
                        bottom: "auto",
                        top: opt.top + "%"
                    });
                } else {
                    $this.css({
                        bottom: "auto",
                        top: opt.top + "px"
                    });
                }
            } else if ((typeof opt.bottom == "number" || typeof opt.bottom == "string") && /^[0-9]+%?$/.test(opt.bottom)) {
                if (/^[0-9]+%$/.test(opt.bottom)) {
                    _isNumberType = false;
                    opt.bottom = parseFloat(opt.bottom.replace("%", ""));
                    $this.css({
                        bottom: opt.bottom + "%",
                        top: "auto"
                    });
                } else {
                    $this.css({
                        bottom: opt.bottom + "px",
                        top: "auto"
                    });
                }
            } else {
                return;
            }
            if (opt.speed === 0) {
                $this.css({
                    position: "fixed"
                });
                return;
            }
            var _offHeight = 0;
            var _scrollTop = 0;
            var _value;
            var _toCss;
            $(window).scroll(function () {
                $this.stop(true);
                reDo();
            });
            function reDo() {
                initOffParam();
                if (opt.beforeSlideDo) {
                    opt.beforeSlideDo();
                }
                if (opt.speed === 0) {
                    $this.css(_toCss);
                } else {
                    $this.animate(_toCss, opt.speed, function () {
                        if (opt.afterSlideDo) {
                            opt.afterSlideDo(_scrollTop);
                        }
                    });
                }
            }

            function initOffParam() {
                _offHeight = window.innerHeight || document.documentElement.clientHeight;
                if (typeof window.pageYOffset != "undefined") {
                    _scrollTop = window.pageYOffset;
                } else if (typeof document.compatMode != "undefined" && document.compatMode != "BackCompat") {
                    _scrollTop = document.documentElement.scrollTop;
                } else if (typeof document.body != "undefined") {
                    _scrollTop = document.body.scrollTop;
                }
                if (_isTop) {
                    if (_isNumberType) {
                        _value = _scrollTop + opt.top + "px";
                    } else {
                        _value = _scrollTop + opt.top * _offHeight / 100 + "px";
                    }
                    _toCss = {
                        top: _value
                    };
                } else {
                    if (_isNumberType) {
                        _value = _scrollTop + opt.bottom + "px";
                    } else {
                        _value = _scrollTop + _offHeight - (1 - opt.bottom) * _offHeight / 100 + "px";
                    }
                    _toCss = {
                        bottom: _value
                    };
                }
            }
        }
    });
    if (typeof STK == "undefined") STK = new Object();
    if (typeof STKCash == "undefined") STKCash = new Object();
    var KEY = {
        UP: 38,
        DOWN: 40,
        DEL: 46,
        TAB: 9,
        RETURN: 13,
        ESC: 27,
        COMMA: 188,
        PAGEUP: 33,
        PAGEDOWN: 34,
        BACKSPACE: 8
    };
    $.extend(STK, {
        //固定表头表格
        fixedGrid: function (setting) {
            var me = this, opt = $.extend({
                headTopId: "J_fixedGrid_HT",
                headLeftId: "J_fixedGrid_HL",
                conBoxId: "J_fixedGrid_Con",
                scrollXId: "J_scrollX",
                scrollYId: "J_scrollY",
                hoverCss: "hover",
                clickCss: "click"
            }, setting);
            this.opt = opt;
            var _ht = $("#" + opt.headTopId);
            var _hl = $("#" + opt.headLeftId);
            var _sX = $("#" + opt.scrollXId);
            var _sY = $("#" + opt.scrollYId);
            var _c = $("#" + opt.conBoxId);
            var _cTr = _c.find("tr");
            var _hlTr = _hl.find("tr");
            var _sXp = _sX.parent();
            var tp = _sXp.parent();
            var table = tp.prev().children("table");
            var _tc = tp.children("table");
            var oldCss = table[0].style.width;
            var _cp = _c.parent();
            var isAuotoHeight = _cp[0].style.height === 'auto';
            $(function () {
                _sX.scroll(function () {
                    var _l = $(this).scrollLeft();
                    //var _t = $(this).scrollTop();
                    _ht.css({
                        left: "-" + _l + "px"
                    });
                    _c.css({
                        left: "-" + _l + "px"
                    });
                });
                $(_ht).add(_c).on("mousewheel", function (event) {
                    _sY.scrollTop(_sY.scrollTop() - event.deltaY * event.deltaFactor);
                    return false;
                });
                _sY.scroll(function () {
                    var _t = $(this).scrollTop();
                    _hl.css({
                        top: "-" + _t + "px"
                    });
                    _c.css({
                        top: "-" + _t + "px"
                    });
                });
                var l = _c.find(".stk-fixed-left").scroll(function () {
                    l.scrollTop(0);
                });
                _c.scroll(function () {
                    _c.scrollTop(0);
                });
                $(window).resize(function () {
                    me.fixedGridRefresh();
                });
            });
            this.fixedGridRefresh = function () {
                table.css("width", oldCss);
                var w = table.width() - 17;
                table.width(w);
                _tc.width(w);
                _sX.width(_sXp.width() - 17);
                if (isAuotoHeight) {
                    _cp.css('height', _c.height() + _sXp.height());
                }
                _sY.height(_sY.parent().height() - 17);
                _sY.children(".scrLine").height(_tc.height());
                _sX.children(".scrLine").width(table.width());
                if (!!window.XDomainRequest && !window.navigator.msPointerEnabled) {
                    var xc = _sX.css("zoom", 1.15).find("div").css("zoom", 1.15);
                    var yc = _sY.css("zoom", 1.15).find("div").css("zoom", 1.15);
                    setTimeout(function () {
                        xc.css("zoom", 1);
                        _sX.css("zoom", 1);
                        yc.css("zoom", 1);
                        _sY.css("zoom", 1);
                    }, 10);
                }
                setTimeout(function () {
                    _sY.scroll();
                    _sX.scroll();
                }, 50);
            };
            return this;
        },
        addTableRowCss: function (el, rowObj) {
            var applyCss = function (trs) {
                for (var i in rowObj) {
                    trs.eq(i).css(rowObj[i]);
                }
            };
            var fixedGridCon = $("div.stk-con", el);
            if (fixedGridCon.length > 0) {
                var fixedGridLeftTrs = $("div.stk-hL>table>tbody>tr", el);
                applyCss(fixedGridLeftTrs);
                var fixedGridConTrs = $("table>tbody>tr", fixedGridCon);
                applyCss(fixedGridConTrs);
            } else {
                var trs = $("table.stk-table>tbody>tr", el);
                applyCss(trs);
            }
        },
        init: function () {
            $(document).on("keydown", function (event) {
                switch (event.keyCode) {
                    case KEY.ESC:
                        var _cancelBoxKey;
                        for (var o in STKCash.dialogBoxCash) {
                            if (STKCash.dialogBoxCash[o].css("display") == "none") {
                                continue;
                            }
                            if (typeof _cancelBoxKey == "undefined") {
                                _cancelBoxKey = o;
                                continue;
                            }
                            _cancelBoxKey = parseInt(STKCash.dialogBoxCash[o].css("z-index")) > parseInt(STKCash.dialogBoxCash[_cancelBoxKey].css("z-index")) ? o : _cancelBoxKey;
                        }
                        if (typeof _cancelBoxKey != "undefined") {
                            STK.stk_cancelDialog(_cancelBoxKey);
                        }
                        break;
                }
            }).mousedown(function () {
                if (window.parent && window.parent.STK && window.parent.STK["removeTabsContextMenu"]) window.parent.STK.removeTabsContextMenu();
            });
        },
        go: function (url, summaryTitle, setting) {
            return window.parent.STK.go(url, summaryTitle, $.extend({}, setting, {
                parent: window
            }));
        },
        getTab: function (url, summaryTitle, setting) {
            return window.parent.STK.getTab(url, summaryTitle, setting);
        },
        removeTab: function (url, summaryTitle, setting) {
            return window.parent.STK.removeTab(url, summaryTitle, setting);
        },
        removeSelf: function () {
            window.parent.STK.removeSelf(window);
        },
        getParentTab: function () {
            window.parent.STK.getParentTab(window);
        },
        navigate: function (url, summaryTitle, setting) {
            window.parent.STK.navigate(url, summaryTitle, window, setting);
        },
        test: function () {
            $(window.parent.document).find("iframe").get(0).src = "http://www.baidu.com";
        },
        stk_dialog: function (setting) {
            var opt = $.extend({
                objOrUrl: undefined,
                refreshUrl: false,
                data: {},
                width: "100px",
                contentBoxCss: {
                    height: "auto",
                    overflow: "overflow"
                },
                type: 1,
                title: "请输入标题",
                boxCss: undefined,
                enableBg: true,
                clickBgClose: true,
                bgColor: "#e3e3e3",
                bgOpacity: .5,
                dragBar: null,
                closeButton: null,
                zIndex: 9999,
                topRatio: .2,
                openCallBack: null,
                closeCallBack: undefined
            }, setting);
            if (typeof opt.objOrUrl == "undefined") {
                return;
            }
            if (typeof STKCash.dialogUrlCash == "undefined") {
                STKCash.dialogBoxCash = {};
                STKCash.dialogUrlCash = {};
                STKCash.dialogZIndex = opt.zIndex;
            }
            STKCash.dialogZIndex = STKCash.dialogZIndex + 1;
            var newCon = false;
            var key;
            if (typeof opt.objOrUrl == "string") {
                key = opt.objOrUrl;
            } else {
                if (opt.objOrUrl.data("STKID")) {
                    key = opt.objOrUrl.data("STKID");
                } else {
                    key = new Date().getTime();
                    opt.objOrUrl.data("STKID", key);
                }
            }
            if (typeof STKCash.dialogBoxCash[key] == "undefined") {
                newCon = true;
                var _this;
                var _head;
                var _close;
                var _con;
                _this = $("<div/>").addClass("stk-dialog-st" + opt.type + " J_stk-dialog").hide().appendTo("body");
                _this.css({
                    width: opt.width + "px"
                });
                _head = $("<h1/>").addClass("stk-dialog-st" + opt.type + "-title stk-corner-all").appendTo(_this);
                $("<span/>").appendTo(_head);
                _close = $("<b/>").addClass("stk-dialog-st" + opt.type + "-close stk-corner-all").appendTo(_head);
                _con = $("<div/>").css(opt.contentBoxCss).appendTo(_this);
                STKCash.dialogBoxCash[key] = _this;
                //_dialog.data({close : _close , head : _head});
                //opt.dragBar = _head;STKCash.dialogBoxCash[key].dragBar
                STKCash.dialogBoxCash[key].data({
                    dragBar: _head,
                    closeButton: _close,
                    titleBar: _head.children("span")
                });
            }
            STKCash.dialogBoxCash[key].data("titleBar").html(opt.title);
            var _dargBar = STKCash.dialogBoxCash[key].data("dragBar");
            var _closeButton = STKCash.dialogBoxCash[key].data("closeButton");
            //原dialog部分
            // body总高度
            var bodyHeight = $("body").outerHeight(true);
            // body总宽度
            var bodyWidth = $("body").outerWidth(true);
            // 已被卷去的高度
            var scrollTop;
            // 可视区域高度
            var offHeight;
            if (typeof window.pageYOffset != "undefined") {
                scrollTop = window.pageYOffset;
            } else if (typeof document.compatMode != "undefined" && document.compatMode != "BackCompat") {
                scrollTop = document.documentElement.scrollTop;
            } else if (typeof document.body != "undefined") {
                scrollTop = document.body.scrollTop;
            }
            offHeight = window.innerHeight || document.documentElement.clientHeight;
            var bgH = bodyHeight > offHeight ? bodyHeight : offHeight;
            var dialogT = offHeight * opt.topRatio + scrollTop;
            var dialogL = (bodyWidth - STKCash.dialogBoxCash[key].width()) / 2;
            dialogL = dialogL > 0 ? dialogL : 0;
            if (opt.enableBg) {
                _bgDiv = $("<div/>").css({
                    "border-width": "0px",
                    margin: "0px",
                    padding: "0px",
                    position: "absolute",
                    top: "0",
                    left: "0",
                    width: bodyWidth + "px",
                    filter: "Alpha(Opacity=" + opt.bgOpacity * 100 + ")",
                    height: bgH + "px",
                    opacity: opt.bgOpacity,
                    "background-color": opt.bgColor,
                    "z-index": STKCash.dialogZIndex++
                });
                $("body").append(_bgDiv);
                STKCash.dialogBoxCash[key].data("bg", _bgDiv);
                if (opt.clickBgClose) {
                    _bgDiv.click(function () {
                        hideDiv();
                    });
                }
            }
            var _boxCss = $.extend({
                margin: "0px",
                position: "absolute",
                "z-index": STKCash.dialogZIndex++,
                top: dialogT,
                left: dialogL
            }, opt.boxCss);
            STKCash.dialogBoxCash[key].css(_boxCss).show();
            if (opt.openCallBack) {
                opt.openCallBack();
            }
            if (STKCash.dialogBoxCash[key].data("dragBar")) {
                mouseDrag();
            }
            if (STKCash.dialogBoxCash[key].data("closeButton")) {
                _closeButton.click(function (e) {
                    hideDiv();
                });
                _closeButton.mousedown(function (e) {
                    if (isParent($(this), _dargBar)) {
                        $.stopBubble(e);
                    }
                });
            }
            function isParent(obj, pobj) {
                while (pobj && obj && obj.attr("tagName") && obj.attr("tagName").toUpperCase() != "BODY") {
                    if (obj.get(0) == pobj.get(0)) {
                        return true;
                    }
                    obj = obj.parent();
                }
                return false;
            }

            function hideDiv() {
                if (STKCash.dialogBoxCash[key]) {
                    STKCash.dialogBoxCash[key].trigger("close", STKCash.dialogBoxCash[key]);
                    STKCash.dialogBoxCash[key].hide();
                    if (STKCash.dialogBoxCash[key].data("bg")) {
                        STKCash.dialogBoxCash[key].data("bg").remove();
                    }
                }
                if (opt.closeCallBack) {
                    opt.closeCallBack();
                }
            }

            function mouseDrag() {
                _dargBar.css({
                    cursor: "move",
                    zoom: 1
                });
                var _x, _y;
                var _domW = STKCash.dialogBoxCash[key].outerWidth();
                var _domH = STKCash.dialogBoxCash[key].outerHeight();
                var _movestop = false;
                _dargBar.mousedown(function (event) {
                    _movestop = true;
                    //					STKCash.dialogBoxCash[key].css('opacity', '0.5');
                    var offset = STKCash.dialogBoxCash[key].offset();
                    _x = event.pageX - offset.left;
                    _y = event.pageY - offset.top;
                });
                $(document).mousemove(function (event) {
                    if (_movestop) {
                        STKCash.dialogBoxCash[key].css({
                            left: event.pageX - _x <= 0 ? 0 : event.pageX - _x > bodyWidth - _domW ? bodyWidth - _domW : event.pageX - _x,
                            top: event.pageY - _y <= 0 ? 0 : event.pageY - _y > bgH - _domH ? bgH - _domH : event.pageY - _y
                        });
                    }
                }).mouseup(function (event) {
                    _movestop = false;
                });
            }

            //原dialog部分结束
            if (newCon || typeof opt.objOrUrl == "string" && opt.refreshUrl) {
                if (typeof opt.objOrUrl == "string") {
                    if (opt.refreshUrl || typeof STKCash.dialogUrlCash[opt.objOrUrl] == "undefined") {
                        if (_con.children()) {
                            _con.children().remove();
                        }
                        $.ajax({
                            url: opt.objOrUrl,
                            type: "POST",
                            cache: false,
                            data: opt.data,
                            complete: function (XMLHttpRequest, textStatus) {
                                if (textStatus.toLowerCase() != "success") {
                                    alert("加载信息错误！请重新尝试！");
                                    return;
                                }
                                STKCash.dialogUrlCash[opt.objOrUrl] = $(XMLHttpRequest.responseText);
                                _con.append(STKCash.dialogUrlCash[opt.objOrUrl]);
                            }
                        });
                    } else {
                        _con.append(STKCash.dialogUrlCash[opt.objOrUrl]);
                    }
                } else {
                    opt.objOrUrl.show();
                    _con.append(opt.objOrUrl);
                }
            }
        },
        stk_cancelDialog: function (objOrUrl) {
            var key;
            if (typeof objOrUrl == "string") {
                key = objOrUrl;
            } else {
                if (objOrUrl.data("STKID")) {
                    key = objOrUrl.data("STKID");
                }
            }
            if (STKCash.dialogBoxCash[key]) {
                STKCash.dialogBoxCash[key].trigger("close", STKCash.dialogBoxCash[key]);
                STKCash.dialogBoxCash[key].hide();
                if (STKCash.dialogBoxCash[key].data("bg")) {
                    STKCash.dialogBoxCash[key].data("bg").remove();
                }
            }
        }
    });
    STK.init();
})(jQuery);

(function ($) {
    //jQuery扩展方法
    $.extend($.fn, {
        //img-loading
        loadingImg: function () {
            $(this).each(function () {
                var img = $(this);
                img.hide();
                var imageReady = new Image();
                imageReady.src = img.attr("src");
                $(imageReady).load(function () {
                    img.show();
                }).each(function () {
                    if (this.complete) $(this).trigger("load");
                });
            });
        },
        //指定模块的内容页面load刷新
        loads: function (url, data, callback) {
            //Constant.ajaxLoading.show();
            $(this).load(url, data, function () {
                if (typeof callback == "function") {
                    callback();
                }
                //Constant.ajaxLoading.hide();
                STKCommon.initMainDiv();
            });
        }
    });
    if (typeof STK == "undefined") STK = new Object();
    var STKCommon = new Object();
    var Constant = new Object();
    var CachePageData = new Object();
    Constant.menuUlMark = {};
    //左菜单
    Constant.navigateMap = {};
    //TAB
    $.extend(STKCommon, {
        //初始化
        init: function () {
            //页面布局初始化处理
            $(document).ready(function () {
                STKCommon.initMainDiv();
            });
            STK.resize(STKCommon.initMainDiv);
        },
        loadsWithTimestamp: function (key, setting) {
            var opt = $.extend({}, setting);
            if (Constant.navigateMap["currentNavKey"] && CachePageData[Constant.navigateMap["currentNavKey"]]) {
                CachePageData[Constant.navigateMap["currentNavKey"]].hide();
            }
            if (CachePageData[key]) {
                CachePageData[key].show();
                if (Constant.navigateMap[key].data("url") != opt.url || opt.refresh) {
                    CachePageData[key].get(0).src = opt.url;
                }
            } else {
                CachePageData[key] = $("<iframe/>").css({
                    width: "100%",
                    height: "100%",
                    "overflow-x": "hidden",
                    "overflow-y": "auto",
                    border: "0 none"
                }).attr("scrolling", "yes").attr("frameborder", 0).attr("src", opt.url).appendTo($("#J_common_panel_section"));
            }
            return CachePageData[key];
        },
        //处理布局div高度
        initMainDiv: function () {
            var _headerH = $("#J_common_header").outerHeight();
            var _oh = $.offHeight();
            if (Constant.loadMark) {
                Constant.loadMark.height(_oh);
            } else {
                Constant.loadMark = $('<div style="width:100%;position:absolute;top:0;left:0;z-index:99998;"></div>').append('<div style="width:100%;height:100%; background-color:#fff;opacity:0.5;filter:Alpha(Opacity=50);"></div>').append('<div class="loading-st1" style="position:absolute; width:32px; height:32px; left:50%;top:50%;margin-left:-16px; margin-top:-16px;z-index:99999"></div>').height(_oh).hide().appendTo("body");
            }
            var _h = _oh > _headerH ? _oh - _headerH : 0;
            $("#J_common_section").css("height", _h);
            var _h1 = _h - 27 > 0 ? _h - 27 : 0;
            $("#J_common_panel_section").css("height", _h1);
            _h1 = _h - 25 > 0 ? _h - 25 : 0;
            $("#J_common_sec_aside_nav").css("height", _h1);
            Constant.navigateDisWidth = $("#J_common_section").innerWidth() - 270 > 0 ? $("#J_common_section").innerWidth() - 270 : 0;
        },
        //json数据拼接字符串
        JsonToQueryString: function (data) {
            var ret = [];
            for (var d in data) {
                ret.push(d + "=" + data[d]);
            }
            return ret.join("&");
        }
    });
    $.extend(STK, {
        showMask: function () {
            if (!window["__maskflag"]) window["__maskflag"] = 1; else window["__maskflag"]++;
            //if(Constant.loadMark){
            var _oh = $.offHeight();
            Constant.loadMark.height(_oh);
            //}
            Constant.loadMark.show();
        },
        closeMask: function () {
            if (!window["__maskflag"]) window["__maskflag"] = 1;
            if (window["__maskflag"] > 0) window["__maskflag"]--;
            if (window["__maskflag"] == 0) Constant.loadMark.hide();
        },
        //窗口变化回调函数
        resize: function (fun) {
            if (typeof fun == "function") {
                $(window).resize(function () {
                    fun();
                });
            }
        }
    });
    STKCommon.init();
    //ios
    $(function () {
        if (!navigator.userAgent.match(/iPad|iPhone/i) || window.frameElement) return false;
        $("#J_common_panel_section").css("overflow", "auto");
    });
})(jQuery);