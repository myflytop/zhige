/**
 * Owl Carousel v2.3.4
 * Copyright 2013-2018 David Deutsch
 * Licensed under: SEE LICENSE IN https://github.com/OwlCarousel2/OwlCarousel2/blob/master/LICENSE
 */
!function (a, b, c, d) {
    function e(b, c) {
        this.settings = null, this.options = a.extend({}, e.Defaults, c), this.$element = a(b), this._handlers = {}, this._plugins = {}, this._supress = {}, this._current = null, this._speed = null, this._coordinates = [], this._breakpoint = null, this._width = null, this._items = [], this._clones = [], this._mergers = [], this._widths = [], this._invalidated = {}, this._pipe = [], this._drag = {
            time: null,
            target: null,
            pointer: null,
            stage: {start: null, current: null},
            direction: null
        }, this._states = {
            current: {},
            tags: {initializing: ["busy"], animating: ["busy"], dragging: ["interacting"]}
        }, a.each(["onResize", "onThrottledResize"], a.proxy(function (b, c) {
            this._handlers[c] = a.proxy(this[c], this)
        }, this)), a.each(e.Plugins, a.proxy(function (a, b) {
            this._plugins[a.charAt(0).toLowerCase() + a.slice(1)] = new b(this)
        }, this)), a.each(e.Workers, a.proxy(function (b, c) {
            this._pipe.push({filter: c.filter, run: a.proxy(c.run, this)})
        }, this)), this.setup(), this.initialize()
    }

    e.Defaults = {
        items: 3,
        loop: !1,
        center: !1,
        rewind: !1,
        checkVisibility: !0,
        mouseDrag: !0,
        touchDrag: !0,
        pullDrag: !0,
        freeDrag: !1,
        margin: 0,
        stagePadding: 0,
        merge: !1,
        mergeFit: !0,
        autoWidth: !1,
        startPosition: 0,
        rtl: !1,
        smartSpeed: 250,
        fluidSpeed: !1,
        dragEndSpeed: !1,
        responsive: {},
        responsiveRefreshRate: 200,
        responsiveBaseElement: b,
        fallbackEasing: "swing",
        slideTransition: "",
        info: !1,
        nestedItemSelector: !1,
        itemElement: "div",
        stageElement: "div",
        refreshClass: "owl-refresh",
        loadedClass: "owl-loaded",
        loadingClass: "owl-loading",
        rtlClass: "owl-rtl",
        responsiveClass: "owl-responsive",
        dragClass: "owl-drag",
        itemClass: "owl-item",
        stageClass: "owl-stage",
        stageOuterClass: "owl-stage-outer",
        grabClass: "owl-grab"
    }, e.Width = {Default: "default", Inner: "inner", Outer: "outer"}, e.Type = {
        Event: "event",
        State: "state"
    }, e.Plugins = {}, e.Workers = [{
        filter: ["width", "settings"], run: function () {
            this._width = this.$element.width()
        }
    }, {
        filter: ["width", "items", "settings"], run: function (a) {
            a.current = this._items && this._items[this.relative(this._current)]
        }
    }, {
        filter: ["items", "settings"], run: function () {
            this.$stage.children(".cloned").remove()
        }
    }, {
        filter: ["width", "items", "settings"], run: function (a) {
            var b = this.settings.margin || "", c = !this.settings.autoWidth, d = this.settings.rtl,
                e = {width: "auto", "margin-left": d ? b : "", "margin-right": d ? "" : b};
            !c && this.$stage.children().css(e), a.css = e
        }
    }, {
        filter: ["width", "items", "settings"], run: function (a) {
            var b = (this.width() / this.settings.items).toFixed(3) - this.settings.margin, c = null,
                d = this._items.length, e = !this.settings.autoWidth, f = [];
            for (a.items = {
                merge: !1,
                width: b
            }; d--;) c = this._mergers[d], c = this.settings.mergeFit && Math.min(c, this.settings.items) || c, a.items.merge = c > 1 || a.items.merge, f[d] = e ? b * c : this._items[d].width();
            this._widths = f
        }
    }, {
        filter: ["items", "settings"], run: function () {
            var b = [], c = this._items, d = this.settings, e = Math.max(2 * d.items, 4),
                f = 2 * Math.ceil(c.length / 2), g = d.loop && c.length ? d.rewind ? e : Math.max(e, f) : 0, h = "",
                i = "";
            for (g /= 2; g > 0;) b.push(this.normalize(b.length / 2, !0)), h += c[b[b.length - 1]][0].outerHTML, b.push(this.normalize(c.length - 1 - (b.length - 1) / 2, !0)), i = c[b[b.length - 1]][0].outerHTML + i, g -= 1;
            this._clones = b, a(h).addClass("cloned").appendTo(this.$stage), a(i).addClass("cloned").prependTo(this.$stage)
        }
    }, {
        filter: ["width", "items", "settings"], run: function () {
            for (var a = this.settings.rtl ? 1 : -1, b = this._clones.length + this._items.length, c = -1, d = 0, e = 0, f = []; ++c < b;) d = f[c - 1] || 0, e = this._widths[this.relative(c)] + this.settings.margin, f.push(d + e * a);
            this._coordinates = f
        }
    }, {
        filter: ["width", "items", "settings"], run: function () {
            var a = this.settings.stagePadding, b = this._coordinates, c = {
                width: Math.ceil(Math.abs(b[b.length - 1])) + 2 * a,
                "padding-left": a || "",
                "padding-right": a || ""
            };
            this.$stage.css(c)
        }
    }, {
        filter: ["width", "items", "settings"], run: function (a) {
            var b = this._coordinates.length, c = !this.settings.autoWidth, d = this.$stage.children();
            if (c && a.items.merge) for (; b--;) a.css.width = this._widths[this.relative(b)], d.eq(b).css(a.css); else c && (a.css.width = a.items.width, d.css(a.css))
        }
    }, {
        filter: ["items"], run: function () {
            this._coordinates.length < 1 && this.$stage.removeAttr("style")
        }
    }, {
        filter: ["width", "items", "settings"], run: function (a) {
            a.current = a.current ? this.$stage.children().index(a.current) : 0, a.current = Math.max(this.minimum(), Math.min(this.maximum(), a.current)), this.reset(a.current)
        }
    }, {
        filter: ["position"], run: function () {
            this.animate(this.coordinates(this._current))
        }
    }, {
        filter: ["width", "position", "items", "settings"], run: function () {
            var a, b, c, d, e = this.settings.rtl ? 1 : -1, f = 2 * this.settings.stagePadding,
                g = this.coordinates(this.current()) + f, h = g + this.width() * e, i = [];
            for (c = 0, d = this._coordinates.length; c < d; c++) a = this._coordinates[c - 1] || 0, b = Math.abs(this._coordinates[c]) + f * e, (this.op(a, "<=", g) && this.op(a, ">", h) || this.op(b, "<", g) && this.op(b, ">", h)) && i.push(c);
            this.$stage.children(".active").removeClass("active"), this.$stage.children(":eq(" + i.join("), :eq(") + ")").addClass("active"), this.$stage.children(".center").removeClass("center"), this.settings.center && this.$stage.children().eq(this.current()).addClass("center")
        }
    }], e.prototype.initializeStage = function () {
        this.$stage = this.$element.find("." + this.settings.stageClass), this.$stage.length || (this.$element.addClass(this.options.loadingClass), this.$stage = a("<" + this.settings.stageElement + ">", {class: this.settings.stageClass}).wrap(a("<div/>", {class: this.settings.stageOuterClass})), this.$element.append(this.$stage.parent()))
    }, e.prototype.initializeItems = function () {
        var b = this.$element.find(".owl-item");
        if (b.length) return this._items = b.get().map(function (b) {
            return a(b)
        }), this._mergers = this._items.map(function () {
            return 1
        }), void this.refresh();
        this.replace(this.$element.children().not(this.$stage.parent())), this.isVisible() ? this.refresh() : this.invalidate("width"), this.$element.removeClass(this.options.loadingClass).addClass(this.options.loadedClass)
    }, e.prototype.initialize = function () {
        if (this.enter("initializing"), this.trigger("initialize"), this.$element.toggleClass(this.settings.rtlClass, this.settings.rtl), this.settings.autoWidth && !this.is("pre-loading")) {
            var a, b, c;
            a = this.$element.find("img"), b = this.settings.nestedItemSelector ? "." + this.settings.nestedItemSelector : d, c = this.$element.children(b).width(), a.length && c <= 0 && this.preloadAutoWidthImages(a)
        }
        this.initializeStage(), this.initializeItems(), this.registerEventHandlers(), this.leave("initializing"), this.trigger("initialized")
    }, e.prototype.isVisible = function () {
        return !this.settings.checkVisibility || this.$element.is(":visible")
    }, e.prototype.setup = function () {
        var b = this.viewport(), c = this.options.responsive, d = -1, e = null;
        c ? (a.each(c, function (a) {
            a <= b && a > d && (d = Number(a))
        }), e = a.extend({}, this.options, c[d]), "function" == typeof e.stagePadding && (e.stagePadding = e.stagePadding()), delete e.responsive, e.responsiveClass && this.$element.attr("class", this.$element.attr("class").replace(new RegExp("(" + this.options.responsiveClass + "-)\\S+\\s", "g"), "$1" + d))) : e = a.extend({}, this.options), this.trigger("change", {
            property: {
                name: "settings",
                value: e
            }
        }), this._breakpoint = d, this.settings = e, this.invalidate("settings"), this.trigger("changed", {
            property: {
                name: "settings",
                value: this.settings
            }
        })
    }, e.prototype.optionsLogic = function () {
        this.settings.autoWidth && (this.settings.stagePadding = !1, this.settings.merge = !1)
    }, e.prototype.prepare = function (b) {
        var c = this.trigger("prepare", {content: b});
        return c.data || (c.data = a("<" + this.settings.itemElement + "/>").addClass(this.options.itemClass).append(b)), this.trigger("prepared", {content: c.data}), c.data
    }, e.prototype.update = function () {
        for (var b = 0, c = this._pipe.length, d = a.proxy(function (a) {
            return this[a]
        }, this._invalidated), e = {}; b < c;) (this._invalidated.all || a.grep(this._pipe[b].filter, d).length > 0) && this._pipe[b].run(e), b++;
        this._invalidated = {}, !this.is("valid") && this.enter("valid")
    }, e.prototype.width = function (a) {
        switch (a = a || e.Width.Default) {
            case e.Width.Inner:
            case e.Width.Outer:
                return this._width;
            default:
                return this._width - 2 * this.settings.stagePadding + this.settings.margin
        }
    }, e.prototype.refresh = function () {
        this.enter("refreshing"), this.trigger("refresh"), this.setup(), this.optionsLogic(), this.$element.addClass(this.options.refreshClass), this.update(), this.$element.removeClass(this.options.refreshClass), this.leave("refreshing"), this.trigger("refreshed")
    }, e.prototype.onThrottledResize = function () {
        b.clearTimeout(this.resizeTimer), this.resizeTimer = b.setTimeout(this._handlers.onResize, this.settings.responsiveRefreshRate)
    }, e.prototype.onResize = function () {
        return !!this._items.length && (this._width !== this.$element.width() && (!!this.isVisible() && (this.enter("resizing"), this.trigger("resize").isDefaultPrevented() ? (this.leave("resizing"), !1) : (this.invalidate("width"), this.refresh(), this.leave("resizing"), void this.trigger("resized")))))
    }, e.prototype.registerEventHandlers = function () {
        a.support.transition && this.$stage.on(a.support.transition.end + ".owl.core", a.proxy(this.onTransitionEnd, this)), !1 !== this.settings.responsive && this.on(b, "resize", this._handlers.onThrottledResize), this.settings.mouseDrag && (this.$element.addClass(this.options.dragClass), this.$stage.on("mousedown.owl.core", a.proxy(this.onDragStart, this)), this.$stage.on("dragstart.owl.core selectstart.owl.core", function () {
            return !1
        })), this.settings.touchDrag && (this.$stage.on("touchstart.owl.core", a.proxy(this.onDragStart, this)), this.$stage.on("touchcancel.owl.core", a.proxy(this.onDragEnd, this)))
    }, e.prototype.onDragStart = function (b) {
        var d = null;
        3 !== b.which && (a.support.transform ? (d = this.$stage.css("transform").replace(/.*\(|\)| /g, "").split(","), d = {
            x: d[16 === d.length ? 12 : 4],
            y: d[16 === d.length ? 13 : 5]
        }) : (d = this.$stage.position(), d = {
            x: this.settings.rtl ? d.left + this.$stage.width() - this.width() + this.settings.margin : d.left,
            y: d.top
        }), this.is("animating") && (a.support.transform ? this.animate(d.x) : this.$stage.stop(), this.invalidate("position")), this.$element.toggleClass(this.options.grabClass, "mousedown" === b.type), this.speed(0), this._drag.time = (new Date).getTime(), this._drag.target = a(b.target), this._drag.stage.start = d, this._drag.stage.current = d, this._drag.pointer = this.pointer(b), a(c).on("mouseup.owl.core touchend.owl.core", a.proxy(this.onDragEnd, this)), a(c).one("mousemove.owl.core touchmove.owl.core", a.proxy(function (b) {
            var d = this.difference(this._drag.pointer, this.pointer(b));
            a(c).on("mousemove.owl.core touchmove.owl.core", a.proxy(this.onDragMove, this)), Math.abs(d.x) < Math.abs(d.y) && this.is("valid") || (b.preventDefault(), this.enter("dragging"), this.trigger("drag"))
        }, this)))
    }, e.prototype.onDragMove = function (a) {
        var b = null, c = null, d = null, e = this.difference(this._drag.pointer, this.pointer(a)),
            f = this.difference(this._drag.stage.start, e);
        this.is("dragging") && (a.preventDefault(), this.settings.loop ? (b = this.coordinates(this.minimum()), c = this.coordinates(this.maximum() + 1) - b, f.x = ((f.x - b) % c + c) % c + b) : (b = this.settings.rtl ? this.coordinates(this.maximum()) : this.coordinates(this.minimum()), c = this.settings.rtl ? this.coordinates(this.minimum()) : this.coordinates(this.maximum()), d = this.settings.pullDrag ? -1 * e.x / 5 : 0, f.x = Math.max(Math.min(f.x, b + d), c + d)), this._drag.stage.current = f, this.animate(f.x))
    }, e.prototype.onDragEnd = function (b) {
        var d = this.difference(this._drag.pointer, this.pointer(b)), e = this._drag.stage.current,
            f = d.x > 0 ^ this.settings.rtl ? "left" : "right";
        a(c).off(".owl.core"), this.$element.removeClass(this.options.grabClass), (0 !== d.x && this.is("dragging") || !this.is("valid")) && (this.speed(this.settings.dragEndSpeed || this.settings.smartSpeed), this.current(this.closest(e.x, 0 !== d.x ? f : this._drag.direction)), this.invalidate("position"), this.update(), this._drag.direction = f, (Math.abs(d.x) > 3 || (new Date).getTime() - this._drag.time > 300) && this._drag.target.one("click.owl.core", function () {
            return !1
        })), this.is("dragging") && (this.leave("dragging"), this.trigger("dragged"))
    }, e.prototype.closest = function (b, c) {
        var e = -1, f = 30, g = this.width(), h = this.coordinates();
        return this.settings.freeDrag || a.each(h, a.proxy(function (a, i) {
            return "left" === c && b > i - f && b < i + f ? e = a : "right" === c && b > i - g - f && b < i - g + f ? e = a + 1 : this.op(b, "<", i) && this.op(b, ">", h[a + 1] !== d ? h[a + 1] : i - g) && (e = "left" === c ? a + 1 : a), -1 === e
        }, this)), this.settings.loop || (this.op(b, ">", h[this.minimum()]) ? e = b = this.minimum() : this.op(b, "<", h[this.maximum()]) && (e = b = this.maximum())), e
    }, e.prototype.animate = function (b) {
        var c = this.speed() > 0;
        this.is("animating") && this.onTransitionEnd(), c && (this.enter("animating"), this.trigger("translate")), a.support.transform3d && a.support.transition ? this.$stage.css({
            transform: "translate3d(" + b + "px,0px,0px)",
            transition: this.speed() / 1e3 + "s" + (this.settings.slideTransition ? " " + this.settings.slideTransition : "")
        }) : c ? this.$stage.animate({left: b + "px"}, this.speed(), this.settings.fallbackEasing, a.proxy(this.onTransitionEnd, this)) : this.$stage.css({left: b + "px"})
    }, e.prototype.is = function (a) {
        return this._states.current[a] && this._states.current[a] > 0
    }, e.prototype.current = function (a) {
        if (a === d) return this._current;
        if (0 === this._items.length) return d;
        if (a = this.normalize(a), this._current !== a) {
            var b = this.trigger("change", {property: {name: "position", value: a}});
            b.data !== d && (a = this.normalize(b.data)), this._current = a, this.invalidate("position"), this.trigger("changed", {
                property: {
                    name: "position",
                    value: this._current
                }
            })
        }
        return this._current
    }, e.prototype.invalidate = function (b) {
        return "string" === a.type(b) && (this._invalidated[b] = !0, this.is("valid") && this.leave("valid")), a.map(this._invalidated, function (a, b) {
            return b
        })
    }, e.prototype.reset = function (a) {
        (a = this.normalize(a)) !== d && (this._speed = 0, this._current = a, this.suppress(["translate", "translated"]), this.animate(this.coordinates(a)), this.release(["translate", "translated"]))
    }, e.prototype.normalize = function (a, b) {
        var c = this._items.length, e = b ? 0 : this._clones.length;
        return !this.isNumeric(a) || c < 1 ? a = d : (a < 0 || a >= c + e) && (a = ((a - e / 2) % c + c) % c + e / 2), a
    }, e.prototype.relative = function (a) {
        return a -= this._clones.length / 2, this.normalize(a, !0)
    }, e.prototype.maximum = function (a) {
        var b, c, d, e = this.settings, f = this._coordinates.length;
        if (e.loop) f = this._clones.length / 2 + this._items.length - 1; else if (e.autoWidth || e.merge) {
            if (b = this._items.length) for (c = this._items[--b].width(), d = this.$element.width(); b-- && !((c += this._items[b].width() + this.settings.margin) > d);) ;
            f = b + 1
        } else f = e.center ? this._items.length - 1 : this._items.length - e.items;
        return a && (f -= this._clones.length / 2), Math.max(f, 0)
    }, e.prototype.minimum = function (a) {
        return a ? 0 : this._clones.length / 2
    }, e.prototype.items = function (a) {
        return a === d ? this._items.slice() : (a = this.normalize(a, !0), this._items[a])
    }, e.prototype.mergers = function (a) {
        return a === d ? this._mergers.slice() : (a = this.normalize(a, !0), this._mergers[a])
    }, e.prototype.clones = function (b) {
        var c = this._clones.length / 2, e = c + this._items.length, f = function (a) {
            return a % 2 == 0 ? e + a / 2 : c - (a + 1) / 2
        };
        return b === d ? a.map(this._clones, function (a, b) {
            return f(b)
        }) : a.map(this._clones, function (a, c) {
            return a === b ? f(c) : null
        })
    }, e.prototype.speed = function (a) {
        return a !== d && (this._speed = a), this._speed
    }, e.prototype.coordinates = function (b) {
        var c, e = 1, f = b - 1;
        return b === d ? a.map(this._coordinates, a.proxy(function (a, b) {
            return this.coordinates(b)
        }, this)) : (this.settings.center ? (this.settings.rtl && (e = -1, f = b + 1), c = this._coordinates[b], c += (this.width() - c + (this._coordinates[f] || 0)) / 2 * e) : c = this._coordinates[f] || 0, c = Math.ceil(c))
    }, e.prototype.duration = function (a, b, c) {
        return 0 === c ? 0 : Math.min(Math.max(Math.abs(b - a), 1), 6) * Math.abs(c || this.settings.smartSpeed)
    }, e.prototype.to = function (a, b) {
        var c = this.current(), d = null, e = a - this.relative(c), f = (e > 0) - (e < 0), g = this._items.length,
            h = this.minimum(), i = this.maximum();
        this.settings.loop ? (!this.settings.rewind && Math.abs(e) > g / 2 && (e += -1 * f * g), a = c + e, (d = ((a - h) % g + g) % g + h) !== a && d - e <= i && d - e > 0 && (c = d - e, a = d, this.reset(c))) : this.settings.rewind ? (i += 1, a = (a % i + i) % i) : a = Math.max(h, Math.min(i, a)), this.speed(this.duration(c, a, b)), this.current(a), this.isVisible() && this.update()
    }, e.prototype.next = function (a) {
        a = a || !1, this.to(this.relative(this.current()) + 1, a)
    }, e.prototype.prev = function (a) {
        a = a || !1, this.to(this.relative(this.current()) - 1, a)
    }, e.prototype.onTransitionEnd = function (a) {
        if (a !== d && (a.stopPropagation(), (a.target || a.srcElement || a.originalTarget) !== this.$stage.get(0))) return !1;
        this.leave("animating"), this.trigger("translated")
    }, e.prototype.viewport = function () {
        var d;
        return this.options.responsiveBaseElement !== b ? d = a(this.options.responsiveBaseElement).width() : b.innerWidth ? d = b.innerWidth : c.documentElement && c.documentElement.clientWidth ? d = c.documentElement.clientWidth : console.warn("Can not detect viewport width."), d
    }, e.prototype.replace = function (b) {
        this.$stage.empty(), this._items = [], b && (b = b instanceof jQuery ? b : a(b)), this.settings.nestedItemSelector && (b = b.find("." + this.settings.nestedItemSelector)), b.filter(function () {
            return 1 === this.nodeType
        }).each(a.proxy(function (a, b) {
            b = this.prepare(b), this.$stage.append(b), this._items.push(b), this._mergers.push(1 * b.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1)
        }, this)), this.reset(this.isNumeric(this.settings.startPosition) ? this.settings.startPosition : 0), this.invalidate("items")
    }, e.prototype.add = function (b, c) {
        var e = this.relative(this._current);
        c = c === d ? this._items.length : this.normalize(c, !0), b = b instanceof jQuery ? b : a(b), this.trigger("add", {
            content: b,
            position: c
        }), b = this.prepare(b), 0 === this._items.length || c === this._items.length ? (0 === this._items.length && this.$stage.append(b), 0 !== this._items.length && this._items[c - 1].after(b), this._items.push(b), this._mergers.push(1 * b.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1)) : (this._items[c].before(b), this._items.splice(c, 0, b), this._mergers.splice(c, 0, 1 * b.find("[data-merge]").addBack("[data-merge]").attr("data-merge") || 1)), this._items[e] && this.reset(this._items[e].index()), this.invalidate("items"), this.trigger("added", {
            content: b,
            position: c
        })
    }, e.prototype.remove = function (a) {
        (a = this.normalize(a, !0)) !== d && (this.trigger("remove", {
            content: this._items[a],
            position: a
        }), this._items[a].remove(), this._items.splice(a, 1), this._mergers.splice(a, 1), this.invalidate("items"), this.trigger("removed", {
            content: null,
            position: a
        }))
    }, e.prototype.preloadAutoWidthImages = function (b) {
        b.each(a.proxy(function (b, c) {
            this.enter("pre-loading"), c = a(c), a(new Image).one("load", a.proxy(function (a) {
                c.attr("src", a.target.src), c.css("opacity", 1), this.leave("pre-loading"), !this.is("pre-loading") && !this.is("initializing") && this.refresh()
            }, this)).attr("src", c.attr("src") || c.attr("data-src") || c.attr("data-src-retina"))
        }, this))
    }, e.prototype.destroy = function () {
        this.$element.off(".owl.core"), this.$stage.off(".owl.core"), a(c).off(".owl.core"), !1 !== this.settings.responsive && (b.clearTimeout(this.resizeTimer), this.off(b, "resize", this._handlers.onThrottledResize));
        for (var d in this._plugins) this._plugins[d].destroy();
        this.$stage.children(".cloned").remove(), this.$stage.unwrap(), this.$stage.children().contents().unwrap(), this.$stage.children().unwrap(), this.$stage.remove(), this.$element.removeClass(this.options.refreshClass).removeClass(this.options.loadingClass).removeClass(this.options.loadedClass).removeClass(this.options.rtlClass).removeClass(this.options.dragClass).removeClass(this.options.grabClass).attr("class", this.$element.attr("class").replace(new RegExp(this.options.responsiveClass + "-\\S+\\s", "g"), "")).removeData("owl.carousel")
    }, e.prototype.op = function (a, b, c) {
        var d = this.settings.rtl;
        switch (b) {
            case"<":
                return d ? a > c : a < c;
            case">":
                return d ? a < c : a > c;
            case">=":
                return d ? a <= c : a >= c;
            case"<=":
                return d ? a >= c : a <= c
        }
    }, e.prototype.on = function (a, b, c, d) {
        a.addEventListener ? a.addEventListener(b, c, d) : a.attachEvent && a.attachEvent("on" + b, c)
    }, e.prototype.off = function (a, b, c, d) {
        a.removeEventListener ? a.removeEventListener(b, c, d) : a.detachEvent && a.detachEvent("on" + b, c)
    }, e.prototype.trigger = function (b, c, d, f, g) {
        var h = {item: {count: this._items.length, index: this.current()}},
            i = a.camelCase(a.grep(["on", b, d], function (a) {
                return a
            }).join("-").toLowerCase()),
            j = a.Event([b, "owl", d || "carousel"].join(".").toLowerCase(), a.extend({relatedTarget: this}, h, c));
        return this._supress[b] || (a.each(this._plugins, function (a, b) {
            b.onTrigger && b.onTrigger(j)
        }), this.register({
            type: e.Type.Event,
            name: b
        }), this.$element.trigger(j), this.settings && "function" == typeof this.settings[i] && this.settings[i].call(this, j)), j
    }, e.prototype.enter = function (b) {
        a.each([b].concat(this._states.tags[b] || []), a.proxy(function (a, b) {
            this._states.current[b] === d && (this._states.current[b] = 0), this._states.current[b]++
        }, this))
    }, e.prototype.leave = function (b) {
        a.each([b].concat(this._states.tags[b] || []), a.proxy(function (a, b) {
            this._states.current[b]--
        }, this))
    }, e.prototype.register = function (b) {
        if (b.type === e.Type.Event) {
            if (a.event.special[b.name] || (a.event.special[b.name] = {}), !a.event.special[b.name].owl) {
                var c = a.event.special[b.name]._default;
                a.event.special[b.name]._default = function (a) {
                    return !c || !c.apply || a.namespace && -1 !== a.namespace.indexOf("owl") ? a.namespace && a.namespace.indexOf("owl") > -1 : c.apply(this, arguments)
                }, a.event.special[b.name].owl = !0
            }
        } else b.type === e.Type.State && (this._states.tags[b.name] ? this._states.tags[b.name] = this._states.tags[b.name].concat(b.tags) : this._states.tags[b.name] = b.tags, this._states.tags[b.name] = a.grep(this._states.tags[b.name], a.proxy(function (c, d) {
            return a.inArray(c, this._states.tags[b.name]) === d
        }, this)))
    }, e.prototype.suppress = function (b) {
        a.each(b, a.proxy(function (a, b) {
            this._supress[b] = !0
        }, this))
    }, e.prototype.release = function (b) {
        a.each(b, a.proxy(function (a, b) {
            delete this._supress[b]
        }, this))
    }, e.prototype.pointer = function (a) {
        var c = {x: null, y: null};
        return a = a.originalEvent || a || b.event, a = a.touches && a.touches.length ? a.touches[0] : a.changedTouches && a.changedTouches.length ? a.changedTouches[0] : a, a.pageX ? (c.x = a.pageX, c.y = a.pageY) : (c.x = a.clientX, c.y = a.clientY), c
    }, e.prototype.isNumeric = function (a) {
        return !isNaN(parseFloat(a))
    }, e.prototype.difference = function (a, b) {
        return {x: a.x - b.x, y: a.y - b.y}
    }, a.fn.owlCarousel = function (b) {
        var c = Array.prototype.slice.call(arguments, 1);
        return this.each(function () {
            var d = a(this), f = d.data("owl.carousel");
            f || (f = new e(this, "object" == typeof b && b), d.data("owl.carousel", f), a.each(["next", "prev", "to", "destroy", "refresh", "replace", "add", "remove"], function (b, c) {
                f.register({
                    type: e.Type.Event,
                    name: c
                }), f.$element.on(c + ".owl.carousel.core", a.proxy(function (a) {
                    a.namespace && a.relatedTarget !== this && (this.suppress([c]), f[c].apply(this, [].slice.call(arguments, 1)), this.release([c]))
                }, f))
            })), "string" == typeof b && "_" !== b.charAt(0) && f[b].apply(f, c)
        })
    }, a.fn.owlCarousel.Constructor = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    var e = function (b) {
        this._core = b, this._interval = null, this._visible = null, this._handlers = {
            "initialized.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.settings.autoRefresh && this.watch()
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this._core.$element.on(this._handlers)
    };
    e.Defaults = {autoRefresh: !0, autoRefreshInterval: 500}, e.prototype.watch = function () {
        this._interval || (this._visible = this._core.isVisible(), this._interval = b.setInterval(a.proxy(this.refresh, this), this._core.settings.autoRefreshInterval))
    }, e.prototype.refresh = function () {
        this._core.isVisible() !== this._visible && (this._visible = !this._visible, this._core.$element.toggleClass("owl-hidden", !this._visible), this._visible && this._core.invalidate("width") && this._core.refresh())
    }, e.prototype.destroy = function () {
        var a, c;
        b.clearInterval(this._interval);
        for (a in this._handlers) this._core.$element.off(a, this._handlers[a]);
        for (c in Object.getOwnPropertyNames(this)) "function" != typeof this[c] && (this[c] = null)
    }, a.fn.owlCarousel.Constructor.Plugins.AutoRefresh = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    var e = function (b) {
        this._core = b, this._loaded = [], this._handlers = {
            "initialized.owl.carousel change.owl.carousel resized.owl.carousel": a.proxy(function (b) {
                if (b.namespace && this._core.settings && this._core.settings.lazyLoad && (b.property && "position" == b.property.name || "initialized" == b.type)) {
                    var c = this._core.settings, e = c.center && Math.ceil(c.items / 2) || c.items,
                        f = c.center && -1 * e || 0,
                        g = (b.property && b.property.value !== d ? b.property.value : this._core.current()) + f,
                        h = this._core.clones().length, i = a.proxy(function (a, b) {
                            this.load(b)
                        }, this);
                    for (c.lazyLoadEager > 0 && (e += c.lazyLoadEager, c.loop && (g -= c.lazyLoadEager, e++)); f++ < e;) this.load(h / 2 + this._core.relative(g)), h && a.each(this._core.clones(this._core.relative(g)), i), g++
                }
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this._core.$element.on(this._handlers)
    };
    e.Defaults = {lazyLoad: !1, lazyLoadEager: 0}, e.prototype.load = function (c) {
        var d = this._core.$stage.children().eq(c), e = d && d.find(".owl-lazy");
        !e || a.inArray(d.get(0), this._loaded) > -1 || (e.each(a.proxy(function (c, d) {
            var e, f = a(d),
                g = b.devicePixelRatio > 1 && f.attr("data-src-retina") || f.attr("data-src") || f.attr("data-srcset");
            this._core.trigger("load", {
                element: f,
                url: g
            }, "lazy"), f.is("img") ? f.one("load.owl.lazy", a.proxy(function () {
                f.css("opacity", 1), this._core.trigger("loaded", {element: f, url: g}, "lazy")
            }, this)).attr("src", g) : f.is("source") ? f.one("load.owl.lazy", a.proxy(function () {
                this._core.trigger("loaded", {element: f, url: g}, "lazy")
            }, this)).attr("srcset", g) : (e = new Image, e.onload = a.proxy(function () {
                f.css({"background-image": 'url("' + g + '")', opacity: "1"}), this._core.trigger("loaded", {
                    element: f,
                    url: g
                }, "lazy")
            }, this), e.src = g)
        }, this)), this._loaded.push(d.get(0)))
    }, e.prototype.destroy = function () {
        var a, b;
        for (a in this.handlers) this._core.$element.off(a, this.handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null)
    }, a.fn.owlCarousel.Constructor.Plugins.Lazy = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    var e = function (c) {
        this._core = c, this._previousHeight = null, this._handlers = {
            "initialized.owl.carousel refreshed.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.settings.autoHeight && this.update()
            }, this), "changed.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.settings.autoHeight && "position" === a.property.name && this.update()
            }, this), "loaded.owl.lazy": a.proxy(function (a) {
                a.namespace && this._core.settings.autoHeight && a.element.closest("." + this._core.settings.itemClass).index() === this._core.current() && this.update()
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this._core.$element.on(this._handlers), this._intervalId = null;
        var d = this;
        a(b).on("load", function () {
            d._core.settings.autoHeight && d.update()
        }), a(b).resize(function () {
            d._core.settings.autoHeight && (null != d._intervalId && clearTimeout(d._intervalId), d._intervalId = setTimeout(function () {
                d.update()
            }, 250))
        })
    };
    e.Defaults = {autoHeight: !1, autoHeightClass: "owl-height"}, e.prototype.update = function () {
        var b = this._core._current, c = b + this._core.settings.items, d = this._core.settings.lazyLoad,
            e = this._core.$stage.children().toArray().slice(b, c), f = [], g = 0;
        a.each(e, function (b, c) {
            f.push(a(c).height())
        }), g = Math.max.apply(null, f), g <= 1 && d && this._previousHeight && (g = this._previousHeight), this._previousHeight = g, this._core.$stage.parent().height(g).addClass(this._core.settings.autoHeightClass)
    }, e.prototype.destroy = function () {
        var a, b;
        for (a in this._handlers) this._core.$element.off(a, this._handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null)
    }, a.fn.owlCarousel.Constructor.Plugins.AutoHeight = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    var e = function (b) {
        this._core = b, this._videos = {}, this._playing = null, this._handlers = {
            "initialized.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.register({type: "state", name: "playing", tags: ["interacting"]})
            }, this), "resize.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.settings.video && this.isInFullScreen() && a.preventDefault()
            }, this), "refreshed.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.is("resizing") && this._core.$stage.find(".cloned .owl-video-frame").remove()
            }, this), "changed.owl.carousel": a.proxy(function (a) {
                a.namespace && "position" === a.property.name && this._playing && this.stop()
            }, this), "prepared.owl.carousel": a.proxy(function (b) {
                if (b.namespace) {
                    var c = a(b.content).find(".owl-video");
                    c.length && (c.css("display", "none"), this.fetch(c, a(b.content)))
                }
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this._core.$element.on(this._handlers), this._core.$element.on("click.owl.video", ".owl-video-play-icon", a.proxy(function (a) {
            this.play(a)
        }, this))
    };
    e.Defaults = {video: !1, videoHeight: !1, videoWidth: !1}, e.prototype.fetch = function (a, b) {
        var c = function () {
                return a.attr("data-vimeo-id") ? "vimeo" : a.attr("data-vzaar-id") ? "vzaar" : "youtube"
            }(), d = a.attr("data-vimeo-id") || a.attr("data-youtube-id") || a.attr("data-vzaar-id"),
            e = a.attr("data-width") || this._core.settings.videoWidth,
            f = a.attr("data-height") || this._core.settings.videoHeight, g = a.attr("href");
        if (!g) throw new Error("Missing video URL.");
        if (d = g.match(/(http:|https:|)\/\/(player.|www.|app.)?(vimeo\.com|youtu(be\.com|\.be|be\.googleapis\.com|be\-nocookie\.com)|vzaar\.com)\/(video\/|videos\/|embed\/|channels\/.+\/|groups\/.+\/|watch\?v=|v\/)?([A-Za-z0-9._%-]*)(\&\S+)?/), d[3].indexOf("youtu") > -1) c = "youtube"; else if (d[3].indexOf("vimeo") > -1) c = "vimeo"; else {
            if (!(d[3].indexOf("vzaar") > -1)) throw new Error("Video URL not supported.");
            c = "vzaar"
        }
        d = d[6], this._videos[g] = {
            type: c,
            id: d,
            width: e,
            height: f
        }, b.attr("data-video", g), this.thumbnail(a, this._videos[g])
    }, e.prototype.thumbnail = function (b, c) {
        var d, e, f, g = c.width && c.height ? "width:" + c.width + "px;height:" + c.height + "px;" : "",
            h = b.find("img"), i = "src", j = "", k = this._core.settings, l = function (c) {
                e = '<div class="owl-video-play-icon"></div>', d = k.lazyLoad ? a("<div/>", {
                    class: "owl-video-tn " + j,
                    srcType: c
                }) : a("<div/>", {
                    class: "owl-video-tn",
                    style: "opacity:1;background-image:url(" + c + ")"
                }), b.after(d), b.after(e)
            };
        if (b.wrap(a("<div/>", {
            class: "owl-video-wrapper",
            style: g
        })), this._core.settings.lazyLoad && (i = "data-src", j = "owl-lazy"), h.length) return l(h.attr(i)), h.remove(), !1;
        "youtube" === c.type ? (f = "//img.youtube.com/vi/" + c.id + "/hqdefault.jpg", l(f)) : "vimeo" === c.type ? a.ajax({
            type: "GET",
            url: "//vimeo.com/api/v2/video/" + c.id + ".json",
            jsonp: "callback",
            dataType: "jsonp",
            success: function (a) {
                f = a[0].thumbnail_large, l(f)
            }
        }) : "vzaar" === c.type && a.ajax({
            type: "GET",
            url: "//vzaar.com/api/videos/" + c.id + ".json",
            jsonp: "callback",
            dataType: "jsonp",
            success: function (a) {
                f = a.framegrab_url, l(f)
            }
        })
    }, e.prototype.stop = function () {
        this._core.trigger("stop", null, "video"), this._playing.find(".owl-video-frame").remove(), this._playing.removeClass("owl-video-playing"), this._playing = null, this._core.leave("playing"), this._core.trigger("stopped", null, "video")
    }, e.prototype.play = function (b) {
        var c, d = a(b.target), e = d.closest("." + this._core.settings.itemClass),
            f = this._videos[e.attr("data-video")], g = f.width || "100%", h = f.height || this._core.$stage.height();
        this._playing || (this._core.enter("playing"), this._core.trigger("play", null, "video"), e = this._core.items(this._core.relative(e.index())), this._core.reset(e.index()), c = a('<iframe frameborder="0" allowfullscreen mozallowfullscreen webkitAllowFullScreen ></iframe>'), c.attr("height", h), c.attr("width", g), "youtube" === f.type ? c.attr("src", "//www.youtube.com/embed/" + f.id + "?autoplay=1&rel=0&v=" + f.id) : "vimeo" === f.type ? c.attr("src", "//player.vimeo.com/video/" + f.id + "?autoplay=1") : "vzaar" === f.type && c.attr("src", "//view.vzaar.com/" + f.id + "/player?autoplay=true"), a(c).wrap('<div class="owl-video-frame" />').insertAfter(e.find(".owl-video")), this._playing = e.addClass("owl-video-playing"))
    }, e.prototype.isInFullScreen = function () {
        var b = c.fullscreenElement || c.mozFullScreenElement || c.webkitFullscreenElement;
        return b && a(b).parent().hasClass("owl-video-frame")
    }, e.prototype.destroy = function () {
        var a, b;
        this._core.$element.off("click.owl.video");
        for (a in this._handlers) this._core.$element.off(a, this._handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null)
    }, a.fn.owlCarousel.Constructor.Plugins.Video = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    var e = function (b) {
        this.core = b, this.core.options = a.extend({}, e.Defaults, this.core.options), this.swapping = !0, this.previous = d, this.next = d, this.handlers = {
            "change.owl.carousel": a.proxy(function (a) {
                a.namespace && "position" == a.property.name && (this.previous = this.core.current(), this.next = a.property.value)
            }, this), "drag.owl.carousel dragged.owl.carousel translated.owl.carousel": a.proxy(function (a) {
                a.namespace && (this.swapping = "translated" == a.type)
            }, this), "translate.owl.carousel": a.proxy(function (a) {
                a.namespace && this.swapping && (this.core.options.animateOut || this.core.options.animateIn) && this.swap()
            }, this)
        }, this.core.$element.on(this.handlers)
    };
    e.Defaults = {
        animateOut: !1,
        animateIn: !1
    }, e.prototype.swap = function () {
        if (1 === this.core.settings.items && a.support.animation && a.support.transition) {
            this.core.speed(0);
            var b, c = a.proxy(this.clear, this), d = this.core.$stage.children().eq(this.previous),
                e = this.core.$stage.children().eq(this.next), f = this.core.settings.animateIn,
                g = this.core.settings.animateOut;
            this.core.current() !== this.previous && (g && (b = this.core.coordinates(this.previous) - this.core.coordinates(this.next), d.one(a.support.animation.end, c).css({left: b + "px"}).addClass("animated owl-animated-out").addClass(g)), f && e.one(a.support.animation.end, c).addClass("animated owl-animated-in").addClass(f))
        }
    }, e.prototype.clear = function (b) {
        a(b.target).css({left: ""}).removeClass("animated owl-animated-out owl-animated-in").removeClass(this.core.settings.animateIn).removeClass(this.core.settings.animateOut), this.core.onTransitionEnd()
    }, e.prototype.destroy = function () {
        var a, b;
        for (a in this.handlers) this.core.$element.off(a, this.handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null)
    }, a.fn.owlCarousel.Constructor.Plugins.Animate = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    var e = function (b) {
        this._core = b, this._call = null, this._time = 0, this._timeout = 0, this._paused = !0, this._handlers = {
            "changed.owl.carousel": a.proxy(function (a) {
                a.namespace && "settings" === a.property.name ? this._core.settings.autoplay ? this.play() : this.stop() : a.namespace && "position" === a.property.name && this._paused && (this._time = 0)
            }, this), "initialized.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.settings.autoplay && this.play()
            }, this), "play.owl.autoplay": a.proxy(function (a, b, c) {
                a.namespace && this.play(b, c)
            }, this), "stop.owl.autoplay": a.proxy(function (a) {
                a.namespace && this.stop()
            }, this), "mouseover.owl.autoplay": a.proxy(function () {
                this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.pause()
            }, this), "mouseleave.owl.autoplay": a.proxy(function () {
                this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.play()
            }, this), "touchstart.owl.core": a.proxy(function () {
                this._core.settings.autoplayHoverPause && this._core.is("rotating") && this.pause()
            }, this), "touchend.owl.core": a.proxy(function () {
                this._core.settings.autoplayHoverPause && this.play()
            }, this)
        }, this._core.$element.on(this._handlers), this._core.options = a.extend({}, e.Defaults, this._core.options)
    };
    e.Defaults = {
        autoplay: !1,
        autoplayTimeout: 5e3,
        autoplayHoverPause: !1,
        autoplaySpeed: !1
    }, e.prototype._next = function (d) {
        this._call = b.setTimeout(a.proxy(this._next, this, d), this._timeout * (Math.round(this.read() / this._timeout) + 1) - this.read()), this._core.is("interacting") || c.hidden || this._core.next(d || this._core.settings.autoplaySpeed)
    }, e.prototype.read = function () {
        return (new Date).getTime() - this._time
    }, e.prototype.play = function (c, d) {
        var e;
        this._core.is("rotating") || this._core.enter("rotating"), c = c || this._core.settings.autoplayTimeout, e = Math.min(this._time % (this._timeout || c), c), this._paused ? (this._time = this.read(), this._paused = !1) : b.clearTimeout(this._call), this._time += this.read() % c - e, this._timeout = c, this._call = b.setTimeout(a.proxy(this._next, this, d), c - e)
    }, e.prototype.stop = function () {
        this._core.is("rotating") && (this._time = 0, this._paused = !0, b.clearTimeout(this._call), this._core.leave("rotating"))
    }, e.prototype.pause = function () {
        this._core.is("rotating") && !this._paused && (this._time = this.read(), this._paused = !0, b.clearTimeout(this._call))
    }, e.prototype.destroy = function () {
        var a, b;
        this.stop();
        for (a in this._handlers) this._core.$element.off(a, this._handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null)
    }, a.fn.owlCarousel.Constructor.Plugins.autoplay = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    "use strict";
    var e = function (b) {
        this._core = b, this._initialized = !1, this._pages = [], this._controls = {}, this._templates = [], this.$element = this._core.$element, this._overrides = {
            next: this._core.next,
            prev: this._core.prev,
            to: this._core.to
        }, this._handlers = {
            "prepared.owl.carousel": a.proxy(function (b) {
                b.namespace && this._core.settings.dotsData && this._templates.push('<div class="' + this._core.settings.dotClass + '">' + a(b.content).find("[data-dot]").addBack("[data-dot]").attr("data-dot") + "</div>")
            }, this), "added.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.settings.dotsData && this._templates.splice(a.position, 0, this._templates.pop())
            }, this), "remove.owl.carousel": a.proxy(function (a) {
                a.namespace && this._core.settings.dotsData && this._templates.splice(a.position, 1)
            }, this), "changed.owl.carousel": a.proxy(function (a) {
                a.namespace && "position" == a.property.name && this.draw()
            }, this), "initialized.owl.carousel": a.proxy(function (a) {
                a.namespace && !this._initialized && (this._core.trigger("initialize", null, "navigation"), this.initialize(), this.update(), this.draw(), this._initialized = !0, this._core.trigger("initialized", null, "navigation"))
            }, this), "refreshed.owl.carousel": a.proxy(function (a) {
                a.namespace && this._initialized && (this._core.trigger("refresh", null, "navigation"), this.update(), this.draw(), this._core.trigger("refreshed", null, "navigation"))
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this.$element.on(this._handlers)
    };
    e.Defaults = {
        nav: !1,
        navText: ['<span aria-label="Previous">&#x2039;</span>', '<span aria-label="Next">&#x203a;</span>'],
        navSpeed: !1,
        navElement: 'button type="button" role="presentation"',
        navContainer: !1,
        navContainerClass: "owl-nav",
        navClass: ["owl-prev", "owl-next"],
        slideBy: 1,
        dotClass: "owl-dot",
        dotsClass: "owl-dots",
        dots: !0,
        dotsEach: !1,
        dotsData: !1,
        dotsSpeed: !1,
        dotsContainer: !1
    }, e.prototype.initialize = function () {
        var b, c = this._core.settings;
        this._controls.$relative = (c.navContainer ? a(c.navContainer) : a("<div>").addClass(c.navContainerClass).appendTo(this.$element)).addClass("disabled"), this._controls.$previous = a("<" + c.navElement + ">").addClass(c.navClass[0]).html(c.navText[0]).prependTo(this._controls.$relative).on("click", a.proxy(function (a) {
            this.prev(c.navSpeed)
        }, this)), this._controls.$next = a("<" + c.navElement + ">").addClass(c.navClass[1]).html(c.navText[1]).appendTo(this._controls.$relative).on("click", a.proxy(function (a) {
            this.next(c.navSpeed)
        }, this)), c.dotsData || (this._templates = [a('<button role="button">').addClass(c.dotClass).append(a("<span>")).prop("outerHTML")]), this._controls.$absolute = (c.dotsContainer ? a(c.dotsContainer) : a("<div>").addClass(c.dotsClass).appendTo(this.$element)).addClass("disabled"), this._controls.$absolute.on("click", "button", a.proxy(function (b) {
            var d = a(b.target).parent().is(this._controls.$absolute) ? a(b.target).index() : a(b.target).parent().index();
            b.preventDefault(), this.to(d, c.dotsSpeed)
        }, this));
        for (b in this._overrides) this._core[b] = a.proxy(this[b], this)
    }, e.prototype.destroy = function () {
        var a, b, c, d, e;
        e = this._core.settings;
        for (a in this._handlers) this.$element.off(a, this._handlers[a]);
        for (b in this._controls) "$relative" === b && e.navContainer ? this._controls[b].html("") : this._controls[b].remove();
        for (d in this.overides) this._core[d] = this._overrides[d];
        for (c in Object.getOwnPropertyNames(this)) "function" != typeof this[c] && (this[c] = null)
    }, e.prototype.update = function () {
        var a, b, c, d = this._core.clones().length / 2, e = d + this._core.items().length, f = this._core.maximum(!0),
            g = this._core.settings, h = g.center || g.autoWidth || g.dotsData ? 1 : g.dotsEach || g.items;
        if ("page" !== g.slideBy && (g.slideBy = Math.min(g.slideBy, g.items)), g.dots || "page" == g.slideBy) for (this._pages = [], a = d, b = 0, c = 0; a < e; a++) {
            if (b >= h || 0 === b) {
                if (this._pages.push({start: Math.min(f, a - d), end: a - d + h - 1}), Math.min(f, a - d) === f) break;
                b = 0, ++c
            }
            b += this._core.mergers(this._core.relative(a))
        }
    }, e.prototype.draw = function () {
        var b, c = this._core.settings, d = this._core.items().length <= c.items,
            e = this._core.relative(this._core.current()), f = c.loop || c.rewind;
        this._controls.$relative.toggleClass("disabled", !c.nav || d), c.nav && (this._controls.$previous.toggleClass("disabled", !f && e <= this._core.minimum(!0)), this._controls.$next.toggleClass("disabled", !f && e >= this._core.maximum(!0))), this._controls.$absolute.toggleClass("disabled", !c.dots || d), c.dots && (b = this._pages.length - this._controls.$absolute.children().length, c.dotsData && 0 !== b ? this._controls.$absolute.html(this._templates.join("")) : b > 0 ? this._controls.$absolute.append(new Array(b + 1).join(this._templates[0])) : b < 0 && this._controls.$absolute.children().slice(b).remove(), this._controls.$absolute.find(".active").removeClass("active"), this._controls.$absolute.children().eq(a.inArray(this.current(), this._pages)).addClass("active"))
    }, e.prototype.onTrigger = function (b) {
        var c = this._core.settings;
        b.page = {
            index: a.inArray(this.current(), this._pages),
            count: this._pages.length,
            size: c && (c.center || c.autoWidth || c.dotsData ? 1 : c.dotsEach || c.items)
        }
    }, e.prototype.current = function () {
        var b = this._core.relative(this._core.current());
        return a.grep(this._pages, a.proxy(function (a, c) {
            return a.start <= b && a.end >= b
        }, this)).pop()
    }, e.prototype.getPosition = function (b) {
        var c, d, e = this._core.settings;
        return "page" == e.slideBy ? (c = a.inArray(this.current(), this._pages), d = this._pages.length, b ? ++c : --c, c = this._pages[(c % d + d) % d].start) : (c = this._core.relative(this._core.current()), d = this._core.items().length, b ? c += e.slideBy : c -= e.slideBy), c
    }, e.prototype.next = function (b) {
        a.proxy(this._overrides.to, this._core)(this.getPosition(!0), b)
    }, e.prototype.prev = function (b) {
        a.proxy(this._overrides.to, this._core)(this.getPosition(!1), b)
    }, e.prototype.to = function (b, c, d) {
        var e;
        !d && this._pages.length ? (e = this._pages.length, a.proxy(this._overrides.to, this._core)(this._pages[(b % e + e) % e].start, c)) : a.proxy(this._overrides.to, this._core)(b, c)
    }, a.fn.owlCarousel.Constructor.Plugins.Navigation = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    "use strict";
    var e = function (c) {
        this._core = c, this._hashes = {}, this.$element = this._core.$element, this._handlers = {
            "initialized.owl.carousel": a.proxy(function (c) {
                c.namespace && "URLHash" === this._core.settings.startPosition && a(b).trigger("hashchange.owl.navigation")
            }, this), "prepared.owl.carousel": a.proxy(function (b) {
                if (b.namespace) {
                    var c = a(b.content).find("[data-hash]").addBack("[data-hash]").attr("data-hash");
                    if (!c) return;
                    this._hashes[c] = b.content
                }
            }, this), "changed.owl.carousel": a.proxy(function (c) {
                if (c.namespace && "position" === c.property.name) {
                    var d = this._core.items(this._core.relative(this._core.current())),
                        e = a.map(this._hashes, function (a, b) {
                            return a === d ? b : null
                        }).join();
                    if (!e || b.location.hash.slice(1) === e) return;
                    b.location.hash = e
                }
            }, this)
        }, this._core.options = a.extend({}, e.Defaults, this._core.options), this.$element.on(this._handlers), a(b).on("hashchange.owl.navigation", a.proxy(function (a) {
            var c = b.location.hash.substring(1), e = this._core.$stage.children(),
                f = this._hashes[c] && e.index(this._hashes[c]);
            f !== d && f !== this._core.current() && this._core.to(this._core.relative(f), !1, !0)
        }, this))
    };
    e.Defaults = {URLhashListener: !1}, e.prototype.destroy = function () {
        var c, d;
        a(b).off("hashchange.owl.navigation");
        for (c in this._handlers) this._core.$element.off(c, this._handlers[c]);
        for (d in Object.getOwnPropertyNames(this)) "function" != typeof this[d] && (this[d] = null)
    }, a.fn.owlCarousel.Constructor.Plugins.Hash = e
}(window.Zepto || window.jQuery, window, document), function (a, b, c, d) {
    function e(b, c) {
        var e = !1, f = b.charAt(0).toUpperCase() + b.slice(1);
        return a.each((b + " " + h.join(f + " ") + f).split(" "), function (a, b) {
            if (g[b] !== d) return e = !c || b, !1
        }), e
    }

    function f(a) {
        return e(a, !0)
    }

    var g = a("<support>").get(0).style, h = "Webkit Moz O ms".split(" "), i = {
        transition: {
            end: {
                WebkitTransition: "webkitTransitionEnd",
                MozTransition: "transitionend",
                OTransition: "oTransitionEnd",
                transition: "transitionend"
            }
        },
        animation: {
            end: {
                WebkitAnimation: "webkitAnimationEnd",
                MozAnimation: "animationend",
                OAnimation: "oAnimationEnd",
                animation: "animationend"
            }
        }
    }, j = {
        csstransforms: function () {
            return !!e("transform")
        }, csstransforms3d: function () {
            return !!e("perspective")
        }, csstransitions: function () {
            return !!e("transition")
        }, cssanimations: function () {
            return !!e("animation")
        }
    };
    j.csstransitions() && (a.support.transition = new String(f("transition")), a.support.transition.end = i.transition.end[a.support.transition]), j.cssanimations() && (a.support.animation = new String(f("animation")), a.support.animation.end = i.animation.end[a.support.animation]), j.csstransforms() && (a.support.transform = new String(f("transform")), a.support.transform3d = j.csstransforms3d())
}(window.Zepto || window.jQuery, window, document);

/*! owl.carousel2.thumbs - v0.1.8 | (c) 2016 @gijsroge | MIT license | https://github.com/gijsroge/OwlCarousel2-Thumbs */
!function (a, b, c, d) {
    "use strict";
    var e = function (b) {
        this.owl = b, this._thumbcontent = [], this._identifier = 0, this.owl_currentitem = this.owl.options.startPosition, this.$element = this.owl.$element, this._handlers = {
            "prepared.owl.carousel": a.proxy(function (b) {
                if (!b.namespace || !this.owl.options.thumbs || this.owl.options.thumbImage || this.owl.options.thumbsPrerendered || this.owl.options.thumbImage) {
                    if (b.namespace && this.owl.options.thumbs && this.owl.options.thumbImage) {
                        var c = a(b.content).find("img");
                        this._thumbcontent.push(c)
                    }
                } else a(b.content).find("[data-thumb]").attr("data-thumb") !== d && this._thumbcontent.push(a(b.content).find("[data-thumb]").attr("data-thumb"))
            }, this), "initialized.owl.carousel": a.proxy(function (a) {
                a.namespace && this.owl.options.thumbs && (this.render(), this.listen(), this._identifier = this.owl.$element.data("slider-id"), this.setActive())
            }, this), "changed.owl.carousel": a.proxy(function (a) {
                a.namespace && "position" === a.property.name && this.owl.options.thumbs && (this._identifier = this.owl.$element.data("slider-id"), this.setActive())
            }, this)
        }, this.owl.options = a.extend({}, e.Defaults, this.owl.options), this.owl.$element.on(this._handlers)
    };
    e.Defaults = {
        thumbs: !0,
        thumbImage: !1,
        thumbContainerClass: "owl-thumbs",
        thumbItemClass: "owl-thumb-item",
        moveThumbsInside: !1
    }, e.prototype.listen = function () {
        var b = this.owl.options;
        b.thumbsPrerendered && (this._thumbcontent._thumbcontainer = a("." + b.thumbContainerClass)), a(this._thumbcontent._thumbcontainer).on("click", this._thumbcontent._thumbcontainer.children(), a.proxy(function (c) {
            this._identifier = a(c.target).closest("." + b.thumbContainerClass).data("slider-id");
            var d = a(c.target).parent().is(this._thumbcontent._thumbcontainer) ? a(c.target).index() : a(c.target).closest("." + b.thumbItemClass).index();
            b.thumbsPrerendered ? a("[data-slider-id=" + this._identifier + "]").trigger("to.owl.carousel", [d, b.dotsSpeed, !0]) : this.owl.to(d, b.dotsSpeed), c.preventDefault()
        }, this))
    }, e.prototype.render = function () {
        var b = this.owl.options;
        b.thumbsPrerendered ? (this._thumbcontent._thumbcontainer = a("." + b.thumbContainerClass), b.moveThumbsInside && this._thumbcontent._thumbcontainer.appendTo(this.$element)) : this._thumbcontent._thumbcontainer = a("<div>").addClass(b.thumbContainerClass).appendTo(this.$element);
        var c;
        if (b.thumbImage) for (c = 0; c < this._thumbcontent.length; ++c) this._thumbcontent._thumbcontainer.append("<button class=" + b.thumbItemClass + '><img src="' + this._thumbcontent[c].attr("src") + '" alt="' + this._thumbcontent[c].attr("alt") + '" /></button>'); else for (c = 0; c < this._thumbcontent.length; ++c) this._thumbcontent._thumbcontainer.append("<button class=" + b.thumbItemClass + ">" + this._thumbcontent[c] + "</button>")
    }, e.prototype.setActive = function () {
        this.owl_currentitem = this.owl._current - this.owl._clones.length / 2, this.owl_currentitem === this.owl._items.length && (this.owl_currentitem = 0);
        var b = this.owl.options,
            c = b.thumbsPrerendered ? a("." + b.thumbContainerClass + '[data-slider-id="' + this._identifier + '"]') : this._thumbcontent._thumbcontainer;
        c.children().filter(".active").removeClass("active"), c.children().eq(this.owl_currentitem).addClass("active")
    }, e.prototype.destroy = function () {
        var a, b;
        for (a in this._handlers) this.owl.$element.off(a, this._handlers[a]);
        for (b in Object.getOwnPropertyNames(this)) "function" != typeof this[b] && (this[b] = null)
    }, a.fn.owlCarousel.Constructor.Plugins.Thumbs = e
}(window.Zepto || window.jQuery, window, document);

// End Owl  Carousel

/*!
 * SlickNav Responsive Mobile Menu v1.0.10
 * (c) 2016 Josh Cope
 * licensed under MIT
 */
!function (e, t, n) {
    function a(t, n) {
        this.element = t, this.settings = e.extend({}, i, n), this.settings.duplicate || n.hasOwnProperty("removeIds") || (this.settings.removeIds = !1), this._defaults = i, this._name = s, this.init()
    }

    var i = {
            label: "MENU",
            duplicate: !0,
            duration: 200,
            easingOpen: "swing",
            easingClose: "swing",
            closedSymbol: "&#9658;",
            openedSymbol: "&#9660;",
            prependTo: "body",
            appendTo: "",
            parentTag: "a",
            closeOnClick: !1,
            allowParentLinks: !1,
            nestedParentLinks: !0,
            showChildren: !1,
            removeIds: !0,
            removeClasses: !1,
            removeStyles: !1,
            brand: "",
            animations: "jquery",
            init: function () {
            },
            beforeOpen: function () {
            },
            beforeClose: function () {
            },
            afterOpen: function () {
            },
            afterClose: function () {
            }
        }, s = "slicknav", o = "slicknav",
        l = {DOWN: 40, ENTER: 13, ESCAPE: 27, LEFT: 37, RIGHT: 39, SPACE: 32, TAB: 9, UP: 38};
    a.prototype.init = function () {
        var n, a, i = this, s = e(this.element), r = this.settings;
        if (r.duplicate ? i.mobileNav = s.clone() : i.mobileNav = s, r.removeIds && (i.mobileNav.removeAttr("id"), i.mobileNav.find("*").each(function (t, n) {
            e(n).removeAttr("id")
        })), r.removeClasses && (i.mobileNav.removeAttr("class"), i.mobileNav.find("*").each(function (t, n) {
            e(n).removeAttr("class")
        })), r.removeStyles && (i.mobileNav.removeAttr("style"), i.mobileNav.find("*").each(function (t, n) {
            e(n).removeAttr("style")
        })), n = o + "_icon", "" === r.label && (n += " " + o + "_no-text"), "a" == r.parentTag && (r.parentTag = 'a href="#"'), i.mobileNav.attr("class", o + "_nav"), a = e('<div class="' + o + '_menu"></div>'), "" !== r.brand) {
            var c = e('<div class="' + o + '_brand">' + r.brand + "</div>");
            e(a).append(c)
        }
        i.btn = e(["<" + r.parentTag + ' aria-haspopup="true" role="button" tabindex="0" class="' + o + "_btn " + o + '_collapsed">', '<span class="' + o + '_menutxt">' + r.label + "</span>", '<span class="' + n + '">', '<span class="' + o + '_icon-bar"></span>', '<span class="' + o + '_icon-bar"></span>', '<span class="' + o + '_icon-bar"></span>', "</span>", "</" + r.parentTag + ">"].join("")), e(a).append(i.btn), "" !== r.appendTo ? e(r.appendTo).append(a) : e(r.prependTo).prepend(a), a.append(i.mobileNav);
        var p = i.mobileNav.find("li");
        e(p).each(function () {
            var t = e(this), n = {};
            if (n.children = t.children("ul").attr("role", "menu"), t.data("menu", n), n.children.length > 0) {
                var a = t.contents(), s = !1, l = [];
                e(a).each(function () {
                    return e(this).is("ul") ? !1 : (l.push(this), void(e(this).is("a") && (s = !0)))
                });
                var c = e("<" + r.parentTag + ' role="menuitem" aria-haspopup="true" tabindex="-1" class="' + o + '_item"/>');
                if (r.allowParentLinks && !r.nestedParentLinks && s) e(l).wrapAll('<span class="' + o + "_parent-link " + o + '_row"/>').parent(); else {
                    var p = e(l).wrapAll(c).parent();
                    p.addClass(o + "_row")
                }
                r.showChildren ? t.addClass(o + "_open") : t.addClass(o + "_collapsed"), t.addClass(o + "_parent");
                var d = e('<span class="' + o + '_arrow">' + (r.showChildren ? r.openedSymbol : r.closedSymbol) + "</span>");
                r.allowParentLinks && !r.nestedParentLinks && s && (d = d.wrap(c).parent()), e(l).last().after(d)
            } else 0 === t.children().length && t.addClass(o + "_txtnode");
            t.children("a").attr("role", "menuitem").click(function (t) {
                r.closeOnClick && !e(t.target).parent().closest("li").hasClass(o + "_parent") && e(i.btn).click()
            }), r.closeOnClick && r.allowParentLinks && (t.children("a").children("a").click(function (t) {
                e(i.btn).click()
            }), t.find("." + o + "_parent-link a:not(." + o + "_item)").click(function (t) {
                e(i.btn).click()
            }))
        }), e(p).each(function () {
            var t = e(this).data("menu");
            r.showChildren || i._visibilityToggle(t.children, null, !1, null, !0)
        }), i._visibilityToggle(i.mobileNav, null, !1, "init", !0), i.mobileNav.attr("role", "menu"), e(t).mousedown(function () {
            i._outlines(!1)
        }), e(t).keyup(function () {
            i._outlines(!0)
        }), e(i.btn).click(function (e) {
            e.preventDefault(), i._menuToggle()
        }), i.mobileNav.on("click", "." + o + "_item", function (t) {
            t.preventDefault(), i._itemClick(e(this))
        }), e(i.btn).keydown(function (t) {
            var n = t || event;
            switch (n.keyCode) {
                case l.ENTER:
                case l.SPACE:
                case l.DOWN:
                    t.preventDefault(), n.keyCode === l.DOWN && e(i.btn).hasClass(o + "_open") || i._menuToggle(), e(i.btn).next().find('[role="menuitem"]').first().focus()
            }
        }), i.mobileNav.on("keydown", "." + o + "_item", function (t) {
            var n = t || event;
            switch (n.keyCode) {
                case l.ENTER:
                    t.preventDefault(), i._itemClick(e(t.target));
                    break;
                case l.RIGHT:
                    t.preventDefault(), e(t.target).parent().hasClass(o + "_collapsed") && i._itemClick(e(t.target)), e(t.target).next().find('[role="menuitem"]').first().focus()
            }
        }), i.mobileNav.on("keydown", '[role="menuitem"]', function (t) {
            var n = t || event;
            switch (n.keyCode) {
                case l.DOWN:
                    t.preventDefault();
                    var a = e(t.target).parent().parent().children().children('[role="menuitem"]:visible'),
                        s = a.index(t.target), r = s + 1;
                    a.length <= r && (r = 0);
                    var c = a.eq(r);
                    c.focus();
                    break;
                case l.UP:
                    t.preventDefault();
                    var a = e(t.target).parent().parent().children().children('[role="menuitem"]:visible'),
                        s = a.index(t.target), c = a.eq(s - 1);
                    c.focus();
                    break;
                case l.LEFT:
                    if (t.preventDefault(), e(t.target).parent().parent().parent().hasClass(o + "_open")) {
                        var p = e(t.target).parent().parent().prev();
                        p.focus(), i._itemClick(p)
                    } else e(t.target).parent().parent().hasClass(o + "_nav") && (i._menuToggle(), e(i.btn).focus());
                    break;
                case l.ESCAPE:
                    t.preventDefault(), i._menuToggle(), e(i.btn).focus()
            }
        }), r.allowParentLinks && r.nestedParentLinks && e("." + o + "_item a").click(function (e) {
            e.stopImmediatePropagation()
        })
    }, a.prototype._menuToggle = function (e) {
        var t = this, n = t.btn, a = t.mobileNav;
        n.hasClass(o + "_collapsed") ? (n.removeClass(o + "_collapsed"), n.addClass(o + "_open")) : (n.removeClass(o + "_open"), n.addClass(o + "_collapsed")), n.addClass(o + "_animating"), t._visibilityToggle(a, n.parent(), !0, n)
    }, a.prototype._itemClick = function (e) {
        var t = this, n = t.settings, a = e.data("menu");
        a || (a = {}, a.arrow = e.children("." + o + "_arrow"), a.ul = e.next("ul"), a.parent = e.parent(), a.parent.hasClass(o + "_parent-link") && (a.parent = e.parent().parent(), a.ul = e.parent().next("ul")), e.data("menu", a)), a.parent.hasClass(o + "_collapsed") ? (a.arrow.html(n.openedSymbol), a.parent.removeClass(o + "_collapsed"), a.parent.addClass(o + "_open"), a.parent.addClass(o + "_animating"), t._visibilityToggle(a.ul, a.parent, !0, e)) : (a.arrow.html(n.closedSymbol), a.parent.addClass(o + "_collapsed"), a.parent.removeClass(o + "_open"), a.parent.addClass(o + "_animating"), t._visibilityToggle(a.ul, a.parent, !0, e))
    }, a.prototype._visibilityToggle = function (t, n, a, i, s) {
        function l(t, n) {
            e(t).removeClass(o + "_animating"), e(n).removeClass(o + "_animating"), s || p.afterOpen(t)
        }

        function r(n, a) {
            t.attr("aria-hidden", "true"), d.attr("tabindex", "-1"), c._setVisAttr(t, !0), t.hide(), e(n).removeClass(o + "_animating"), e(a).removeClass(o + "_animating"), s ? "init" == n && p.init() : p.afterClose(n)
        }

        var c = this, p = c.settings, d = c._getActionItems(t), u = 0;
        a && (u = p.duration), t.hasClass(o + "_hidden") ? (t.removeClass(o + "_hidden"), s || p.beforeOpen(i), "jquery" === p.animations ? t.stop(!0, !0).slideDown(u, p.easingOpen, function () {
            l(i, n)
        }) : "velocity" === p.animations && t.velocity("finish").velocity("slideDown", {
            duration: u,
            easing: p.easingOpen,
            complete: function () {
                l(i, n)
            }
        }), t.attr("aria-hidden", "false"), d.attr("tabindex", "0"), c._setVisAttr(t, !1)) : (t.addClass(o + "_hidden"), s || p.beforeClose(i), "jquery" === p.animations ? t.stop(!0, !0).slideUp(u, this.settings.easingClose, function () {
            r(i, n)
        }) : "velocity" === p.animations && t.velocity("finish").velocity("slideUp", {
            duration: u,
            easing: p.easingClose,
            complete: function () {
                r(i, n)
            }
        }))
    }, a.prototype._setVisAttr = function (t, n) {
        var a = this, i = t.children("li").children("ul").not("." + o + "_hidden");
        n ? i.each(function () {
            var t = e(this);
            t.attr("aria-hidden", "true");
            var i = a._getActionItems(t);
            i.attr("tabindex", "-1"), a._setVisAttr(t, n)
        }) : i.each(function () {
            var t = e(this);
            t.attr("aria-hidden", "false");
            var i = a._getActionItems(t);
            i.attr("tabindex", "0"), a._setVisAttr(t, n)
        })
    }, a.prototype._getActionItems = function (e) {
        var t = e.data("menu");
        if (!t) {
            t = {};
            var n = e.children("li"), a = n.find("a");
            t.links = a.add(n.find("." + o + "_item")), e.data("menu", t)
        }
        return t.links
    }, a.prototype._outlines = function (t) {
        t ? e("." + o + "_item, ." + o + "_btn").css("outline", "") : e("." + o + "_item, ." + o + "_btn").css("outline", "none")
    }, a.prototype.toggle = function () {
        var e = this;
        e._menuToggle()
    }, a.prototype.open = function () {
        var e = this;
        e.btn.hasClass(o + "_collapsed") && e._menuToggle()
    }, a.prototype.close = function () {
        var e = this;
        e.btn.hasClass(o + "_open") && e._menuToggle()
    }, e.fn[s] = function (t) {
        var n = arguments;
        if (void 0 === t || "object" == typeof t) return this.each(function () {
            e.data(this, "plugin_" + s) || e.data(this, "plugin_" + s, new a(this, t))
        });
        if ("string" == typeof t && "_" !== t[0] && "init" !== t) {
            var i;
            return this.each(function () {
                var o = e.data(this, "plugin_" + s);
                o instanceof a && "function" == typeof o[t] && (i = o[t].apply(o, Array.prototype.slice.call(n, 1)))
            }), void 0 !== i ? i : this
        }
    }
}(jQuery, document, window);
// End Slicknav JS

/*!
 * jQuery Smooth Scroll - v2.2.0 - 2017-05-05
 * https://github.com/kswedberg/jquery-smooth-scroll
 * Copyright (c) 2017 Karl Swedberg
 * Licensed MIT
 */


!function (a) {
    "function" == typeof define && define.amd ? define(["jquery"], a) : a("object" == typeof module && module.exports ? require("jquery") : jQuery)
}(function (a) {
    var b = {}, c = {
        exclude: [],
        excludeWithin: [],
        offset: 0,
        direction: "top",
        delegateSelector: null,
        scrollElement: null,
        scrollTarget: null,
        autoFocus: !1,
        beforeScroll: function () {
        },
        afterScroll: function () {
        },
        easing: "swing",
        speed: 400,
        autoCoefficient: 2,
        preventDefault: !0
    }, d = function (b) {
        var c = [], d = !1, e = b.dir && "left" === b.dir ? "scrollLeft" : "scrollTop";
        return this.each(function () {
            var b = a(this);
            if (this !== document && this !== window) return !document.scrollingElement || this !== document.documentElement && this !== document.body ? void(b[e]() > 0 ? c.push(this) : (b[e](1), d = b[e]() > 0, d && c.push(this), b[e](0))) : (c.push(document.scrollingElement), !1)
        }), c.length || this.each(function () {
            this === document.documentElement && "smooth" === a(this).css("scrollBehavior") && (c = [this]), c.length || "BODY" !== this.nodeName || (c = [this])
        }), "first" === b.el && c.length > 1 && (c = [c[0]]), c
    }, e = /^([\-\+]=)(\d+)/;
    a.fn.extend({
        scrollable: function (a) {
            var b = d.call(this, {dir: a});
            return this.pushStack(b)
        }, firstScrollable: function (a) {
            var b = d.call(this, {el: "first", dir: a});
            return this.pushStack(b)
        }, smoothScroll: function (b, c) {
            if ("options" === (b = b || {})) return c ? this.each(function () {
                var b = a(this), d = a.extend(b.data("ssOpts") || {}, c);
                a(this).data("ssOpts", d)
            }) : this.first().data("ssOpts");
            var d = a.extend({}, a.fn.smoothScroll.defaults, b), e = function (b) {
                var c = function (a) {
                        return a.replace(/(:|\.|\/)/g, "\\$1")
                    }, e = this, f = a(this), g = a.extend({}, d, f.data("ssOpts") || {}), h = d.exclude,
                    i = g.excludeWithin, j = 0, k = 0, l = !0, m = {}, n = a.smoothScroll.filterPath(location.pathname),
                    o = a.smoothScroll.filterPath(e.pathname), p = location.hostname === e.hostname || !e.hostname,
                    q = g.scrollTarget || o === n, r = c(e.hash);
                if (r && !a(r).length && (l = !1), g.scrollTarget || p && q && r) {
                    for (; l && j < h.length;) f.is(c(h[j++])) && (l = !1);
                    for (; l && k < i.length;) f.closest(i[k++]).length && (l = !1)
                } else l = !1;
                l && (g.preventDefault && b.preventDefault(), a.extend(m, g, {
                    scrollTarget: g.scrollTarget || r,
                    link: e
                }), a.smoothScroll(m))
            };
            return null !== b.delegateSelector ? this.off("click.smoothscroll", b.delegateSelector).on("click.smoothscroll", b.delegateSelector, e) : this.off("click.smoothscroll").on("click.smoothscroll", e), this
        }
    });
    var f = function (a) {
        var b = {relative: ""}, c = "string" == typeof a && e.exec(a);
        return "number" == typeof a ? b.px = a : c && (b.relative = c[1], b.px = parseFloat(c[2]) || 0), b
    }, g = function (b) {
        var c = a(b.scrollTarget);
        b.autoFocus && c.length && (c[0].focus(), c.is(document.activeElement) || (c.prop({tabIndex: -1}), c[0].focus())), b.afterScroll.call(b.link, b)
    };
    a.smoothScroll = function (c, d) {
        if ("options" === c && "object" == typeof d) return a.extend(b, d);
        var e, h, i, j, k = f(c), l = {}, m = 0, n = "offset", o = "scrollTop", p = {}, q = {};
        k.px ? e = a.extend({link: null}, a.fn.smoothScroll.defaults, b) : (e = a.extend({link: null}, a.fn.smoothScroll.defaults, c || {}, b), e.scrollElement && (n = "position", "static" === e.scrollElement.css("position") && e.scrollElement.css("position", "relative")), d && (k = f(d))), o = "left" === e.direction ? "scrollLeft" : o, e.scrollElement ? (h = e.scrollElement, k.px || /^(?:HTML|BODY)$/.test(h[0].nodeName) || (m = h[o]())) : h = a("html, body").firstScrollable(e.direction), e.beforeScroll.call(h, e), l = k.px ? k : {
            relative: "",
            px: a(e.scrollTarget)[n]() && a(e.scrollTarget)[n]()[e.direction] || 0
        }, p[o] = l.relative + (l.px + m + e.offset), i = e.speed, "auto" === i && (j = Math.abs(p[o] - h[o]()), i = j / e.autoCoefficient), q = {
            duration: i,
            easing: e.easing,
            complete: function () {
                g(e)
            }
        }, e.step && (q.step = e.step), h.length ? h.stop().animate(p, q) : g(e)
    }, a.smoothScroll.version = "2.2.0", a.smoothScroll.filterPath = function (a) {
        return a = a || "", a.replace(/^\//, "").replace(/(?:index|default).[a-zA-Z]{3,4}$/, "").replace(/\/$/, "")
    }, a.fn.smoothScroll.defaults = c
});
// End jQuery Scroll top

/*!
 * The Final Countdown for jQuery v2.2.0 (http://hilios.github.io/jQuery.countdown/)
 * Copyright (c) 2016 Edson Hilios
 */
!function (a) {
    "use strict";
    "function" == typeof define && define.amd ? define(["jquery"], a) : a(jQuery)
}(function (a) {
    "use strict";

    function b(a) {
        if (a instanceof Date) return a;
        if (String(a).match(g)) return String(a).match(/^[0-9]*$/) && (a = Number(a)), String(a).match(/\-/) && (a = String(a).replace(/\-/g, "/")), new Date(a);
        throw new Error("Couldn't cast `" + a + "` to a date object.")
    }

    function c(a) {
        var b = a.toString().replace(/([.?*+^$[\]\\(){}|-])/g, "\\$1");
        return new RegExp(b)
    }

    function d(a) {
        return function (b) {
            var d = b.match(/%(-|!)?[A-Z]{1}(:[^;]+;)?/gi);
            if (d) for (var f = 0, g = d.length; f < g; ++f) {
                var h = d[f].match(/%(-|!)?([a-zA-Z]{1})(:[^;]+;)?/), j = c(h[0]), k = h[1] || "", l = h[3] || "",
                    m = null;
                h = h[2], i.hasOwnProperty(h) && (m = i[h], m = Number(a[m])), null !== m && ("!" === k && (m = e(l, m)), "" === k && m < 10 && (m = "0" + m.toString()), b = b.replace(j, m.toString()))
            }
            return b = b.replace(/%%/, "%")
        }
    }

    function e(a, b) {
        var c = "s", d = "";
        return a && (a = a.replace(/(:|;|\s)/gi, "").split(/\,/), 1 === a.length ? c = a[0] : (d = a[0], c = a[1])), Math.abs(b) > 1 ? c : d
    }

    var f = [], g = [], h = {precision: 100, elapse: !1, defer: !1};
    g.push(/^[0-9]*$/.source), g.push(/([0-9]{1,2}\/){2}[0-9]{4}( [0-9]{1,2}(:[0-9]{2}){2})?/.source), g.push(/[0-9]{4}([\/\-][0-9]{1,2}){2}( [0-9]{1,2}(:[0-9]{2}){2})?/.source), g = new RegExp(g.join("|"));
    var i = {
        Y: "years",
        m: "months",
        n: "daysToMonth",
        d: "daysToWeek",
        w: "weeks",
        W: "weeksToMonth",
        H: "hours",
        M: "minutes",
        S: "seconds",
        D: "totalDays",
        I: "totalHours",
        N: "totalMinutes",
        T: "totalSeconds"
    }, j = function (b, c, d) {
        this.el = b, this.$el = a(b), this.interval = null, this.offset = {}, this.options = a.extend({}, h), this.instanceNumber = f.length, f.push(this), this.$el.data("countdown-instance", this.instanceNumber), d && ("function" == typeof d ? (this.$el.on("update.countdown", d), this.$el.on("stoped.countdown", d), this.$el.on("finish.countdown", d)) : this.options = a.extend({}, h, d)), this.setFinalDate(c), this.options.defer === !1 && this.start()
    };
    a.extend(j.prototype, {
        start: function () {
            null !== this.interval && clearInterval(this.interval);
            var a = this;
            this.update(), this.interval = setInterval(function () {
                a.update.call(a)
            }, this.options.precision)
        }, stop: function () {
            clearInterval(this.interval), this.interval = null, this.dispatchEvent("stoped")
        }, toggle: function () {
            this.interval ? this.stop() : this.start()
        }, pause: function () {
            this.stop()
        }, resume: function () {
            this.start()
        }, remove: function () {
            this.stop.call(this), f[this.instanceNumber] = null, delete this.$el.data().countdownInstance
        }, setFinalDate: function (a) {
            this.finalDate = b(a)
        }, update: function () {
            if (0 === this.$el.closest("html").length) return void this.remove();
            var b, c = void 0 !== a._data(this.el, "events"), d = new Date;
            b = this.finalDate.getTime() - d.getTime(), b = Math.ceil(b / 1e3), b = !this.options.elapse && b < 0 ? 0 : Math.abs(b), this.totalSecsLeft !== b && c && (this.totalSecsLeft = b, this.elapsed = d >= this.finalDate, this.offset = {
                seconds: this.totalSecsLeft % 60,
                minutes: Math.floor(this.totalSecsLeft / 60) % 60,
                hours: Math.floor(this.totalSecsLeft / 60 / 60) % 24,
                days: Math.floor(this.totalSecsLeft / 60 / 60 / 24) % 7,
                daysToWeek: Math.floor(this.totalSecsLeft / 60 / 60 / 24) % 7,
                daysToMonth: Math.floor(this.totalSecsLeft / 60 / 60 / 24 % 30.4368),
                weeks: Math.floor(this.totalSecsLeft / 60 / 60 / 24 / 7),
                weeksToMonth: Math.floor(this.totalSecsLeft / 60 / 60 / 24 / 7) % 4,
                months: Math.floor(this.totalSecsLeft / 60 / 60 / 24 / 30.4368),
                years: Math.abs(this.finalDate.getFullYear() - d.getFullYear()),
                totalDays: Math.floor(this.totalSecsLeft / 60 / 60 / 24),
                totalHours: Math.floor(this.totalSecsLeft / 60 / 60),
                totalMinutes: Math.floor(this.totalSecsLeft / 60),
                totalSeconds: this.totalSecsLeft
            }, this.options.elapse || 0 !== this.totalSecsLeft ? this.dispatchEvent("update") : (this.stop(), this.dispatchEvent("finish")))
        }, dispatchEvent: function (b) {
            var c = a.Event(b + ".countdown");
            c.finalDate = this.finalDate, c.elapsed = this.elapsed, c.offset = a.extend({}, this.offset), c.strftime = d(this.offset), this.$el.trigger(c)
        }
    }), a.fn.countdown = function () {
        var b = Array.prototype.slice.call(arguments, 0);
        return this.each(function () {
            var c = a(this).data("countdown-instance");
            if (void 0 !== c) {
                var d = f[c], e = b[0];
                j.prototype.hasOwnProperty(e) ? d[e].apply(d, b.slice(1)) : null === String(e).match(/^[$A-Z_][0-9A-Z_$]*$/i) ? (d.setFinalDate.call(d, e), d.start()) : a.error("Method %s does not exist on jQuery.countdown".replace(/\%s/gi, e))
            } else new j(this, b[0], b[1])
        })
    }
});
// End Coundown JS


/*  jQuery Nice Select - v1.0
    https://github.com/hernansartorio/jquery-nice-select
    Made by Hernán Sartorio  */
!function (e) {
    e.fn.niceSelect = function (t) {
        function s(t) {
            t.after(e("<div></div>").addClass("nice-select").addClass(t.attr("class") || "").addClass(t.attr("disabled") ? "disabled" : "").attr("tabindex", t.attr("disabled") ? null : "0").html('<span class="current"></span><ul class="list"></ul>'));
            var s = t.next(), n = t.find("option"), i = t.find("option:selected");
            s.find(".current").html(i.data("display") || i.text()), n.each(function (t) {
                var n = e(this), i = n.data("display");
                s.find("ul").append(e("<li></li>").attr("data-value", n.val()).attr("data-display", i || null).addClass("option" + (n.is(":selected") ? " selected" : "") + (n.is(":disabled") ? " disabled" : "")).html(n.text()))
            })
        }

        if ("string" == typeof t) return "update" == t ? this.each(function () {
            var t = e(this), n = e(this).next(".nice-select"), i = n.hasClass("open");
            n.length && (n.remove(), s(t), i && t.next().trigger("click"))
        }) : "destroy" == t ? (this.each(function () {
            var t = e(this), s = e(this).next(".nice-select");
            s.length && (s.remove(), t.css("display", ""))
        }), 0 == e(".nice-select").length && e(document).off(".nice_select")) : console.log('Method "' + t + '" does not exist.'), this;
        this.hide(), this.each(function () {
            var t = e(this);
            t.next().hasClass("nice-select") || s(t)
        }), e(document).off(".nice_select"), e(document).on("click.nice_select", ".nice-select", function (t) {
            var s = e(this);
            e(".nice-select").not(s).removeClass("open"), s.toggleClass("open"), s.hasClass("open") ? (s.find(".option"), s.find(".focus").removeClass("focus"), s.find(".selected").addClass("focus")) : s.focus()
        }), e(document).on("click.nice_select", function (t) {
            0 === e(t.target).closest(".nice-select").length && e(".nice-select").removeClass("open").find(".option")
        }), e(document).on("click.nice_select", ".nice-select .option:not(.disabled)", function (t) {
            var s = e(this), n = s.closest(".nice-select");
            n.find(".selected").removeClass("selected"), s.addClass("selected");
            var i = s.data("display") || s.text();
            n.find(".current").text(i), n.prev("select").val(s.data("value")).trigger("change")
        }), e(document).on("keydown.nice_select", ".nice-select", function (t) {
            var s = e(this), n = e(s.find(".focus") || s.find(".list .option.selected"));
            if (32 == t.keyCode || 13 == t.keyCode) return s.hasClass("open") ? n.trigger("click") : s.trigger("click"), !1;
            if (40 == t.keyCode) {
                if (s.hasClass("open")) {
                    var i = n.nextAll(".option:not(.disabled)").first();
                    i.length > 0 && (s.find(".focus").removeClass("focus"), i.addClass("focus"))
                } else s.trigger("click");
                return !1
            }
            if (38 == t.keyCode) {
                if (s.hasClass("open")) {
                    var l = n.prevAll(".option:not(.disabled)").first();
                    l.length > 0 && (s.find(".focus").removeClass("focus"), l.addClass("focus"))
                } else s.trigger("click");
                return !1
            }
            if (27 == t.keyCode) s.hasClass("open") && s.trigger("click"); else if (9 == t.keyCode && s.hasClass("open")) return !1
        });
        var n = document.createElement("a").style;
        return n.cssText = "pointer-events:auto", "auto" !== n.pointerEvents && e("html").addClass("no-csspointerevents"), this
    }
}(jQuery);
// End Nice Select

/* @preserve
 * Leaflet 1.3.4+Detached: 0e566b2ad5e696ba9f79a9d48a7e51c8f4892441.0e566b2, a JS library for interactive maps. http://leafletjs.com
 * (c) 2010-2018 Vladimir Agafonkin, (c) 2010-2011 CloudMade
 */
!function (t, i) {
    "object" == typeof exports && "undefined" != typeof module ? i(exports) : "function" == typeof define && define.amd ? define(["exports"], i) : i(t.L = {})
}(this, function (t) {
    "use strict";

    function i(t) {
        var i, e, n, o;
        for (e = 1, n = arguments.length; e < n; e++) {
            o = arguments[e];
            for (i in o) t[i] = o[i]
        }
        return t
    }

    function e(t, i) {
        var e = Array.prototype.slice;
        if (t.bind) return t.bind.apply(t, e.call(arguments, 1));
        var n = e.call(arguments, 2);
        return function () {
            return t.apply(i, n.length ? n.concat(e.call(arguments)) : arguments)
        }
    }

    function n(t) {
        return t._leaflet_id = t._leaflet_id || ++ei, t._leaflet_id
    }

    function o(t, i, e) {
        var n, o, s, r;
        return r = function () {
            n = !1, o && (s.apply(e, o), o = !1)
        }, s = function () {
            n ? o = arguments : (t.apply(e, arguments), setTimeout(r, i), n = !0)
        }
    }

    function s(t, i, e) {
        var n = i[1], o = i[0], s = n - o;
        return t === n && e ? t : ((t - o) % s + s) % s + o
    }

    function r() {
        return !1
    }

    function a(t, i) {
        var e = Math.pow(10, void 0 === i ? 6 : i);
        return Math.round(t * e) / e
    }

    function h(t) {
        return t.trim ? t.trim() : t.replace(/^\s+|\s+$/g, "")
    }

    function u(t) {
        return h(t).split(/\s+/)
    }

    function l(t, i) {
        t.hasOwnProperty("options") || (t.options = t.options ? ii(t.options) : {});
        for (var e in i) t.options[e] = i[e];
        return t.options
    }

    function c(t, i, e) {
        var n = [];
        for (var o in t) n.push(encodeURIComponent(e ? o.toUpperCase() : o) + "=" + encodeURIComponent(t[o]));
        return (i && -1 !== i.indexOf("?") ? "&" : "?") + n.join("&")
    }

    function _(t, i) {
        return t.replace(ni, function (t, e) {
            var n = i[e];
            if (void 0 === n) throw new Error("No value provided for variable " + t);
            return "function" == typeof n && (n = n(i)), n
        })
    }

    function d(t, i) {
        for (var e = 0; e < t.length; e++) if (t[e] === i) return e;
        return -1
    }

    function p(t) {
        return window["webkit" + t] || window["moz" + t] || window["ms" + t]
    }

    function m(t) {
        var i = +new Date, e = Math.max(0, 16 - (i - ri));
        return ri = i + e, window.setTimeout(t, e)
    }

    function f(t, i, n) {
        if (!n || ai !== m) return ai.call(window, e(t, i));
        t.call(i)
    }

    function g(t) {
        t && hi.call(window, t)
    }

    function v() {
    }

    function y(t) {
        if ("undefined" != typeof L && L && L.Mixin) {
            t = oi(t) ? t : [t];
            for (var i = 0; i < t.length; i++) t[i] === L.Mixin.Events && console.warn("Deprecated include of L.Mixin.Events: this property will be removed in future releases, please inherit from L.Evented instead.", (new Error).stack)
        }
    }

    function x(t, i, e) {
        this.x = e ? Math.round(t) : t, this.y = e ? Math.round(i) : i
    }

    function w(t, i, e) {
        return t instanceof x ? t : oi(t) ? new x(t[0], t[1]) : void 0 === t || null === t ? t : "object" == typeof t && "x" in t && "y" in t ? new x(t.x, t.y) : new x(t, i, e)
    }

    function P(t, i) {
        if (t) for (var e = i ? [t, i] : t, n = 0, o = e.length; n < o; n++) this.extend(e[n])
    }

    function b(t, i) {
        return !t || t instanceof P ? t : new P(t, i)
    }

    function T(t, i) {
        if (t) for (var e = i ? [t, i] : t, n = 0, o = e.length; n < o; n++) this.extend(e[n])
    }

    function z(t, i) {
        return t instanceof T ? t : new T(t, i)
    }

    function M(t, i, e) {
        if (isNaN(t) || isNaN(i)) throw new Error("Invalid LatLng object: (" + t + ", " + i + ")");
        this.lat = +t, this.lng = +i, void 0 !== e && (this.alt = +e)
    }

    function C(t, i, e) {
        return t instanceof M ? t : oi(t) && "object" != typeof t[0] ? 3 === t.length ? new M(t[0], t[1], t[2]) : 2 === t.length ? new M(t[0], t[1]) : null : void 0 === t || null === t ? t : "object" == typeof t && "lat" in t ? new M(t.lat, "lng" in t ? t.lng : t.lon, t.alt) : void 0 === i ? null : new M(t, i, e)
    }

    function S(t, i, e, n) {
        if (oi(t)) return this._a = t[0], this._b = t[1], this._c = t[2], void(this._d = t[3]);
        this._a = t, this._b = i, this._c = e, this._d = n
    }

    function Z(t, i, e, n) {
        return new S(t, i, e, n)
    }

    function E(t) {
        return document.createElementNS("http://www.w3.org/2000/svg", t)
    }

    function k(t, i) {
        var e, n, o, s, r, a, h = "";
        for (e = 0, o = t.length; e < o; e++) {
            for (n = 0, s = (r = t[e]).length; n < s; n++) a = r[n], h += (n ? "L" : "M") + a.x + " " + a.y;
            h += i ? Ji ? "z" : "x" : ""
        }
        return h || "M0 0"
    }

    function A(t) {
        return navigator.userAgent.toLowerCase().indexOf(t) >= 0
    }

    function B(t, i, e, n) {
        return "touchstart" === i ? O(t, e, n) : "touchmove" === i ? W(t, e, n) : "touchend" === i && H(t, e, n), this
    }

    function I(t, i, e) {
        var n = t["_leaflet_" + i + e];
        return "touchstart" === i ? t.removeEventListener(te, n, !1) : "touchmove" === i ? t.removeEventListener(ie, n, !1) : "touchend" === i && (t.removeEventListener(ee, n, !1), t.removeEventListener(ne, n, !1)), this
    }

    function O(t, i, n) {
        var o = e(function (t) {
            if ("mouse" !== t.pointerType && t.MSPOINTER_TYPE_MOUSE && t.pointerType !== t.MSPOINTER_TYPE_MOUSE) {
                if (!(oe.indexOf(t.target.tagName) < 0)) return;
                Pt(t)
            }
            j(t, i)
        });
        t["_leaflet_touchstart" + n] = o, t.addEventListener(te, o, !1), re || (document.documentElement.addEventListener(te, R, !0), document.documentElement.addEventListener(ie, N, !0), document.documentElement.addEventListener(ee, D, !0), document.documentElement.addEventListener(ne, D, !0), re = !0)
    }

    function R(t) {
        se[t.pointerId] = t, ae++
    }

    function N(t) {
        se[t.pointerId] && (se[t.pointerId] = t)
    }

    function D(t) {
        delete se[t.pointerId], ae--
    }

    function j(t, i) {
        t.touches = [];
        for (var e in se) t.touches.push(se[e]);
        t.changedTouches = [t], i(t)
    }

    function W(t, i, e) {
        var n = function (t) {
            (t.pointerType !== t.MSPOINTER_TYPE_MOUSE && "mouse" !== t.pointerType || 0 !== t.buttons) && j(t, i)
        };
        t["_leaflet_touchmove" + e] = n, t.addEventListener(ie, n, !1)
    }

    function H(t, i, e) {
        var n = function (t) {
            j(t, i)
        };
        t["_leaflet_touchend" + e] = n, t.addEventListener(ee, n, !1), t.addEventListener(ne, n, !1)
    }

    function F(t, i, e) {
        function n(t) {
            var i;
            if (Vi) {
                if (!bi || "mouse" === t.pointerType) return;
                i = ae
            } else i = t.touches.length;
            if (!(i > 1)) {
                var e = Date.now(), n = e - (s || e);
                r = t.touches ? t.touches[0] : t, a = n > 0 && n <= h, s = e
            }
        }

        function o(t) {
            if (a && !r.cancelBubble) {
                if (Vi) {
                    if (!bi || "mouse" === t.pointerType) return;
                    var e, n, o = {};
                    for (n in r) e = r[n], o[n] = e && e.bind ? e.bind(r) : e;
                    r = o
                }
                r.type = "dblclick", i(r), s = null
            }
        }

        var s, r, a = !1, h = 250;
        return t[le + he + e] = n, t[le + ue + e] = o, t[le + "dblclick" + e] = i, t.addEventListener(he, n, !1), t.addEventListener(ue, o, !1), t.addEventListener("dblclick", i, !1), this
    }

    function U(t, i) {
        var e = t[le + he + i], n = t[le + ue + i], o = t[le + "dblclick" + i];
        return t.removeEventListener(he, e, !1), t.removeEventListener(ue, n, !1), bi || t.removeEventListener("dblclick", o, !1), this
    }

    function V(t) {
        return "string" == typeof t ? document.getElementById(t) : t
    }

    function q(t, i) {
        var e = t.style[i] || t.currentStyle && t.currentStyle[i];
        if ((!e || "auto" === e) && document.defaultView) {
            var n = document.defaultView.getComputedStyle(t, null);
            e = n ? n[i] : null
        }
        return "auto" === e ? null : e
    }

    function G(t, i, e) {
        var n = document.createElement(t);
        return n.className = i || "", e && e.appendChild(n), n
    }

    function K(t) {
        var i = t.parentNode;
        i && i.removeChild(t)
    }

    function Y(t) {
        for (; t.firstChild;) t.removeChild(t.firstChild)
    }

    function X(t) {
        var i = t.parentNode;
        i.lastChild !== t && i.appendChild(t)
    }

    function J(t) {
        var i = t.parentNode;
        i.firstChild !== t && i.insertBefore(t, i.firstChild)
    }

    function $(t, i) {
        if (void 0 !== t.classList) return t.classList.contains(i);
        var e = et(t);
        return e.length > 0 && new RegExp("(^|\\s)" + i + "(\\s|$)").test(e)
    }

    function Q(t, i) {
        if (void 0 !== t.classList) for (var e = u(i), n = 0, o = e.length; n < o; n++) t.classList.add(e[n]); else if (!$(t, i)) {
            var s = et(t);
            it(t, (s ? s + " " : "") + i)
        }
    }

    function tt(t, i) {
        void 0 !== t.classList ? t.classList.remove(i) : it(t, h((" " + et(t) + " ").replace(" " + i + " ", " ")))
    }

    function it(t, i) {
        void 0 === t.className.baseVal ? t.className = i : t.className.baseVal = i
    }

    function et(t) {
        return void 0 === t.className.baseVal ? t.className : t.className.baseVal
    }

    function nt(t, i) {
        "opacity" in t.style ? t.style.opacity = i : "filter" in t.style && ot(t, i)
    }

    function ot(t, i) {
        var e = !1, n = "DXImageTransform.Microsoft.Alpha";
        try {
            e = t.filters.item(n)
        } catch (t) {
            if (1 === i) return
        }
        i = Math.round(100 * i), e ? (e.Enabled = 100 !== i, e.Opacity = i) : t.style.filter += " progid:" + n + "(opacity=" + i + ")"
    }

    function st(t) {
        for (var i = document.documentElement.style, e = 0; e < t.length; e++) if (t[e] in i) return t[e];
        return !1
    }

    function rt(t, i, e) {
        var n = i || new x(0, 0);
        t.style[ce] = (Ri ? "translate(" + n.x + "px," + n.y + "px)" : "translate3d(" + n.x + "px," + n.y + "px,0)") + (e ? " scale(" + e + ")" : "")
    }

    function at(t, i) {
        t._leaflet_pos = i, ji ? rt(t, i) : (t.style.left = i.x + "px", t.style.top = i.y + "px")
    }

    function ht(t) {
        return t._leaflet_pos || new x(0, 0)
    }

    function ut() {
        mt(window, "dragstart", Pt)
    }

    function lt() {
        ft(window, "dragstart", Pt)
    }

    function ct(t) {
        for (; -1 === t.tabIndex;) t = t.parentNode;
        t.style && (_t(), me = t, fe = t.style.outline, t.style.outline = "none", mt(window, "keydown", _t))
    }

    function _t() {
        me && (me.style.outline = fe, me = void 0, fe = void 0, ft(window, "keydown", _t))
    }

    function dt(t) {
        do {
            t = t.parentNode
        } while (!(t.offsetWidth && t.offsetHeight || t === document.body));
        return t
    }

    function pt(t) {
        var i = t.getBoundingClientRect();
        return {x: i.width / t.offsetWidth || 1, y: i.height / t.offsetHeight || 1, boundingClientRect: i}
    }

    function mt(t, i, e, n) {
        if ("object" == typeof i) for (var o in i) gt(t, o, i[o], e); else for (var s = 0, r = (i = u(i)).length; s < r; s++) gt(t, i[s], e, n);
        return this
    }

    function ft(t, i, e, n) {
        if ("object" == typeof i) for (var o in i) vt(t, o, i[o], e); else if (i) for (var s = 0, r = (i = u(i)).length; s < r; s++) vt(t, i[s], e, n); else {
            for (var a in t[ye]) vt(t, a, t[ye][a]);
            delete t[ye]
        }
        return this
    }

    function gt(t, i, e, o) {
        var s = i + n(e) + (o ? "_" + n(o) : "");
        if (t[ye] && t[ye][s]) return this;
        var r = function (i) {
            return e.call(o || t, i || window.event)
        }, a = r;
        Vi && 0 === i.indexOf("touch") ? B(t, i, r, s) : !qi || "dblclick" !== i || !F || Vi && Ei ? "addEventListener" in t ? "mousewheel" === i ? t.addEventListener("onwheel" in t ? "wheel" : "mousewheel", r, !1) : "mouseenter" === i || "mouseleave" === i ? (r = function (i) {
            i = i || window.event, Ct(t, i) && a(i)
        }, t.addEventListener("mouseenter" === i ? "mouseover" : "mouseout", r, !1)) : ("click" === i && zi && (r = function (t) {
            St(t, a)
        }), t.addEventListener(i, r, !1)) : "attachEvent" in t && t.attachEvent("on" + i, r) : F(t, r, s), t[ye] = t[ye] || {}, t[ye][s] = r
    }

    function vt(t, i, e, o) {
        var s = i + n(e) + (o ? "_" + n(o) : ""), r = t[ye] && t[ye][s];
        if (!r) return this;
        Vi && 0 === i.indexOf("touch") ? I(t, i, s) : !qi || "dblclick" !== i || !U || Vi && Ei ? "removeEventListener" in t ? "mousewheel" === i ? t.removeEventListener("onwheel" in t ? "wheel" : "mousewheel", r, !1) : t.removeEventListener("mouseenter" === i ? "mouseover" : "mouseleave" === i ? "mouseout" : i, r, !1) : "detachEvent" in t && t.detachEvent("on" + i, r) : U(t, s), t[ye][s] = null
    }

    function yt(t) {
        return t.stopPropagation ? t.stopPropagation() : t.originalEvent ? t.originalEvent._stopped = !0 : t.cancelBubble = !0, Mt(t), this
    }

    function xt(t) {
        return gt(t, "mousewheel", yt), this
    }

    function wt(t) {
        return mt(t, "mousedown touchstart dblclick", yt), gt(t, "click", zt), this
    }

    function Pt(t) {
        return t.preventDefault ? t.preventDefault() : t.returnValue = !1, this
    }

    function Lt(t) {
        return Pt(t), yt(t), this
    }

    function bt(t, i) {
        if (!i) return new x(t.clientX, t.clientY);
        var e = pt(i), n = e.boundingClientRect;
        return new x((t.clientX - n.left) / e.x - i.clientLeft, (t.clientY - n.top) / e.y - i.clientTop)
    }

    function Tt(t) {
        return bi ? t.wheelDeltaY / 2 : t.deltaY && 0 === t.deltaMode ? -t.deltaY / xe : t.deltaY && 1 === t.deltaMode ? 20 * -t.deltaY : t.deltaY && 2 === t.deltaMode ? 60 * -t.deltaY : t.deltaX || t.deltaZ ? 0 : t.wheelDelta ? (t.wheelDeltaY || t.wheelDelta) / 2 : t.detail && Math.abs(t.detail) < 32765 ? 20 * -t.detail : t.detail ? t.detail / -32765 * 60 : 0
    }

    function zt(t) {
        we[t.type] = !0
    }

    function Mt(t) {
        var i = we[t.type];
        return we[t.type] = !1, i
    }

    function Ct(t, i) {
        var e = i.relatedTarget;
        if (!e) return !0;
        try {
            for (; e && e !== t;) e = e.parentNode
        } catch (t) {
            return !1
        }
        return e !== t
    }

    function St(t, i) {
        var e = t.timeStamp || t.originalEvent && t.originalEvent.timeStamp, n = ge && e - ge;
        n && n > 100 && n < 500 || t.target._simulatedClick && !t._simulated ? Lt(t) : (ge = e, i(t))
    }

    function Zt(t, i) {
        if (!i || !t.length) return t.slice();
        var e = i * i;
        return t = Bt(t, e), t = kt(t, e)
    }

    function Et(t, i, e) {
        return Math.sqrt(Dt(t, i, e, !0))
    }

    function kt(t, i) {
        var e = t.length, n = new (typeof Uint8Array != void 0 + "" ? Uint8Array : Array)(e);
        n[0] = n[e - 1] = 1, At(t, n, i, 0, e - 1);
        var o, s = [];
        for (o = 0; o < e; o++) n[o] && s.push(t[o]);
        return s
    }

    function At(t, i, e, n, o) {
        var s, r, a, h = 0;
        for (r = n + 1; r <= o - 1; r++) (a = Dt(t[r], t[n], t[o], !0)) > h && (s = r, h = a);
        h > e && (i[s] = 1, At(t, i, e, n, s), At(t, i, e, s, o))
    }

    function Bt(t, i) {
        for (var e = [t[0]], n = 1, o = 0, s = t.length; n < s; n++) Nt(t[n], t[o]) > i && (e.push(t[n]), o = n);
        return o < s - 1 && e.push(t[s - 1]), e
    }

    function It(t, i, e, n, o) {
        var s, r, a, h = n ? ke : Rt(t, e), u = Rt(i, e);
        for (ke = u; ;) {
            if (!(h | u)) return [t, i];
            if (h & u) return !1;
            a = Rt(r = Ot(t, i, s = h || u, e, o), e), s === h ? (t = r, h = a) : (i = r, u = a)
        }
    }

    function Ot(t, i, e, n, o) {
        var s, r, a = i.x - t.x, h = i.y - t.y, u = n.min, l = n.max;
        return 8 & e ? (s = t.x + a * (l.y - t.y) / h, r = l.y) : 4 & e ? (s = t.x + a * (u.y - t.y) / h, r = u.y) : 2 & e ? (s = l.x, r = t.y + h * (l.x - t.x) / a) : 1 & e && (s = u.x, r = t.y + h * (u.x - t.x) / a), new x(s, r, o)
    }

    function Rt(t, i) {
        var e = 0;
        return t.x < i.min.x ? e |= 1 : t.x > i.max.x && (e |= 2), t.y < i.min.y ? e |= 4 : t.y > i.max.y && (e |= 8), e
    }

    function Nt(t, i) {
        var e = i.x - t.x, n = i.y - t.y;
        return e * e + n * n
    }

    function Dt(t, i, e, n) {
        var o, s = i.x, r = i.y, a = e.x - s, h = e.y - r, u = a * a + h * h;
        return u > 0 && ((o = ((t.x - s) * a + (t.y - r) * h) / u) > 1 ? (s = e.x, r = e.y) : o > 0 && (s += a * o, r += h * o)), a = t.x - s, h = t.y - r, n ? a * a + h * h : new x(s, r)
    }

    function jt(t) {
        return !oi(t[0]) || "object" != typeof t[0][0] && void 0 !== t[0][0]
    }

    function Wt(t) {
        return console.warn("Deprecated use of _flat, please use L.LineUtil.isFlat instead."), jt(t)
    }

    function Ht(t, i, e) {
        var n, o, s, r, a, h, u, l, c, _ = [1, 4, 2, 8];
        for (o = 0, u = t.length; o < u; o++) t[o]._code = Rt(t[o], i);
        for (r = 0; r < 4; r++) {
            for (l = _[r], n = [], o = 0, s = (u = t.length) - 1; o < u; s = o++) a = t[o], h = t[s], a._code & l ? h._code & l || ((c = Ot(h, a, l, i, e))._code = Rt(c, i), n.push(c)) : (h._code & l && ((c = Ot(h, a, l, i, e))._code = Rt(c, i), n.push(c)), n.push(a));
            t = n
        }
        return t
    }

    function Ft(t, i) {
        var e, n, o, s, r = "Feature" === t.type ? t.geometry : t, a = r ? r.coordinates : null, h = [],
            u = i && i.pointToLayer, l = i && i.coordsToLatLng || Ut;
        if (!a && !r) return null;
        switch (r.type) {
            case"Point":
                return e = l(a), u ? u(t, e) : new $e(e);
            case"MultiPoint":
                for (o = 0, s = a.length; o < s; o++) e = l(a[o]), h.push(u ? u(t, e) : new $e(e));
                return new Ke(h);
            case"LineString":
            case"MultiLineString":
                return n = Vt(a, "LineString" === r.type ? 0 : 1, l), new nn(n, i);
            case"Polygon":
            case"MultiPolygon":
                return n = Vt(a, "Polygon" === r.type ? 1 : 2, l), new on(n, i);
            case"GeometryCollection":
                for (o = 0, s = r.geometries.length; o < s; o++) {
                    var c = Ft({geometry: r.geometries[o], type: "Feature", properties: t.properties}, i);
                    c && h.push(c)
                }
                return new Ke(h);
            default:
                throw new Error("Invalid GeoJSON object.")
        }
    }

    function Ut(t) {
        return new M(t[1], t[0], t[2])
    }

    function Vt(t, i, e) {
        for (var n, o = [], s = 0, r = t.length; s < r; s++) n = i ? Vt(t[s], i - 1, e) : (e || Ut)(t[s]), o.push(n);
        return o
    }

    function qt(t, i) {
        return i = "number" == typeof i ? i : 6, void 0 !== t.alt ? [a(t.lng, i), a(t.lat, i), a(t.alt, i)] : [a(t.lng, i), a(t.lat, i)]
    }

    function Gt(t, i, e, n) {
        for (var o = [], s = 0, r = t.length; s < r; s++) o.push(i ? Gt(t[s], i - 1, e, n) : qt(t[s], n));
        return !i && e && o.push(o[0]), o
    }

    function Kt(t, e) {
        return t.feature ? i({}, t.feature, {geometry: e}) : Yt(e)
    }

    function Yt(t) {
        return "Feature" === t.type || "FeatureCollection" === t.type ? t : {
            type: "Feature",
            properties: {},
            geometry: t
        }
    }

    function Xt(t, i) {
        return new sn(t, i)
    }

    function Jt(t, i) {
        return new mn(t, i)
    }

    function $t(t) {
        return Xi ? new vn(t) : null
    }

    function Qt(t) {
        return Ji || $i ? new Pn(t) : null
    }

    var ti = Object.freeze;
    Object.freeze = function (t) {
        return t
    };
    var ii = Object.create || function () {
            function t() {
            }

            return function (i) {
                return t.prototype = i, new t
            }
        }(), ei = 0, ni = /\{ *([\w_-]+) *\}/g, oi = Array.isArray || function (t) {
            return "[object Array]" === Object.prototype.toString.call(t)
        }, si = "data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=", ri = 0,
        ai = window.requestAnimationFrame || p("RequestAnimationFrame") || m,
        hi = window.cancelAnimationFrame || p("CancelAnimationFrame") || p("CancelRequestAnimationFrame") || function (t) {
            window.clearTimeout(t)
        }, ui = (Object.freeze || Object)({
            freeze: ti,
            extend: i,
            create: ii,
            bind: e,
            lastId: ei,
            stamp: n,
            throttle: o,
            wrapNum: s,
            falseFn: r,
            formatNum: a,
            trim: h,
            splitWords: u,
            setOptions: l,
            getParamString: c,
            template: _,
            isArray: oi,
            indexOf: d,
            emptyImageUrl: si,
            requestFn: ai,
            cancelFn: hi,
            requestAnimFrame: f,
            cancelAnimFrame: g
        });
    v.extend = function (t) {
        var e = function () {
            this.initialize && this.initialize.apply(this, arguments), this.callInitHooks()
        }, n = e.__super__ = this.prototype, o = ii(n);
        o.constructor = e, e.prototype = o;
        for (var s in this) this.hasOwnProperty(s) && "prototype" !== s && "__super__" !== s && (e[s] = this[s]);
        return t.statics && (i(e, t.statics), delete t.statics), t.includes && (y(t.includes), i.apply(null, [o].concat(t.includes)), delete t.includes), o.options && (t.options = i(ii(o.options), t.options)), i(o, t), o._initHooks = [], o.callInitHooks = function () {
            if (!this._initHooksCalled) {
                n.callInitHooks && n.callInitHooks.call(this), this._initHooksCalled = !0;
                for (var t = 0, i = o._initHooks.length; t < i; t++) o._initHooks[t].call(this)
            }
        }, e
    }, v.include = function (t) {
        return i(this.prototype, t), this
    }, v.mergeOptions = function (t) {
        return i(this.prototype.options, t), this
    }, v.addInitHook = function (t) {
        var i = Array.prototype.slice.call(arguments, 1), e = "function" == typeof t ? t : function () {
            this[t].apply(this, i)
        };
        return this.prototype._initHooks = this.prototype._initHooks || [], this.prototype._initHooks.push(e), this
    };
    var li = {
        on: function (t, i, e) {
            if ("object" == typeof t) for (var n in t) this._on(n, t[n], i); else for (var o = 0, s = (t = u(t)).length; o < s; o++) this._on(t[o], i, e);
            return this
        }, off: function (t, i, e) {
            if (t) if ("object" == typeof t) for (var n in t) this._off(n, t[n], i); else for (var o = 0, s = (t = u(t)).length; o < s; o++) this._off(t[o], i, e); else delete this._events;
            return this
        }, _on: function (t, i, e) {
            this._events = this._events || {};
            var n = this._events[t];
            n || (n = [], this._events[t] = n), e === this && (e = void 0);
            for (var o = {
                fn: i,
                ctx: e
            }, s = n, r = 0, a = s.length; r < a; r++) if (s[r].fn === i && s[r].ctx === e) return;
            s.push(o)
        }, _off: function (t, i, e) {
            var n, o, s;
            if (this._events && (n = this._events[t])) if (i) {
                if (e === this && (e = void 0), n) for (o = 0, s = n.length; o < s; o++) {
                    var a = n[o];
                    if (a.ctx === e && a.fn === i) return a.fn = r, this._firingCount && (this._events[t] = n = n.slice()), void n.splice(o, 1)
                }
            } else {
                for (o = 0, s = n.length; o < s; o++) n[o].fn = r;
                delete this._events[t]
            }
        }, fire: function (t, e, n) {
            if (!this.listens(t, n)) return this;
            var o = i({}, e, {type: t, target: this, sourceTarget: e && e.sourceTarget || this});
            if (this._events) {
                var s = this._events[t];
                if (s) {
                    this._firingCount = this._firingCount + 1 || 1;
                    for (var r = 0, a = s.length; r < a; r++) {
                        var h = s[r];
                        h.fn.call(h.ctx || this, o)
                    }
                    this._firingCount--
                }
            }
            return n && this._propagateEvent(o), this
        }, listens: function (t, i) {
            var e = this._events && this._events[t];
            if (e && e.length) return !0;
            if (i) for (var n in this._eventParents) if (this._eventParents[n].listens(t, i)) return !0;
            return !1
        }, once: function (t, i, n) {
            if ("object" == typeof t) {
                for (var o in t) this.once(o, t[o], i);
                return this
            }
            var s = e(function () {
                this.off(t, i, n).off(t, s, n)
            }, this);
            return this.on(t, i, n).on(t, s, n)
        }, addEventParent: function (t) {
            return this._eventParents = this._eventParents || {}, this._eventParents[n(t)] = t, this
        }, removeEventParent: function (t) {
            return this._eventParents && delete this._eventParents[n(t)], this
        }, _propagateEvent: function (t) {
            for (var e in this._eventParents) this._eventParents[e].fire(t.type, i({
                layer: t.target,
                propagatedFrom: t.target
            }, t), !0)
        }
    };
    li.addEventListener = li.on, li.removeEventListener = li.clearAllEventListeners = li.off, li.addOneTimeEventListener = li.once, li.fireEvent = li.fire, li.hasEventListeners = li.listens;
    var ci = v.extend(li), _i = Math.trunc || function (t) {
        return t > 0 ? Math.floor(t) : Math.ceil(t)
    };
    x.prototype = {
        clone: function () {
            return new x(this.x, this.y)
        }, add: function (t) {
            return this.clone()._add(w(t))
        }, _add: function (t) {
            return this.x += t.x, this.y += t.y, this
        }, subtract: function (t) {
            return this.clone()._subtract(w(t))
        }, _subtract: function (t) {
            return this.x -= t.x, this.y -= t.y, this
        }, divideBy: function (t) {
            return this.clone()._divideBy(t)
        }, _divideBy: function (t) {
            return this.x /= t, this.y /= t, this
        }, multiplyBy: function (t) {
            return this.clone()._multiplyBy(t)
        }, _multiplyBy: function (t) {
            return this.x *= t, this.y *= t, this
        }, scaleBy: function (t) {
            return new x(this.x * t.x, this.y * t.y)
        }, unscaleBy: function (t) {
            return new x(this.x / t.x, this.y / t.y)
        }, round: function () {
            return this.clone()._round()
        }, _round: function () {
            return this.x = Math.round(this.x), this.y = Math.round(this.y), this
        }, floor: function () {
            return this.clone()._floor()
        }, _floor: function () {
            return this.x = Math.floor(this.x), this.y = Math.floor(this.y), this
        }, ceil: function () {
            return this.clone()._ceil()
        }, _ceil: function () {
            return this.x = Math.ceil(this.x), this.y = Math.ceil(this.y), this
        }, trunc: function () {
            return this.clone()._trunc()
        }, _trunc: function () {
            return this.x = _i(this.x), this.y = _i(this.y), this
        }, distanceTo: function (t) {
            var i = (t = w(t)).x - this.x, e = t.y - this.y;
            return Math.sqrt(i * i + e * e)
        }, equals: function (t) {
            return (t = w(t)).x === this.x && t.y === this.y
        }, contains: function (t) {
            return t = w(t), Math.abs(t.x) <= Math.abs(this.x) && Math.abs(t.y) <= Math.abs(this.y)
        }, toString: function () {
            return "Point(" + a(this.x) + ", " + a(this.y) + ")"
        }
    }, P.prototype = {
        extend: function (t) {
            return t = w(t), this.min || this.max ? (this.min.x = Math.min(t.x, this.min.x), this.max.x = Math.max(t.x, this.max.x), this.min.y = Math.min(t.y, this.min.y), this.max.y = Math.max(t.y, this.max.y)) : (this.min = t.clone(), this.max = t.clone()), this
        }, getCenter: function (t) {
            return new x((this.min.x + this.max.x) / 2, (this.min.y + this.max.y) / 2, t)
        }, getBottomLeft: function () {
            return new x(this.min.x, this.max.y)
        }, getTopRight: function () {
            return new x(this.max.x, this.min.y)
        }, getTopLeft: function () {
            return this.min
        }, getBottomRight: function () {
            return this.max
        }, getSize: function () {
            return this.max.subtract(this.min)
        }, contains: function (t) {
            var i, e;
            return (t = "number" == typeof t[0] || t instanceof x ? w(t) : b(t)) instanceof P ? (i = t.min, e = t.max) : i = e = t, i.x >= this.min.x && e.x <= this.max.x && i.y >= this.min.y && e.y <= this.max.y
        }, intersects: function (t) {
            t = b(t);
            var i = this.min, e = this.max, n = t.min, o = t.max, s = o.x >= i.x && n.x <= e.x,
                r = o.y >= i.y && n.y <= e.y;
            return s && r
        }, overlaps: function (t) {
            t = b(t);
            var i = this.min, e = this.max, n = t.min, o = t.max, s = o.x > i.x && n.x < e.x,
                r = o.y > i.y && n.y < e.y;
            return s && r
        }, isValid: function () {
            return !(!this.min || !this.max)
        }
    }, T.prototype = {
        extend: function (t) {
            var i, e, n = this._southWest, o = this._northEast;
            if (t instanceof M) i = t, e = t; else {
                if (!(t instanceof T)) return t ? this.extend(C(t) || z(t)) : this;
                if (i = t._southWest, e = t._northEast, !i || !e) return this
            }
            return n || o ? (n.lat = Math.min(i.lat, n.lat), n.lng = Math.min(i.lng, n.lng), o.lat = Math.max(e.lat, o.lat), o.lng = Math.max(e.lng, o.lng)) : (this._southWest = new M(i.lat, i.lng), this._northEast = new M(e.lat, e.lng)), this
        }, pad: function (t) {
            var i = this._southWest, e = this._northEast, n = Math.abs(i.lat - e.lat) * t,
                o = Math.abs(i.lng - e.lng) * t;
            return new T(new M(i.lat - n, i.lng - o), new M(e.lat + n, e.lng + o))
        }, getCenter: function () {
            return new M((this._southWest.lat + this._northEast.lat) / 2, (this._southWest.lng + this._northEast.lng) / 2)
        }, getSouthWest: function () {
            return this._southWest
        }, getNorthEast: function () {
            return this._northEast
        }, getNorthWest: function () {
            return new M(this.getNorth(), this.getWest())
        }, getSouthEast: function () {
            return new M(this.getSouth(), this.getEast())
        }, getWest: function () {
            return this._southWest.lng
        }, getSouth: function () {
            return this._southWest.lat
        }, getEast: function () {
            return this._northEast.lng
        }, getNorth: function () {
            return this._northEast.lat
        }, contains: function (t) {
            t = "number" == typeof t[0] || t instanceof M || "lat" in t ? C(t) : z(t);
            var i, e, n = this._southWest, o = this._northEast;
            return t instanceof T ? (i = t.getSouthWest(), e = t.getNorthEast()) : i = e = t, i.lat >= n.lat && e.lat <= o.lat && i.lng >= n.lng && e.lng <= o.lng
        }, intersects: function (t) {
            t = z(t);
            var i = this._southWest, e = this._northEast, n = t.getSouthWest(), o = t.getNorthEast(),
                s = o.lat >= i.lat && n.lat <= e.lat, r = o.lng >= i.lng && n.lng <= e.lng;
            return s && r
        }, overlaps: function (t) {
            t = z(t);
            var i = this._southWest, e = this._northEast, n = t.getSouthWest(), o = t.getNorthEast(),
                s = o.lat > i.lat && n.lat < e.lat, r = o.lng > i.lng && n.lng < e.lng;
            return s && r
        }, toBBoxString: function () {
            return [this.getWest(), this.getSouth(), this.getEast(), this.getNorth()].join(",")
        }, equals: function (t, i) {
            return !!t && (t = z(t), this._southWest.equals(t.getSouthWest(), i) && this._northEast.equals(t.getNorthEast(), i))
        }, isValid: function () {
            return !(!this._southWest || !this._northEast)
        }
    }, M.prototype = {
        equals: function (t, i) {
            return !!t && (t = C(t), Math.max(Math.abs(this.lat - t.lat), Math.abs(this.lng - t.lng)) <= (void 0 === i ? 1e-9 : i))
        }, toString: function (t) {
            return "LatLng(" + a(this.lat, t) + ", " + a(this.lng, t) + ")"
        }, distanceTo: function (t) {
            return pi.distance(this, C(t))
        }, wrap: function () {
            return pi.wrapLatLng(this)
        }, toBounds: function (t) {
            var i = 180 * t / 40075017, e = i / Math.cos(Math.PI / 180 * this.lat);
            return z([this.lat - i, this.lng - e], [this.lat + i, this.lng + e])
        }, clone: function () {
            return new M(this.lat, this.lng, this.alt)
        }
    };
    var di = {
        latLngToPoint: function (t, i) {
            var e = this.projection.project(t), n = this.scale(i);
            return this.transformation._transform(e, n)
        }, pointToLatLng: function (t, i) {
            var e = this.scale(i), n = this.transformation.untransform(t, e);
            return this.projection.unproject(n)
        }, project: function (t) {
            return this.projection.project(t)
        }, unproject: function (t) {
            return this.projection.unproject(t)
        }, scale: function (t) {
            return 256 * Math.pow(2, t)
        }, zoom: function (t) {
            return Math.log(t / 256) / Math.LN2
        }, getProjectedBounds: function (t) {
            if (this.infinite) return null;
            var i = this.projection.bounds, e = this.scale(t);
            return new P(this.transformation.transform(i.min, e), this.transformation.transform(i.max, e))
        }, infinite: !1, wrapLatLng: function (t) {
            var i = this.wrapLng ? s(t.lng, this.wrapLng, !0) : t.lng;
            return new M(this.wrapLat ? s(t.lat, this.wrapLat, !0) : t.lat, i, t.alt)
        }, wrapLatLngBounds: function (t) {
            var i = t.getCenter(), e = this.wrapLatLng(i), n = i.lat - e.lat, o = i.lng - e.lng;
            if (0 === n && 0 === o) return t;
            var s = t.getSouthWest(), r = t.getNorthEast();
            return new T(new M(s.lat - n, s.lng - o), new M(r.lat - n, r.lng - o))
        }
    }, pi = i({}, di, {
        wrapLng: [-180, 180], R: 6371e3, distance: function (t, i) {
            var e = Math.PI / 180, n = t.lat * e, o = i.lat * e, s = Math.sin((i.lat - t.lat) * e / 2),
                r = Math.sin((i.lng - t.lng) * e / 2), a = s * s + Math.cos(n) * Math.cos(o) * r * r,
                h = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            return this.R * h
        }
    }), mi = {
        R: 6378137, MAX_LATITUDE: 85.0511287798, project: function (t) {
            var i = Math.PI / 180, e = this.MAX_LATITUDE, n = Math.max(Math.min(e, t.lat), -e), o = Math.sin(n * i);
            return new x(this.R * t.lng * i, this.R * Math.log((1 + o) / (1 - o)) / 2)
        }, unproject: function (t) {
            var i = 180 / Math.PI;
            return new M((2 * Math.atan(Math.exp(t.y / this.R)) - Math.PI / 2) * i, t.x * i / this.R)
        }, bounds: function () {
            var t = 6378137 * Math.PI;
            return new P([-t, -t], [t, t])
        }()
    };
    S.prototype = {
        transform: function (t, i) {
            return this._transform(t.clone(), i)
        }, _transform: function (t, i) {
            return i = i || 1, t.x = i * (this._a * t.x + this._b), t.y = i * (this._c * t.y + this._d), t
        }, untransform: function (t, i) {
            return i = i || 1, new x((t.x / i - this._b) / this._a, (t.y / i - this._d) / this._c)
        }
    };
    var fi, gi, vi, yi = i({}, pi, {
            code: "EPSG:3857", projection: mi, transformation: function () {
                var t = .5 / (Math.PI * mi.R);
                return Z(t, .5, -t, .5)
            }()
        }), xi = i({}, yi, {code: "EPSG:900913"}), wi = document.documentElement.style, Pi = "ActiveXObject" in window,
        Li = Pi && !document.addEventListener, bi = "msLaunchUri" in navigator && !("documentMode" in document),
        Ti = A("webkit"), zi = A("android"), Mi = A("android 2") || A("android 3"),
        Ci = parseInt(/WebKit\/([0-9]+)|$/.exec(navigator.userAgent)[1], 10),
        Si = zi && A("Google") && Ci < 537 && !("AudioNode" in window), Zi = !!window.opera, Ei = A("chrome"),
        ki = A("gecko") && !Ti && !Zi && !Pi, Ai = !Ei && A("safari"), Bi = A("phantom"), Ii = "OTransition" in wi,
        Oi = 0 === navigator.platform.indexOf("Win"), Ri = Pi && "transition" in wi,
        Ni = "WebKitCSSMatrix" in window && "m11" in new window.WebKitCSSMatrix && !Mi, Di = "MozPerspective" in wi,
        ji = !window.L_DISABLE_3D && (Ri || Ni || Di) && !Ii && !Bi,
        Wi = "undefined" != typeof orientation || A("mobile"), Hi = Wi && Ti, Fi = Wi && Ni,
        Ui = !window.PointerEvent && window.MSPointerEvent, Vi = !(!window.PointerEvent && !Ui),
        qi = !window.L_NO_TOUCH && (Vi || "ontouchstart" in window || window.DocumentTouch && document instanceof window.DocumentTouch),
        Gi = Wi && Zi, Ki = Wi && ki,
        Yi = (window.devicePixelRatio || window.screen.deviceXDPI / window.screen.logicalXDPI) > 1,
        Xi = !!document.createElement("canvas").getContext,
        Ji = !(!document.createElementNS || !E("svg").createSVGRect), $i = !Ji && function () {
            try {
                var t = document.createElement("div");
                t.innerHTML = '<v:shape adj="1"/>';
                var i = t.firstChild;
                return i.style.behavior = "url(#default#VML)", i && "object" == typeof i.adj
            } catch (t) {
                return !1
            }
        }(), Qi = (Object.freeze || Object)({
            ie: Pi,
            ielt9: Li,
            edge: bi,
            webkit: Ti,
            android: zi,
            android23: Mi,
            androidStock: Si,
            opera: Zi,
            chrome: Ei,
            gecko: ki,
            safari: Ai,
            phantom: Bi,
            opera12: Ii,
            win: Oi,
            ie3d: Ri,
            webkit3d: Ni,
            gecko3d: Di,
            any3d: ji,
            mobile: Wi,
            mobileWebkit: Hi,
            mobileWebkit3d: Fi,
            msPointer: Ui,
            pointer: Vi,
            touch: qi,
            mobileOpera: Gi,
            mobileGecko: Ki,
            retina: Yi,
            canvas: Xi,
            svg: Ji,
            vml: $i
        }), te = Ui ? "MSPointerDown" : "pointerdown", ie = Ui ? "MSPointerMove" : "pointermove",
        ee = Ui ? "MSPointerUp" : "pointerup", ne = Ui ? "MSPointerCancel" : "pointercancel",
        oe = ["INPUT", "SELECT", "OPTION"], se = {}, re = !1, ae = 0,
        he = Ui ? "MSPointerDown" : Vi ? "pointerdown" : "touchstart",
        ue = Ui ? "MSPointerUp" : Vi ? "pointerup" : "touchend", le = "_leaflet_",
        ce = st(["transform", "webkitTransform", "OTransform", "MozTransform", "msTransform"]),
        _e = st(["webkitTransition", "transition", "OTransition", "MozTransition", "msTransition"]),
        de = "webkitTransition" === _e || "OTransition" === _e ? _e + "End" : "transitionend";
    if ("onselectstart" in document) fi = function () {
        mt(window, "selectstart", Pt)
    }, gi = function () {
        ft(window, "selectstart", Pt)
    }; else {
        var pe = st(["userSelect", "WebkitUserSelect", "OUserSelect", "MozUserSelect", "msUserSelect"]);
        fi = function () {
            if (pe) {
                var t = document.documentElement.style;
                vi = t[pe], t[pe] = "none"
            }
        }, gi = function () {
            pe && (document.documentElement.style[pe] = vi, vi = void 0)
        }
    }
    var me, fe, ge, ve = (Object.freeze || Object)({
            TRANSFORM: ce,
            TRANSITION: _e,
            TRANSITION_END: de,
            get: V,
            getStyle: q,
            create: G,
            remove: K,
            empty: Y,
            toFront: X,
            toBack: J,
            hasClass: $,
            addClass: Q,
            removeClass: tt,
            setClass: it,
            getClass: et,
            setOpacity: nt,
            testProp: st,
            setTransform: rt,
            setPosition: at,
            getPosition: ht,
            disableTextSelection: fi,
            enableTextSelection: gi,
            disableImageDrag: ut,
            enableImageDrag: lt,
            preventOutline: ct,
            restoreOutline: _t,
            getSizedParentNode: dt,
            getScale: pt
        }), ye = "_leaflet_events", xe = Oi && Ei ? 2 * window.devicePixelRatio : ki ? window.devicePixelRatio : 1, we = {},
        Pe = (Object.freeze || Object)({
            on: mt,
            off: ft,
            stopPropagation: yt,
            disableScrollPropagation: xt,
            disableClickPropagation: wt,
            preventDefault: Pt,
            stop: Lt,
            getMousePosition: bt,
            getWheelDelta: Tt,
            fakeStop: zt,
            skipped: Mt,
            isExternalTarget: Ct,
            addListener: mt,
            removeListener: ft
        }), Le = ci.extend({
            run: function (t, i, e, n) {
                this.stop(), this._el = t, this._inProgress = !0, this._duration = e || .25, this._easeOutPower = 1 / Math.max(n || .5, .2), this._startPos = ht(t), this._offset = i.subtract(this._startPos), this._startTime = +new Date, this.fire("start"), this._animate()
            }, stop: function () {
                this._inProgress && (this._step(!0), this._complete())
            }, _animate: function () {
                this._animId = f(this._animate, this), this._step()
            }, _step: function (t) {
                var i = +new Date - this._startTime, e = 1e3 * this._duration;
                i < e ? this._runFrame(this._easeOut(i / e), t) : (this._runFrame(1), this._complete())
            }, _runFrame: function (t, i) {
                var e = this._startPos.add(this._offset.multiplyBy(t));
                i && e._round(), at(this._el, e), this.fire("step")
            }, _complete: function () {
                g(this._animId), this._inProgress = !1, this.fire("end")
            }, _easeOut: function (t) {
                return 1 - Math.pow(1 - t, this._easeOutPower)
            }
        }), be = ci.extend({
            options: {
                crs: yi,
                center: void 0,
                zoom: void 0,
                minZoom: void 0,
                maxZoom: void 0,
                layers: [],
                maxBounds: void 0,
                renderer: void 0,
                zoomAnimation: !0,
                zoomAnimationThreshold: 4,
                fadeAnimation: !0,
                markerZoomAnimation: !0,
                transform3DLimit: 8388608,
                zoomSnap: 1,
                zoomDelta: 1,
                trackResize: !0
            },
            initialize: function (t, i) {
                i = l(this, i), this._initContainer(t), this._initLayout(), this._onResize = e(this._onResize, this), this._initEvents(), i.maxBounds && this.setMaxBounds(i.maxBounds), void 0 !== i.zoom && (this._zoom = this._limitZoom(i.zoom)), i.center && void 0 !== i.zoom && this.setView(C(i.center), i.zoom, {reset: !0}), this._handlers = [], this._layers = {}, this._zoomBoundLayers = {}, this._sizeChanged = !0, this.callInitHooks(), this._zoomAnimated = _e && ji && !Gi && this.options.zoomAnimation, this._zoomAnimated && (this._createAnimProxy(), mt(this._proxy, de, this._catchTransitionEnd, this)), this._addLayers(this.options.layers)
            },
            setView: function (t, e, n) {
                return e = void 0 === e ? this._zoom : this._limitZoom(e), t = this._limitCenter(C(t), e, this.options.maxBounds), n = n || {}, this._stop(), this._loaded && !n.reset && !0 !== n && (void 0 !== n.animate && (n.zoom = i({animate: n.animate}, n.zoom), n.pan = i({
                    animate: n.animate,
                    duration: n.duration
                }, n.pan)), this._zoom !== e ? this._tryAnimatedZoom && this._tryAnimatedZoom(t, e, n.zoom) : this._tryAnimatedPan(t, n.pan)) ? (clearTimeout(this._sizeTimer), this) : (this._resetView(t, e), this)
            },
            setZoom: function (t, i) {
                return this._loaded ? this.setView(this.getCenter(), t, {zoom: i}) : (this._zoom = t, this)
            },
            zoomIn: function (t, i) {
                return t = t || (ji ? this.options.zoomDelta : 1), this.setZoom(this._zoom + t, i)
            },
            zoomOut: function (t, i) {
                return t = t || (ji ? this.options.zoomDelta : 1), this.setZoom(this._zoom - t, i)
            },
            setZoomAround: function (t, i, e) {
                var n = this.getZoomScale(i), o = this.getSize().divideBy(2),
                    s = (t instanceof x ? t : this.latLngToContainerPoint(t)).subtract(o).multiplyBy(1 - 1 / n),
                    r = this.containerPointToLatLng(o.add(s));
                return this.setView(r, i, {zoom: e})
            },
            _getBoundsCenterZoom: function (t, i) {
                i = i || {}, t = t.getBounds ? t.getBounds() : z(t);
                var e = w(i.paddingTopLeft || i.padding || [0, 0]), n = w(i.paddingBottomRight || i.padding || [0, 0]),
                    o = this.getBoundsZoom(t, !1, e.add(n));
                if ((o = "number" == typeof i.maxZoom ? Math.min(i.maxZoom, o) : o) === 1 / 0) return {
                    center: t.getCenter(),
                    zoom: o
                };
                var s = n.subtract(e).divideBy(2), r = this.project(t.getSouthWest(), o),
                    a = this.project(t.getNorthEast(), o);
                return {center: this.unproject(r.add(a).divideBy(2).add(s), o), zoom: o}
            },
            fitBounds: function (t, i) {
                if (!(t = z(t)).isValid()) throw new Error("Bounds are not valid.");
                var e = this._getBoundsCenterZoom(t, i);
                return this.setView(e.center, e.zoom, i)
            },
            fitWorld: function (t) {
                return this.fitBounds([[-90, -180], [90, 180]], t)
            },
            panTo: function (t, i) {
                return this.setView(t, this._zoom, {pan: i})
            },
            panBy: function (t, i) {
                if (t = w(t).round(), i = i || {}, !t.x && !t.y) return this.fire("moveend");
                if (!0 !== i.animate && !this.getSize().contains(t)) return this._resetView(this.unproject(this.project(this.getCenter()).add(t)), this.getZoom()), this;
                if (this._panAnim || (this._panAnim = new Le, this._panAnim.on({
                    step: this._onPanTransitionStep,
                    end: this._onPanTransitionEnd
                }, this)), i.noMoveStart || this.fire("movestart"), !1 !== i.animate) {
                    Q(this._mapPane, "leaflet-pan-anim");
                    var e = this._getMapPanePos().subtract(t).round();
                    this._panAnim.run(this._mapPane, e, i.duration || .25, i.easeLinearity)
                } else this._rawPanBy(t), this.fire("move").fire("moveend");
                return this
            },
            flyTo: function (t, i, e) {
                function n(t) {
                    var i = (g * g - m * m + (t ? -1 : 1) * x * x * v * v) / (2 * (t ? g : m) * x * v),
                        e = Math.sqrt(i * i + 1) - i;
                    return e < 1e-9 ? -18 : Math.log(e)
                }

                function o(t) {
                    return (Math.exp(t) - Math.exp(-t)) / 2
                }

                function s(t) {
                    return (Math.exp(t) + Math.exp(-t)) / 2
                }

                function r(t) {
                    return o(t) / s(t)
                }

                function a(t) {
                    return m * (s(w) / s(w + y * t))
                }

                function h(t) {
                    return m * (s(w) * r(w + y * t) - o(w)) / x
                }

                function u(t) {
                    return 1 - Math.pow(1 - t, 1.5)
                }

                function l() {
                    var e = (Date.now() - P) / b, n = u(e) * L;
                    e <= 1 ? (this._flyToFrame = f(l, this), this._move(this.unproject(c.add(_.subtract(c).multiplyBy(h(n) / v)), p), this.getScaleZoom(m / a(n), p), {flyTo: !0})) : this._move(t, i)._moveEnd(!0)
                }

                if (!1 === (e = e || {}).animate || !ji) return this.setView(t, i, e);
                this._stop();
                var c = this.project(this.getCenter()), _ = this.project(t), d = this.getSize(), p = this._zoom;
                t = C(t), i = void 0 === i ? p : i;
                var m = Math.max(d.x, d.y), g = m * this.getZoomScale(p, i), v = _.distanceTo(c) || 1, y = 1.42, x = y * y,
                    w = n(0), P = Date.now(), L = (n(1) - w) / y, b = e.duration ? 1e3 * e.duration : 1e3 * L * .8;
                return this._moveStart(!0, e.noMoveStart), l.call(this), this
            },
            flyToBounds: function (t, i) {
                var e = this._getBoundsCenterZoom(t, i);
                return this.flyTo(e.center, e.zoom, i)
            },
            setMaxBounds: function (t) {
                return (t = z(t)).isValid() ? (this.options.maxBounds && this.off("moveend", this._panInsideMaxBounds), this.options.maxBounds = t, this._loaded && this._panInsideMaxBounds(), this.on("moveend", this._panInsideMaxBounds)) : (this.options.maxBounds = null, this.off("moveend", this._panInsideMaxBounds))
            },
            setMinZoom: function (t) {
                var i = this.options.minZoom;
                return this.options.minZoom = t, this._loaded && i !== t && (this.fire("zoomlevelschange"), this.getZoom() < this.options.minZoom) ? this.setZoom(t) : this
            },
            setMaxZoom: function (t) {
                var i = this.options.maxZoom;
                return this.options.maxZoom = t, this._loaded && i !== t && (this.fire("zoomlevelschange"), this.getZoom() > this.options.maxZoom) ? this.setZoom(t) : this
            },
            panInsideBounds: function (t, i) {
                this._enforcingBounds = !0;
                var e = this.getCenter(), n = this._limitCenter(e, this._zoom, z(t));
                return e.equals(n) || this.panTo(n, i), this._enforcingBounds = !1, this
            },
            invalidateSize: function (t) {
                if (!this._loaded) return this;
                t = i({animate: !1, pan: !0}, !0 === t ? {animate: !0} : t);
                var n = this.getSize();
                this._sizeChanged = !0, this._lastCenter = null;
                var o = this.getSize(), s = n.divideBy(2).round(), r = o.divideBy(2).round(), a = s.subtract(r);
                return a.x || a.y ? (t.animate && t.pan ? this.panBy(a) : (t.pan && this._rawPanBy(a), this.fire("move"), t.debounceMoveend ? (clearTimeout(this._sizeTimer), this._sizeTimer = setTimeout(e(this.fire, this, "moveend"), 200)) : this.fire("moveend")), this.fire("resize", {
                    oldSize: n,
                    newSize: o
                })) : this
            },
            stop: function () {
                return this.setZoom(this._limitZoom(this._zoom)), this.options.zoomSnap || this.fire("viewreset"), this._stop()
            },
            locate: function (t) {
                if (t = this._locateOptions = i({
                    timeout: 1e4,
                    watch: !1
                }, t), !("geolocation" in navigator)) return this._handleGeolocationError({
                    code: 0,
                    message: "Geolocation not supported."
                }), this;
                var n = e(this._handleGeolocationResponse, this), o = e(this._handleGeolocationError, this);
                return t.watch ? this._locationWatchId = navigator.geolocation.watchPosition(n, o, t) : navigator.geolocation.getCurrentPosition(n, o, t), this
            },
            stopLocate: function () {
                return navigator.geolocation && navigator.geolocation.clearWatch && navigator.geolocation.clearWatch(this._locationWatchId), this._locateOptions && (this._locateOptions.setView = !1), this
            },
            _handleGeolocationError: function (t) {
                var i = t.code,
                    e = t.message || (1 === i ? "permission denied" : 2 === i ? "position unavailable" : "timeout");
                this._locateOptions.setView && !this._loaded && this.fitWorld(), this.fire("locationerror", {
                    code: i,
                    message: "Geolocation error: " + e + "."
                })
            },
            _handleGeolocationResponse: function (t) {
                var i = new M(t.coords.latitude, t.coords.longitude), e = i.toBounds(2 * t.coords.accuracy),
                    n = this._locateOptions;
                if (n.setView) {
                    var o = this.getBoundsZoom(e);
                    this.setView(i, n.maxZoom ? Math.min(o, n.maxZoom) : o)
                }
                var s = {latlng: i, bounds: e, timestamp: t.timestamp};
                for (var r in t.coords) "number" == typeof t.coords[r] && (s[r] = t.coords[r]);
                this.fire("locationfound", s)
            },
            addHandler: function (t, i) {
                if (!i) return this;
                var e = this[t] = new i(this);
                return this._handlers.push(e), this.options[t] && e.enable(), this
            },
            remove: function () {
                if (this._initEvents(!0), this._containerId !== this._container._leaflet_id) throw new Error("Map container is being reused by another instance");
                try {
                    delete this._container._leaflet_id, delete this._containerId
                } catch (t) {
                    this._container._leaflet_id = void 0, this._containerId = void 0
                }
                void 0 !== this._locationWatchId && this.stopLocate(), this._stop(), K(this._mapPane), this._clearControlPos && this._clearControlPos(), this._resizeRequest && (g(this._resizeRequest), this._resizeRequest = null), this._clearHandlers(), this._loaded && this.fire("unload");
                var t;
                for (t in this._layers) this._layers[t].remove();
                for (t in this._panes) K(this._panes[t]);
                return this._layers = [], this._panes = [], delete this._mapPane, delete this._renderer, this
            },
            createPane: function (t, i) {
                var e = G("div", "leaflet-pane" + (t ? " leaflet-" + t.replace("Pane", "") + "-pane" : ""), i || this._mapPane);
                return t && (this._panes[t] = e), e
            },
            getCenter: function () {
                return this._checkIfLoaded(), this._lastCenter && !this._moved() ? this._lastCenter : this.layerPointToLatLng(this._getCenterLayerPoint())
            },
            getZoom: function () {
                return this._zoom
            },
            getBounds: function () {
                var t = this.getPixelBounds();
                return new T(this.unproject(t.getBottomLeft()), this.unproject(t.getTopRight()))
            },
            getMinZoom: function () {
                return void 0 === this.options.minZoom ? this._layersMinZoom || 0 : this.options.minZoom
            },
            getMaxZoom: function () {
                return void 0 === this.options.maxZoom ? void 0 === this._layersMaxZoom ? 1 / 0 : this._layersMaxZoom : this.options.maxZoom
            },
            getBoundsZoom: function (t, i, e) {
                t = z(t), e = w(e || [0, 0]);
                var n = this.getZoom() || 0, o = this.getMinZoom(), s = this.getMaxZoom(), r = t.getNorthWest(),
                    a = t.getSouthEast(), h = this.getSize().subtract(e),
                    u = b(this.project(a, n), this.project(r, n)).getSize(), l = ji ? this.options.zoomSnap : 1,
                    c = h.x / u.x, _ = h.y / u.y, d = i ? Math.max(c, _) : Math.min(c, _);
                return n = this.getScaleZoom(d, n), l && (n = Math.round(n / (l / 100)) * (l / 100), n = i ? Math.ceil(n / l) * l : Math.floor(n / l) * l), Math.max(o, Math.min(s, n))
            },
            getSize: function () {
                return this._size && !this._sizeChanged || (this._size = new x(this._container.clientWidth || 0, this._container.clientHeight || 0), this._sizeChanged = !1), this._size.clone()
            },
            getPixelBounds: function (t, i) {
                var e = this._getTopLeftPoint(t, i);
                return new P(e, e.add(this.getSize()))
            },
            getPixelOrigin: function () {
                return this._checkIfLoaded(), this._pixelOrigin
            },
            getPixelWorldBounds: function (t) {
                return this.options.crs.getProjectedBounds(void 0 === t ? this.getZoom() : t)
            },
            getPane: function (t) {
                return "string" == typeof t ? this._panes[t] : t
            },
            getPanes: function () {
                return this._panes
            },
            getContainer: function () {
                return this._container
            },
            getZoomScale: function (t, i) {
                var e = this.options.crs;
                return i = void 0 === i ? this._zoom : i, e.scale(t) / e.scale(i)
            },
            getScaleZoom: function (t, i) {
                var e = this.options.crs;
                i = void 0 === i ? this._zoom : i;
                var n = e.zoom(t * e.scale(i));
                return isNaN(n) ? 1 / 0 : n
            },
            project: function (t, i) {
                return i = void 0 === i ? this._zoom : i, this.options.crs.latLngToPoint(C(t), i)
            },
            unproject: function (t, i) {
                return i = void 0 === i ? this._zoom : i, this.options.crs.pointToLatLng(w(t), i)
            },
            layerPointToLatLng: function (t) {
                var i = w(t).add(this.getPixelOrigin());
                return this.unproject(i)
            },
            latLngToLayerPoint: function (t) {
                return this.project(C(t))._round()._subtract(this.getPixelOrigin())
            },
            wrapLatLng: function (t) {
                return this.options.crs.wrapLatLng(C(t))
            },
            wrapLatLngBounds: function (t) {
                return this.options.crs.wrapLatLngBounds(z(t))
            },
            distance: function (t, i) {
                return this.options.crs.distance(C(t), C(i))
            },
            containerPointToLayerPoint: function (t) {
                return w(t).subtract(this._getMapPanePos())
            },
            layerPointToContainerPoint: function (t) {
                return w(t).add(this._getMapPanePos())
            },
            containerPointToLatLng: function (t) {
                var i = this.containerPointToLayerPoint(w(t));
                return this.layerPointToLatLng(i)
            },
            latLngToContainerPoint: function (t) {
                return this.layerPointToContainerPoint(this.latLngToLayerPoint(C(t)))
            },
            mouseEventToContainerPoint: function (t) {
                return bt(t, this._container)
            },
            mouseEventToLayerPoint: function (t) {
                return this.containerPointToLayerPoint(this.mouseEventToContainerPoint(t))
            },
            mouseEventToLatLng: function (t) {
                return this.layerPointToLatLng(this.mouseEventToLayerPoint(t))
            },
            _initContainer: function (t) {
                var i = this._container = V(t);
                if (!i) throw new Error("Map container not found.");
                if (i._leaflet_id) throw new Error("Map container is already initialized.");
                mt(i, "scroll", this._onScroll, this), this._containerId = n(i)
            },
            _initLayout: function () {
                var t = this._container;
                this._fadeAnimated = this.options.fadeAnimation && ji, Q(t, "leaflet-container" + (qi ? " leaflet-touch" : "") + (Yi ? " leaflet-retina" : "") + (Li ? " leaflet-oldie" : "") + (Ai ? " leaflet-safari" : "") + (this._fadeAnimated ? " leaflet-fade-anim" : ""));
                var i = q(t, "position");
                "absolute" !== i && "relative" !== i && "fixed" !== i && (t.style.position = "relative"), this._initPanes(), this._initControlPos && this._initControlPos()
            },
            _initPanes: function () {
                var t = this._panes = {};
                this._paneRenderers = {}, this._mapPane = this.createPane("mapPane", this._container), at(this._mapPane, new x(0, 0)), this.createPane("tilePane"), this.createPane("shadowPane"), this.createPane("overlayPane"), this.createPane("markerPane"), this.createPane("tooltipPane"), this.createPane("popupPane"), this.options.markerZoomAnimation || (Q(t.markerPane, "leaflet-zoom-hide"), Q(t.shadowPane, "leaflet-zoom-hide"))
            },
            _resetView: function (t, i) {
                at(this._mapPane, new x(0, 0));
                var e = !this._loaded;
                this._loaded = !0, i = this._limitZoom(i), this.fire("viewprereset");
                var n = this._zoom !== i;
                this._moveStart(n, !1)._move(t, i)._moveEnd(n), this.fire("viewreset"), e && this.fire("load")
            },
            _moveStart: function (t, i) {
                return t && this.fire("zoomstart"), i || this.fire("movestart"), this
            },
            _move: function (t, i, e) {
                void 0 === i && (i = this._zoom);
                var n = this._zoom !== i;
                return this._zoom = i, this._lastCenter = t, this._pixelOrigin = this._getNewPixelOrigin(t), (n || e && e.pinch) && this.fire("zoom", e), this.fire("move", e)
            },
            _moveEnd: function (t) {
                return t && this.fire("zoomend"), this.fire("moveend")
            },
            _stop: function () {
                return g(this._flyToFrame), this._panAnim && this._panAnim.stop(), this
            },
            _rawPanBy: function (t) {
                at(this._mapPane, this._getMapPanePos().subtract(t))
            },
            _getZoomSpan: function () {
                return this.getMaxZoom() - this.getMinZoom()
            },
            _panInsideMaxBounds: function () {
                this._enforcingBounds || this.panInsideBounds(this.options.maxBounds)
            },
            _checkIfLoaded: function () {
                if (!this._loaded) throw new Error("Set map center and zoom first.")
            },
            _initEvents: function (t) {
                this._targets = {}, this._targets[n(this._container)] = this;
                var i = t ? ft : mt;
                i(this._container, "click dblclick mousedown mouseup mouseover mouseout mousemove contextmenu keypress", this._handleDOMEvent, this), this.options.trackResize && i(window, "resize", this._onResize, this), ji && this.options.transform3DLimit && (t ? this.off : this.on).call(this, "moveend", this._onMoveEnd)
            },
            _onResize: function () {
                g(this._resizeRequest), this._resizeRequest = f(function () {
                    this.invalidateSize({debounceMoveend: !0})
                }, this)
            },
            _onScroll: function () {
                this._container.scrollTop = 0, this._container.scrollLeft = 0
            },
            _onMoveEnd: function () {
                var t = this._getMapPanePos();
                Math.max(Math.abs(t.x), Math.abs(t.y)) >= this.options.transform3DLimit && this._resetView(this.getCenter(), this.getZoom())
            },
            _findEventTargets: function (t, i) {
                for (var e, o = [], s = "mouseout" === i || "mouseover" === i, r = t.target || t.srcElement, a = !1; r;) {
                    if ((e = this._targets[n(r)]) && ("click" === i || "preclick" === i) && !t._simulated && this._draggableMoved(e)) {
                        a = !0;
                        break
                    }
                    if (e && e.listens(i, !0)) {
                        if (s && !Ct(r, t)) break;
                        if (o.push(e), s) break
                    }
                    if (r === this._container) break;
                    r = r.parentNode
                }
                return o.length || a || s || !Ct(r, t) || (o = [this]), o
            },
            _handleDOMEvent: function (t) {
                if (this._loaded && !Mt(t)) {
                    var i = t.type;
                    "mousedown" !== i && "keypress" !== i || ct(t.target || t.srcElement), this._fireDOMEvent(t, i)
                }
            },
            _mouseEvents: ["click", "dblclick", "mouseover", "mouseout", "contextmenu"],
            _fireDOMEvent: function (t, e, n) {
                if ("click" === t.type) {
                    var o = i({}, t);
                    o.type = "preclick", this._fireDOMEvent(o, o.type, n)
                }
                if (!t._stopped && (n = (n || []).concat(this._findEventTargets(t, e))).length) {
                    var s = n[0];
                    "contextmenu" === e && s.listens(e, !0) && Pt(t);
                    var r = {originalEvent: t};
                    if ("keypress" !== t.type) {
                        var a = s.getLatLng && (!s._radius || s._radius <= 10);
                        r.containerPoint = a ? this.latLngToContainerPoint(s.getLatLng()) : this.mouseEventToContainerPoint(t), r.layerPoint = this.containerPointToLayerPoint(r.containerPoint), r.latlng = a ? s.getLatLng() : this.layerPointToLatLng(r.layerPoint)
                    }
                    for (var h = 0; h < n.length; h++) if (n[h].fire(e, r, !0), r.originalEvent._stopped || !1 === n[h].options.bubblingMouseEvents && -1 !== d(this._mouseEvents, e)) return
                }
            },
            _draggableMoved: function (t) {
                return (t = t.dragging && t.dragging.enabled() ? t : this).dragging && t.dragging.moved() || this.boxZoom && this.boxZoom.moved()
            },
            _clearHandlers: function () {
                for (var t = 0, i = this._handlers.length; t < i; t++) this._handlers[t].disable()
            },
            whenReady: function (t, i) {
                return this._loaded ? t.call(i || this, {target: this}) : this.on("load", t, i), this
            },
            _getMapPanePos: function () {
                return ht(this._mapPane) || new x(0, 0)
            },
            _moved: function () {
                var t = this._getMapPanePos();
                return t && !t.equals([0, 0])
            },
            _getTopLeftPoint: function (t, i) {
                return (t && void 0 !== i ? this._getNewPixelOrigin(t, i) : this.getPixelOrigin()).subtract(this._getMapPanePos())
            },
            _getNewPixelOrigin: function (t, i) {
                var e = this.getSize()._divideBy(2);
                return this.project(t, i)._subtract(e)._add(this._getMapPanePos())._round()
            },
            _latLngToNewLayerPoint: function (t, i, e) {
                var n = this._getNewPixelOrigin(e, i);
                return this.project(t, i)._subtract(n)
            },
            _latLngBoundsToNewLayerBounds: function (t, i, e) {
                var n = this._getNewPixelOrigin(e, i);
                return b([this.project(t.getSouthWest(), i)._subtract(n), this.project(t.getNorthWest(), i)._subtract(n), this.project(t.getSouthEast(), i)._subtract(n), this.project(t.getNorthEast(), i)._subtract(n)])
            },
            _getCenterLayerPoint: function () {
                return this.containerPointToLayerPoint(this.getSize()._divideBy(2))
            },
            _getCenterOffset: function (t) {
                return this.latLngToLayerPoint(t).subtract(this._getCenterLayerPoint())
            },
            _limitCenter: function (t, i, e) {
                if (!e) return t;
                var n = this.project(t, i), o = this.getSize().divideBy(2), s = new P(n.subtract(o), n.add(o)),
                    r = this._getBoundsOffset(s, e, i);
                return r.round().equals([0, 0]) ? t : this.unproject(n.add(r), i)
            },
            _limitOffset: function (t, i) {
                if (!i) return t;
                var e = this.getPixelBounds(), n = new P(e.min.add(t), e.max.add(t));
                return t.add(this._getBoundsOffset(n, i))
            },
            _getBoundsOffset: function (t, i, e) {
                var n = b(this.project(i.getNorthEast(), e), this.project(i.getSouthWest(), e)), o = n.min.subtract(t.min),
                    s = n.max.subtract(t.max);
                return new x(this._rebound(o.x, -s.x), this._rebound(o.y, -s.y))
            },
            _rebound: function (t, i) {
                return t + i > 0 ? Math.round(t - i) / 2 : Math.max(0, Math.ceil(t)) - Math.max(0, Math.floor(i))
            },
            _limitZoom: function (t) {
                var i = this.getMinZoom(), e = this.getMaxZoom(), n = ji ? this.options.zoomSnap : 1;
                return n && (t = Math.round(t / n) * n), Math.max(i, Math.min(e, t))
            },
            _onPanTransitionStep: function () {
                this.fire("move")
            },
            _onPanTransitionEnd: function () {
                tt(this._mapPane, "leaflet-pan-anim"), this.fire("moveend")
            },
            _tryAnimatedPan: function (t, i) {
                var e = this._getCenterOffset(t)._trunc();
                return !(!0 !== (i && i.animate) && !this.getSize().contains(e)) && (this.panBy(e, i), !0)
            },
            _createAnimProxy: function () {
                var t = this._proxy = G("div", "leaflet-proxy leaflet-zoom-animated");
                this._panes.mapPane.appendChild(t), this.on("zoomanim", function (t) {
                    var i = ce, e = this._proxy.style[i];
                    rt(this._proxy, this.project(t.center, t.zoom), this.getZoomScale(t.zoom, 1)), e === this._proxy.style[i] && this._animatingZoom && this._onZoomTransitionEnd()
                }, this), this.on("load moveend", function () {
                    var t = this.getCenter(), i = this.getZoom();
                    rt(this._proxy, this.project(t, i), this.getZoomScale(i, 1))
                }, this), this._on("unload", this._destroyAnimProxy, this)
            },
            _destroyAnimProxy: function () {
                K(this._proxy), delete this._proxy
            },
            _catchTransitionEnd: function (t) {
                this._animatingZoom && t.propertyName.indexOf("transform") >= 0 && this._onZoomTransitionEnd()
            },
            _nothingToAnimate: function () {
                return !this._container.getElementsByClassName("leaflet-zoom-animated").length
            },
            _tryAnimatedZoom: function (t, i, e) {
                if (this._animatingZoom) return !0;
                if (e = e || {}, !this._zoomAnimated || !1 === e.animate || this._nothingToAnimate() || Math.abs(i - this._zoom) > this.options.zoomAnimationThreshold) return !1;
                var n = this.getZoomScale(i), o = this._getCenterOffset(t)._divideBy(1 - 1 / n);
                return !(!0 !== e.animate && !this.getSize().contains(o)) && (f(function () {
                    this._moveStart(!0, !1)._animateZoom(t, i, !0)
                }, this), !0)
            },
            _animateZoom: function (t, i, n, o) {
                this._mapPane && (n && (this._animatingZoom = !0, this._animateToCenter = t, this._animateToZoom = i, Q(this._mapPane, "leaflet-zoom-anim")), this.fire("zoomanim", {
                    center: t,
                    zoom: i,
                    noUpdate: o
                }), setTimeout(e(this._onZoomTransitionEnd, this), 250))
            },
            _onZoomTransitionEnd: function () {
                this._animatingZoom && (this._mapPane && tt(this._mapPane, "leaflet-zoom-anim"), this._animatingZoom = !1, this._move(this._animateToCenter, this._animateToZoom), f(function () {
                    this._moveEnd(!0)
                }, this))
            }
        }), Te = v.extend({
            options: {position: "topright"}, initialize: function (t) {
                l(this, t)
            }, getPosition: function () {
                return this.options.position
            }, setPosition: function (t) {
                var i = this._map;
                return i && i.removeControl(this), this.options.position = t, i && i.addControl(this), this
            }, getContainer: function () {
                return this._container
            }, addTo: function (t) {
                this.remove(), this._map = t;
                var i = this._container = this.onAdd(t), e = this.getPosition(), n = t._controlCorners[e];
                return Q(i, "leaflet-control"), -1 !== e.indexOf("bottom") ? n.insertBefore(i, n.firstChild) : n.appendChild(i), this
            }, remove: function () {
                return this._map ? (K(this._container), this.onRemove && this.onRemove(this._map), this._map = null, this) : this
            }, _refocusOnMap: function (t) {
                this._map && t && t.screenX > 0 && t.screenY > 0 && this._map.getContainer().focus()
            }
        }), ze = function (t) {
            return new Te(t)
        };
    be.include({
        addControl: function (t) {
            return t.addTo(this), this
        }, removeControl: function (t) {
            return t.remove(), this
        }, _initControlPos: function () {
            function t(t, o) {
                var s = e + t + " " + e + o;
                i[t + o] = G("div", s, n)
            }

            var i = this._controlCorners = {}, e = "leaflet-",
                n = this._controlContainer = G("div", e + "control-container", this._container);
            t("top", "left"), t("top", "right"), t("bottom", "left"), t("bottom", "right")
        }, _clearControlPos: function () {
            for (var t in this._controlCorners) K(this._controlCorners[t]);
            K(this._controlContainer), delete this._controlCorners, delete this._controlContainer
        }
    });
    var Me = Te.extend({
        options: {
            collapsed: !0,
            position: "topright",
            autoZIndex: !0,
            hideSingleBase: !1,
            sortLayers: !1,
            sortFunction: function (t, i, e, n) {
                return e < n ? -1 : n < e ? 1 : 0
            }
        }, initialize: function (t, i, e) {
            l(this, e), this._layerControlInputs = [], this._layers = [], this._lastZIndex = 0, this._handlingClick = !1;
            for (var n in t) this._addLayer(t[n], n);
            for (n in i) this._addLayer(i[n], n, !0)
        }, onAdd: function (t) {
            this._initLayout(), this._update(), this._map = t, t.on("zoomend", this._checkDisabledLayers, this);
            for (var i = 0; i < this._layers.length; i++) this._layers[i].layer.on("add remove", this._onLayerChange, this);
            return this._container
        }, addTo: function (t) {
            return Te.prototype.addTo.call(this, t), this._expandIfNotCollapsed()
        }, onRemove: function () {
            this._map.off("zoomend", this._checkDisabledLayers, this);
            for (var t = 0; t < this._layers.length; t++) this._layers[t].layer.off("add remove", this._onLayerChange, this)
        }, addBaseLayer: function (t, i) {
            return this._addLayer(t, i), this._map ? this._update() : this
        }, addOverlay: function (t, i) {
            return this._addLayer(t, i, !0), this._map ? this._update() : this
        }, removeLayer: function (t) {
            t.off("add remove", this._onLayerChange, this);
            var i = this._getLayer(n(t));
            return i && this._layers.splice(this._layers.indexOf(i), 1), this._map ? this._update() : this
        }, expand: function () {
            Q(this._container, "leaflet-control-layers-expanded"), this._form.style.height = null;
            var t = this._map.getSize().y - (this._container.offsetTop + 50);
            return t < this._form.clientHeight ? (Q(this._form, "leaflet-control-layers-scrollbar"), this._form.style.height = t + "px") : tt(this._form, "leaflet-control-layers-scrollbar"), this._checkDisabledLayers(), this
        }, collapse: function () {
            return tt(this._container, "leaflet-control-layers-expanded"), this
        }, _initLayout: function () {
            var t = "leaflet-control-layers", i = this._container = G("div", t), e = this.options.collapsed;
            i.setAttribute("aria-haspopup", !0), wt(i), xt(i);
            var n = this._form = G("form", t + "-list");
            e && (this._map.on("click", this.collapse, this), zi || mt(i, {
                mouseenter: this.expand,
                mouseleave: this.collapse
            }, this));
            var o = this._layersLink = G("a", t + "-toggle", i);
            o.href = "#", o.title = "Layers", qi ? (mt(o, "click", Lt), mt(o, "click", this.expand, this)) : mt(o, "focus", this.expand, this), e || this.expand(), this._baseLayersList = G("div", t + "-base", n), this._separator = G("div", t + "-separator", n), this._overlaysList = G("div", t + "-overlays", n), i.appendChild(n)
        }, _getLayer: function (t) {
            for (var i = 0; i < this._layers.length; i++) if (this._layers[i] && n(this._layers[i].layer) === t) return this._layers[i]
        }, _addLayer: function (t, i, n) {
            this._map && t.on("add remove", this._onLayerChange, this), this._layers.push({
                layer: t,
                name: i,
                overlay: n
            }), this.options.sortLayers && this._layers.sort(e(function (t, i) {
                return this.options.sortFunction(t.layer, i.layer, t.name, i.name)
            }, this)), this.options.autoZIndex && t.setZIndex && (this._lastZIndex++, t.setZIndex(this._lastZIndex)), this._expandIfNotCollapsed()
        }, _update: function () {
            if (!this._container) return this;
            Y(this._baseLayersList), Y(this._overlaysList), this._layerControlInputs = [];
            var t, i, e, n, o = 0;
            for (e = 0; e < this._layers.length; e++) n = this._layers[e], this._addItem(n), i = i || n.overlay, t = t || !n.overlay, o += n.overlay ? 0 : 1;
            return this.options.hideSingleBase && (t = t && o > 1, this._baseLayersList.style.display = t ? "" : "none"), this._separator.style.display = i && t ? "" : "none", this
        }, _onLayerChange: function (t) {
            this._handlingClick || this._update();
            var i = this._getLayer(n(t.target)),
                e = i.overlay ? "add" === t.type ? "overlayadd" : "overlayremove" : "add" === t.type ? "baselayerchange" : null;
            e && this._map.fire(e, i)
        }, _createRadioElement: function (t, i) {
            var e = '<input type="radio" class="leaflet-control-layers-selector" name="' + t + '"' + (i ? ' checked="checked"' : "") + "/>",
                n = document.createElement("div");
            return n.innerHTML = e, n.firstChild
        }, _addItem: function (t) {
            var i, e = document.createElement("label"), o = this._map.hasLayer(t.layer);
            t.overlay ? ((i = document.createElement("input")).type = "checkbox", i.className = "leaflet-control-layers-selector", i.defaultChecked = o) : i = this._createRadioElement("leaflet-base-layers", o), this._layerControlInputs.push(i), i.layerId = n(t.layer), mt(i, "click", this._onInputClick, this);
            var s = document.createElement("span");
            s.innerHTML = " " + t.name;
            var r = document.createElement("div");
            return e.appendChild(r), r.appendChild(i), r.appendChild(s), (t.overlay ? this._overlaysList : this._baseLayersList).appendChild(e), this._checkDisabledLayers(), e
        }, _onInputClick: function () {
            var t, i, e = this._layerControlInputs, n = [], o = [];
            this._handlingClick = !0;
            for (var s = e.length - 1; s >= 0; s--) t = e[s], i = this._getLayer(t.layerId).layer, t.checked ? n.push(i) : t.checked || o.push(i);
            for (s = 0; s < o.length; s++) this._map.hasLayer(o[s]) && this._map.removeLayer(o[s]);
            for (s = 0; s < n.length; s++) this._map.hasLayer(n[s]) || this._map.addLayer(n[s]);
            this._handlingClick = !1, this._refocusOnMap()
        }, _checkDisabledLayers: function () {
            for (var t, i, e = this._layerControlInputs, n = this._map.getZoom(), o = e.length - 1; o >= 0; o--) t = e[o], i = this._getLayer(t.layerId).layer, t.disabled = void 0 !== i.options.minZoom && n < i.options.minZoom || void 0 !== i.options.maxZoom && n > i.options.maxZoom
        }, _expandIfNotCollapsed: function () {
            return this._map && !this.options.collapsed && this.expand(), this
        }, _expand: function () {
            return this.expand()
        }, _collapse: function () {
            return this.collapse()
        }
    }), Ce = Te.extend({
        options: {
            position: "topleft",
            zoomInText: "+",
            zoomInTitle: "Zoom in",
            zoomOutText: "&#x2212;",
            zoomOutTitle: "Zoom out"
        }, onAdd: function (t) {
            var i = "leaflet-control-zoom", e = G("div", i + " leaflet-bar"), n = this.options;
            return this._zoomInButton = this._createButton(n.zoomInText, n.zoomInTitle, i + "-in", e, this._zoomIn), this._zoomOutButton = this._createButton(n.zoomOutText, n.zoomOutTitle, i + "-out", e, this._zoomOut), this._updateDisabled(), t.on("zoomend zoomlevelschange", this._updateDisabled, this), e
        }, onRemove: function (t) {
            t.off("zoomend zoomlevelschange", this._updateDisabled, this)
        }, disable: function () {
            return this._disabled = !0, this._updateDisabled(), this
        }, enable: function () {
            return this._disabled = !1, this._updateDisabled(), this
        }, _zoomIn: function (t) {
            !this._disabled && this._map._zoom < this._map.getMaxZoom() && this._map.zoomIn(this._map.options.zoomDelta * (t.shiftKey ? 3 : 1))
        }, _zoomOut: function (t) {
            !this._disabled && this._map._zoom > this._map.getMinZoom() && this._map.zoomOut(this._map.options.zoomDelta * (t.shiftKey ? 3 : 1))
        }, _createButton: function (t, i, e, n, o) {
            var s = G("a", e, n);
            return s.innerHTML = t, s.href = "#", s.title = i, s.setAttribute("role", "button"), s.setAttribute("aria-label", i), wt(s), mt(s, "click", Lt), mt(s, "click", o, this), mt(s, "click", this._refocusOnMap, this), s
        }, _updateDisabled: function () {
            var t = this._map, i = "leaflet-disabled";
            tt(this._zoomInButton, i), tt(this._zoomOutButton, i), (this._disabled || t._zoom === t.getMinZoom()) && Q(this._zoomOutButton, i), (this._disabled || t._zoom === t.getMaxZoom()) && Q(this._zoomInButton, i)
        }
    });
    be.mergeOptions({zoomControl: !0}), be.addInitHook(function () {
        this.options.zoomControl && (this.zoomControl = new Ce, this.addControl(this.zoomControl))
    });
    var Se = Te.extend({
        options: {position: "bottomleft", maxWidth: 100, metric: !0, imperial: !0},
        onAdd: function (t) {
            var i = G("div", "leaflet-control-scale"), e = this.options;
            return this._addScales(e, "leaflet-control-scale-line", i), t.on(e.updateWhenIdle ? "moveend" : "move", this._update, this), t.whenReady(this._update, this), i
        },
        onRemove: function (t) {
            t.off(this.options.updateWhenIdle ? "moveend" : "move", this._update, this)
        },
        _addScales: function (t, i, e) {
            t.metric && (this._mScale = G("div", i, e)), t.imperial && (this._iScale = G("div", i, e))
        },
        _update: function () {
            var t = this._map, i = t.getSize().y / 2,
                e = t.distance(t.containerPointToLatLng([0, i]), t.containerPointToLatLng([this.options.maxWidth, i]));
            this._updateScales(e)
        },
        _updateScales: function (t) {
            this.options.metric && t && this._updateMetric(t), this.options.imperial && t && this._updateImperial(t)
        },
        _updateMetric: function (t) {
            var i = this._getRoundNum(t), e = i < 1e3 ? i + " m" : i / 1e3 + " km";
            this._updateScale(this._mScale, e, i / t)
        },
        _updateImperial: function (t) {
            var i, e, n, o = 3.2808399 * t;
            o > 5280 ? (i = o / 5280, e = this._getRoundNum(i), this._updateScale(this._iScale, e + " mi", e / i)) : (n = this._getRoundNum(o), this._updateScale(this._iScale, n + " ft", n / o))
        },
        _updateScale: function (t, i, e) {
            t.style.width = Math.round(this.options.maxWidth * e) + "px", t.innerHTML = i
        },
        _getRoundNum: function (t) {
            var i = Math.pow(10, (Math.floor(t) + "").length - 1), e = t / i;
            return e = e >= 10 ? 10 : e >= 5 ? 5 : e >= 3 ? 3 : e >= 2 ? 2 : 1, i * e
        }
    }), Ze = Te.extend({
        options: {
            position: "bottomright",
            prefix: '<a href="http://leafletjs.com" title="A JS library for interactive maps">Leaflet</a>'
        }, initialize: function (t) {
            l(this, t), this._attributions = {}
        }, onAdd: function (t) {
            t.attributionControl = this, this._container = G("div", "leaflet-control-attribution"), wt(this._container);
            for (var i in t._layers) t._layers[i].getAttribution && this.addAttribution(t._layers[i].getAttribution());
            return this._update(), this._container
        }, setPrefix: function (t) {
            return this.options.prefix = t, this._update(), this
        }, addAttribution: function (t) {
            return t ? (this._attributions[t] || (this._attributions[t] = 0), this._attributions[t]++, this._update(), this) : this
        }, removeAttribution: function (t) {
            return t ? (this._attributions[t] && (this._attributions[t]--, this._update()), this) : this
        }, _update: function () {
            if (this._map) {
                var t = [];
                for (var i in this._attributions) this._attributions[i] && t.push(i);
                var e = [];
                this.options.prefix && e.push(this.options.prefix), t.length && e.push(t.join(", ")), this._container.innerHTML = e.join(" | ")
            }
        }
    });
    be.mergeOptions({attributionControl: !0}), be.addInitHook(function () {
        this.options.attributionControl && (new Ze).addTo(this)
    });
    Te.Layers = Me, Te.Zoom = Ce, Te.Scale = Se, Te.Attribution = Ze, ze.layers = function (t, i, e) {
        return new Me(t, i, e)
    }, ze.zoom = function (t) {
        return new Ce(t)
    }, ze.scale = function (t) {
        return new Se(t)
    }, ze.attribution = function (t) {
        return new Ze(t)
    };
    var Ee = v.extend({
        initialize: function (t) {
            this._map = t
        }, enable: function () {
            return this._enabled ? this : (this._enabled = !0, this.addHooks(), this)
        }, disable: function () {
            return this._enabled ? (this._enabled = !1, this.removeHooks(), this) : this
        }, enabled: function () {
            return !!this._enabled
        }
    });
    Ee.addTo = function (t, i) {
        return t.addHandler(i, this), this
    };
    var ke, Ae = {Events: li}, Be = qi ? "touchstart mousedown" : "mousedown",
        Ie = {mousedown: "mouseup", touchstart: "touchend", pointerdown: "touchend", MSPointerDown: "touchend"},
        Oe = {mousedown: "mousemove", touchstart: "touchmove", pointerdown: "touchmove", MSPointerDown: "touchmove"},
        Re = ci.extend({
            options: {clickTolerance: 3}, initialize: function (t, i, e, n) {
                l(this, n), this._element = t, this._dragStartTarget = i || t, this._preventOutline = e
            }, enable: function () {
                this._enabled || (mt(this._dragStartTarget, Be, this._onDown, this), this._enabled = !0)
            }, disable: function () {
                this._enabled && (Re._dragging === this && this.finishDrag(), ft(this._dragStartTarget, Be, this._onDown, this), this._enabled = !1, this._moved = !1)
            }, _onDown: function (t) {
                if (!t._simulated && this._enabled && (this._moved = !1, !$(this._element, "leaflet-zoom-anim") && !(Re._dragging || t.shiftKey || 1 !== t.which && 1 !== t.button && !t.touches || (Re._dragging = this, this._preventOutline && ct(this._element), ut(), fi(), this._moving)))) {
                    this.fire("down");
                    var i = t.touches ? t.touches[0] : t, e = dt(this._element);
                    this._startPoint = new x(i.clientX, i.clientY), this._parentScale = pt(e), mt(document, Oe[t.type], this._onMove, this), mt(document, Ie[t.type], this._onUp, this)
                }
            }, _onMove: function (t) {
                if (!t._simulated && this._enabled) if (t.touches && t.touches.length > 1) this._moved = !0; else {
                    var i = t.touches && 1 === t.touches.length ? t.touches[0] : t,
                        e = new x(i.clientX, i.clientY)._subtract(this._startPoint);
                    (e.x || e.y) && (Math.abs(e.x) + Math.abs(e.y) < this.options.clickTolerance || (e.x /= this._parentScale.x, e.y /= this._parentScale.y, Pt(t), this._moved || (this.fire("dragstart"), this._moved = !0, this._startPos = ht(this._element).subtract(e), Q(document.body, "leaflet-dragging"), this._lastTarget = t.target || t.srcElement, window.SVGElementInstance && this._lastTarget instanceof SVGElementInstance && (this._lastTarget = this._lastTarget.correspondingUseElement), Q(this._lastTarget, "leaflet-drag-target")), this._newPos = this._startPos.add(e), this._moving = !0, g(this._animRequest), this._lastEvent = t, this._animRequest = f(this._updatePosition, this, !0)))
                }
            }, _updatePosition: function () {
                var t = {originalEvent: this._lastEvent};
                this.fire("predrag", t), at(this._element, this._newPos), this.fire("drag", t)
            }, _onUp: function (t) {
                !t._simulated && this._enabled && this.finishDrag()
            }, finishDrag: function () {
                tt(document.body, "leaflet-dragging"), this._lastTarget && (tt(this._lastTarget, "leaflet-drag-target"), this._lastTarget = null);
                for (var t in Oe) ft(document, Oe[t], this._onMove, this), ft(document, Ie[t], this._onUp, this);
                lt(), gi(), this._moved && this._moving && (g(this._animRequest), this.fire("dragend", {distance: this._newPos.distanceTo(this._startPos)})), this._moving = !1, Re._dragging = !1
            }
        }), Ne = (Object.freeze || Object)({
            simplify: Zt,
            pointToSegmentDistance: Et,
            closestPointOnSegment: function (t, i, e) {
                return Dt(t, i, e)
            },
            clipSegment: It,
            _getEdgeIntersection: Ot,
            _getBitCode: Rt,
            _sqClosestPointOnSegment: Dt,
            isFlat: jt,
            _flat: Wt
        }), De = (Object.freeze || Object)({clipPolygon: Ht}), je = {
            project: function (t) {
                return new x(t.lng, t.lat)
            }, unproject: function (t) {
                return new M(t.y, t.x)
            }, bounds: new P([-180, -90], [180, 90])
        }, We = {
            R: 6378137,
            R_MINOR: 6356752.314245179,
            bounds: new P([-20037508.34279, -15496570.73972], [20037508.34279, 18764656.23138]),
            project: function (t) {
                var i = Math.PI / 180, e = this.R, n = t.lat * i, o = this.R_MINOR / e, s = Math.sqrt(1 - o * o),
                    r = s * Math.sin(n), a = Math.tan(Math.PI / 4 - n / 2) / Math.pow((1 - r) / (1 + r), s / 2);
                return n = -e * Math.log(Math.max(a, 1e-10)), new x(t.lng * i * e, n)
            },
            unproject: function (t) {
                for (var i, e = 180 / Math.PI, n = this.R, o = this.R_MINOR / n, s = Math.sqrt(1 - o * o), r = Math.exp(-t.y / n), a = Math.PI / 2 - 2 * Math.atan(r), h = 0, u = .1; h < 15 && Math.abs(u) > 1e-7; h++) i = s * Math.sin(a), i = Math.pow((1 - i) / (1 + i), s / 2), a += u = Math.PI / 2 - 2 * Math.atan(r * i) - a;
                return new M(a * e, t.x * e / n)
            }
        }, He = (Object.freeze || Object)({LonLat: je, Mercator: We, SphericalMercator: mi}), Fe = i({}, pi, {
            code: "EPSG:3395", projection: We, transformation: function () {
                var t = .5 / (Math.PI * We.R);
                return Z(t, .5, -t, .5)
            }()
        }), Ue = i({}, pi, {code: "EPSG:4326", projection: je, transformation: Z(1 / 180, 1, -1 / 180, .5)}),
        Ve = i({}, di, {
            projection: je, transformation: Z(1, 0, -1, 0), scale: function (t) {
                return Math.pow(2, t)
            }, zoom: function (t) {
                return Math.log(t) / Math.LN2
            }, distance: function (t, i) {
                var e = i.lng - t.lng, n = i.lat - t.lat;
                return Math.sqrt(e * e + n * n)
            }, infinite: !0
        });
    di.Earth = pi, di.EPSG3395 = Fe, di.EPSG3857 = yi, di.EPSG900913 = xi, di.EPSG4326 = Ue, di.Simple = Ve;
    var qe = ci.extend({
        options: {pane: "overlayPane", attribution: null, bubblingMouseEvents: !0},
        addTo: function (t) {
            return t.addLayer(this), this
        },
        remove: function () {
            return this.removeFrom(this._map || this._mapToAdd)
        },
        removeFrom: function (t) {
            return t && t.removeLayer(this), this
        },
        getPane: function (t) {
            return this._map.getPane(t ? this.options[t] || t : this.options.pane)
        },
        addInteractiveTarget: function (t) {
            return this._map._targets[n(t)] = this, this
        },
        removeInteractiveTarget: function (t) {
            return delete this._map._targets[n(t)], this
        },
        getAttribution: function () {
            return this.options.attribution
        },
        _layerAdd: function (t) {
            var i = t.target;
            if (i.hasLayer(this)) {
                if (this._map = i, this._zoomAnimated = i._zoomAnimated, this.getEvents) {
                    var e = this.getEvents();
                    i.on(e, this), this.once("remove", function () {
                        i.off(e, this)
                    }, this)
                }
                this.onAdd(i), this.getAttribution && i.attributionControl && i.attributionControl.addAttribution(this.getAttribution()), this.fire("add"), i.fire("layeradd", {layer: this})
            }
        }
    });
    be.include({
        addLayer: function (t) {
            if (!t._layerAdd) throw new Error("The provided object is not a Layer.");
            var i = n(t);
            return this._layers[i] ? this : (this._layers[i] = t, t._mapToAdd = this, t.beforeAdd && t.beforeAdd(this), this.whenReady(t._layerAdd, t), this)
        }, removeLayer: function (t) {
            var i = n(t);
            return this._layers[i] ? (this._loaded && t.onRemove(this), t.getAttribution && this.attributionControl && this.attributionControl.removeAttribution(t.getAttribution()), delete this._layers[i], this._loaded && (this.fire("layerremove", {layer: t}), t.fire("remove")), t._map = t._mapToAdd = null, this) : this
        }, hasLayer: function (t) {
            return !!t && n(t) in this._layers
        }, eachLayer: function (t, i) {
            for (var e in this._layers) t.call(i, this._layers[e]);
            return this
        }, _addLayers: function (t) {
            for (var i = 0, e = (t = t ? oi(t) ? t : [t] : []).length; i < e; i++) this.addLayer(t[i])
        }, _addZoomLimit: function (t) {
            !isNaN(t.options.maxZoom) && isNaN(t.options.minZoom) || (this._zoomBoundLayers[n(t)] = t, this._updateZoomLevels())
        }, _removeZoomLimit: function (t) {
            var i = n(t);
            this._zoomBoundLayers[i] && (delete this._zoomBoundLayers[i], this._updateZoomLevels())
        }, _updateZoomLevels: function () {
            var t = 1 / 0, i = -1 / 0, e = this._getZoomSpan();
            for (var n in this._zoomBoundLayers) {
                var o = this._zoomBoundLayers[n].options;
                t = void 0 === o.minZoom ? t : Math.min(t, o.minZoom), i = void 0 === o.maxZoom ? i : Math.max(i, o.maxZoom)
            }
            this._layersMaxZoom = i === -1 / 0 ? void 0 : i, this._layersMinZoom = t === 1 / 0 ? void 0 : t, e !== this._getZoomSpan() && this.fire("zoomlevelschange"), void 0 === this.options.maxZoom && this._layersMaxZoom && this.getZoom() > this._layersMaxZoom && this.setZoom(this._layersMaxZoom), void 0 === this.options.minZoom && this._layersMinZoom && this.getZoom() < this._layersMinZoom && this.setZoom(this._layersMinZoom)
        }
    });
    var Ge = qe.extend({
        initialize: function (t, i) {
            l(this, i), this._layers = {};
            var e, n;
            if (t) for (e = 0, n = t.length; e < n; e++) this.addLayer(t[e])
        }, addLayer: function (t) {
            var i = this.getLayerId(t);
            return this._layers[i] = t, this._map && this._map.addLayer(t), this
        }, removeLayer: function (t) {
            var i = t in this._layers ? t : this.getLayerId(t);
            return this._map && this._layers[i] && this._map.removeLayer(this._layers[i]), delete this._layers[i], this
        }, hasLayer: function (t) {
            return !!t && (t in this._layers || this.getLayerId(t) in this._layers)
        }, clearLayers: function () {
            return this.eachLayer(this.removeLayer, this)
        }, invoke: function (t) {
            var i, e, n = Array.prototype.slice.call(arguments, 1);
            for (i in this._layers) (e = this._layers[i])[t] && e[t].apply(e, n);
            return this
        }, onAdd: function (t) {
            this.eachLayer(t.addLayer, t)
        }, onRemove: function (t) {
            this.eachLayer(t.removeLayer, t)
        }, eachLayer: function (t, i) {
            for (var e in this._layers) t.call(i, this._layers[e]);
            return this
        }, getLayer: function (t) {
            return this._layers[t]
        }, getLayers: function () {
            var t = [];
            return this.eachLayer(t.push, t), t
        }, setZIndex: function (t) {
            return this.invoke("setZIndex", t)
        }, getLayerId: function (t) {
            return n(t)
        }
    }), Ke = Ge.extend({
        addLayer: function (t) {
            return this.hasLayer(t) ? this : (t.addEventParent(this), Ge.prototype.addLayer.call(this, t), this.fire("layeradd", {layer: t}))
        }, removeLayer: function (t) {
            return this.hasLayer(t) ? (t in this._layers && (t = this._layers[t]), t.removeEventParent(this), Ge.prototype.removeLayer.call(this, t), this.fire("layerremove", {layer: t})) : this
        }, setStyle: function (t) {
            return this.invoke("setStyle", t)
        }, bringToFront: function () {
            return this.invoke("bringToFront")
        }, bringToBack: function () {
            return this.invoke("bringToBack")
        }, getBounds: function () {
            var t = new T;
            for (var i in this._layers) {
                var e = this._layers[i];
                t.extend(e.getBounds ? e.getBounds() : e.getLatLng())
            }
            return t
        }
    }), Ye = v.extend({
        options: {popupAnchor: [0, 0], tooltipAnchor: [0, 0]}, initialize: function (t) {
            l(this, t)
        }, createIcon: function (t) {
            return this._createIcon("icon", t)
        }, createShadow: function (t) {
            return this._createIcon("shadow", t)
        }, _createIcon: function (t, i) {
            var e = this._getIconUrl(t);
            if (!e) {
                if ("icon" === t) throw new Error("iconUrl not set in Icon options (see the docs).");
                return null
            }
            var n = this._createImg(e, i && "IMG" === i.tagName ? i : null);
            return this._setIconStyles(n, t), n
        }, _setIconStyles: function (t, i) {
            var e = this.options, n = e[i + "Size"];
            "number" == typeof n && (n = [n, n]);
            var o = w(n), s = w("shadow" === i && e.shadowAnchor || e.iconAnchor || o && o.divideBy(2, !0));
            t.className = "leaflet-marker-" + i + " " + (e.className || ""), s && (t.style.marginLeft = -s.x + "px", t.style.marginTop = -s.y + "px"), o && (t.style.width = o.x + "px", t.style.height = o.y + "px")
        }, _createImg: function (t, i) {
            return i = i || document.createElement("img"), i.src = t, i
        }, _getIconUrl: function (t) {
            return Yi && this.options[t + "RetinaUrl"] || this.options[t + "Url"]
        }
    }), Xe = Ye.extend({
        options: {
            iconUrl: "marker-icon.png",
            iconRetinaUrl: "marker-icon-2x.png",
            shadowUrl: "marker-shadow.png",
            iconSize: [25, 41],
            iconAnchor: [12, 41],
            popupAnchor: [1, -34],
            tooltipAnchor: [16, -28],
            shadowSize: [41, 41]
        }, _getIconUrl: function (t) {
            return Xe.imagePath || (Xe.imagePath = this._detectIconPath()), (this.options.imagePath || Xe.imagePath) + Ye.prototype._getIconUrl.call(this, t)
        }, _detectIconPath: function () {
            var t = G("div", "leaflet-default-icon-path", document.body),
                i = q(t, "background-image") || q(t, "backgroundImage");
            return document.body.removeChild(t), i = null === i || 0 !== i.indexOf("url") ? "" : i.replace(/^url\(["']?/, "").replace(/marker-icon\.png["']?\)$/, "")
        }
    }), Je = Ee.extend({
        initialize: function (t) {
            this._marker = t
        }, addHooks: function () {
            var t = this._marker._icon;
            this._draggable || (this._draggable = new Re(t, t, !0)), this._draggable.on({
                dragstart: this._onDragStart,
                predrag: this._onPreDrag,
                drag: this._onDrag,
                dragend: this._onDragEnd
            }, this).enable(), Q(t, "leaflet-marker-draggable")
        }, removeHooks: function () {
            this._draggable.off({
                dragstart: this._onDragStart,
                predrag: this._onPreDrag,
                drag: this._onDrag,
                dragend: this._onDragEnd
            }, this).disable(), this._marker._icon && tt(this._marker._icon, "leaflet-marker-draggable")
        }, moved: function () {
            return this._draggable && this._draggable._moved
        }, _adjustPan: function (t) {
            var i = this._marker, e = i._map, n = this._marker.options.autoPanSpeed,
                o = this._marker.options.autoPanPadding, s = ht(i._icon), r = e.getPixelBounds(),
                a = e.getPixelOrigin(), h = b(r.min._subtract(a).add(o), r.max._subtract(a).subtract(o));
            if (!h.contains(s)) {
                var u = w((Math.max(h.max.x, s.x) - h.max.x) / (r.max.x - h.max.x) - (Math.min(h.min.x, s.x) - h.min.x) / (r.min.x - h.min.x), (Math.max(h.max.y, s.y) - h.max.y) / (r.max.y - h.max.y) - (Math.min(h.min.y, s.y) - h.min.y) / (r.min.y - h.min.y)).multiplyBy(n);
                e.panBy(u, {animate: !1}), this._draggable._newPos._add(u), this._draggable._startPos._add(u), at(i._icon, this._draggable._newPos), this._onDrag(t), this._panRequest = f(this._adjustPan.bind(this, t))
            }
        }, _onDragStart: function () {
            this._oldLatLng = this._marker.getLatLng(), this._marker.closePopup().fire("movestart").fire("dragstart")
        }, _onPreDrag: function (t) {
            this._marker.options.autoPan && (g(this._panRequest), this._panRequest = f(this._adjustPan.bind(this, t)))
        }, _onDrag: function (t) {
            var i = this._marker, e = i._shadow, n = ht(i._icon), o = i._map.layerPointToLatLng(n);
            e && at(e, n), i._latlng = o, t.latlng = o, t.oldLatLng = this._oldLatLng, i.fire("move", t).fire("drag", t)
        }, _onDragEnd: function (t) {
            g(this._panRequest), delete this._oldLatLng, this._marker.fire("moveend").fire("dragend", t)
        }
    }), $e = qe.extend({
        options: {
            icon: new Xe,
            interactive: !0,
            keyboard: !0,
            title: "",
            alt: "",
            zIndexOffset: 0,
            opacity: 1,
            riseOnHover: !1,
            riseOffset: 250,
            pane: "markerPane",
            bubblingMouseEvents: !1,
            draggable: !1,
            autoPan: !1,
            autoPanPadding: [50, 50],
            autoPanSpeed: 10
        }, initialize: function (t, i) {
            l(this, i), this._latlng = C(t)
        }, onAdd: function (t) {
            this._zoomAnimated = this._zoomAnimated && t.options.markerZoomAnimation, this._zoomAnimated && t.on("zoomanim", this._animateZoom, this), this._initIcon(), this.update()
        }, onRemove: function (t) {
            this.dragging && this.dragging.enabled() && (this.options.draggable = !0, this.dragging.removeHooks()), delete this.dragging, this._zoomAnimated && t.off("zoomanim", this._animateZoom, this), this._removeIcon(), this._removeShadow()
        }, getEvents: function () {
            return {zoom: this.update, viewreset: this.update}
        }, getLatLng: function () {
            return this._latlng
        }, setLatLng: function (t) {
            var i = this._latlng;
            return this._latlng = C(t), this.update(), this.fire("move", {oldLatLng: i, latlng: this._latlng})
        }, setZIndexOffset: function (t) {
            return this.options.zIndexOffset = t, this.update()
        }, setIcon: function (t) {
            return this.options.icon = t, this._map && (this._initIcon(), this.update()), this._popup && this.bindPopup(this._popup, this._popup.options), this
        }, getElement: function () {
            return this._icon
        }, update: function () {
            if (this._icon && this._map) {
                var t = this._map.latLngToLayerPoint(this._latlng).round();
                this._setPos(t)
            }
            return this
        }, _initIcon: function () {
            var t = this.options, i = "leaflet-zoom-" + (this._zoomAnimated ? "animated" : "hide"),
                e = t.icon.createIcon(this._icon), n = !1;
            e !== this._icon && (this._icon && this._removeIcon(), n = !0, t.title && (e.title = t.title), "IMG" === e.tagName && (e.alt = t.alt || "")), Q(e, i), t.keyboard && (e.tabIndex = "0"), this._icon = e, t.riseOnHover && this.on({
                mouseover: this._bringToFront,
                mouseout: this._resetZIndex
            });
            var o = t.icon.createShadow(this._shadow), s = !1;
            o !== this._shadow && (this._removeShadow(), s = !0), o && (Q(o, i), o.alt = ""), this._shadow = o, t.opacity < 1 && this._updateOpacity(), n && this.getPane().appendChild(this._icon), this._initInteraction(), o && s && this.getPane("shadowPane").appendChild(this._shadow)
        }, _removeIcon: function () {
            this.options.riseOnHover && this.off({
                mouseover: this._bringToFront,
                mouseout: this._resetZIndex
            }), K(this._icon), this.removeInteractiveTarget(this._icon), this._icon = null
        }, _removeShadow: function () {
            this._shadow && K(this._shadow), this._shadow = null
        }, _setPos: function (t) {
            at(this._icon, t), this._shadow && at(this._shadow, t), this._zIndex = t.y + this.options.zIndexOffset, this._resetZIndex()
        }, _updateZIndex: function (t) {
            this._icon.style.zIndex = this._zIndex + t
        }, _animateZoom: function (t) {
            var i = this._map._latLngToNewLayerPoint(this._latlng, t.zoom, t.center).round();
            this._setPos(i)
        }, _initInteraction: function () {
            if (this.options.interactive && (Q(this._icon, "leaflet-interactive"), this.addInteractiveTarget(this._icon), Je)) {
                var t = this.options.draggable;
                this.dragging && (t = this.dragging.enabled(), this.dragging.disable()), this.dragging = new Je(this), t && this.dragging.enable()
            }
        }, setOpacity: function (t) {
            return this.options.opacity = t, this._map && this._updateOpacity(), this
        }, _updateOpacity: function () {
            var t = this.options.opacity;
            nt(this._icon, t), this._shadow && nt(this._shadow, t)
        }, _bringToFront: function () {
            this._updateZIndex(this.options.riseOffset)
        }, _resetZIndex: function () {
            this._updateZIndex(0)
        }, _getPopupAnchor: function () {
            return this.options.icon.options.popupAnchor
        }, _getTooltipAnchor: function () {
            return this.options.icon.options.tooltipAnchor
        }
    }), Qe = qe.extend({
        options: {
            stroke: !0,
            color: "#3388ff",
            weight: 3,
            opacity: 1,
            lineCap: "round",
            lineJoin: "round",
            dashArray: null,
            dashOffset: null,
            fill: !1,
            fillColor: null,
            fillOpacity: .2,
            fillRule: "evenodd",
            interactive: !0,
            bubblingMouseEvents: !0
        }, beforeAdd: function (t) {
            this._renderer = t.getRenderer(this)
        }, onAdd: function () {
            this._renderer._initPath(this), this._reset(), this._renderer._addPath(this)
        }, onRemove: function () {
            this._renderer._removePath(this)
        }, redraw: function () {
            return this._map && this._renderer._updatePath(this), this
        }, setStyle: function (t) {
            return l(this, t), this._renderer && this._renderer._updateStyle(this), this
        }, bringToFront: function () {
            return this._renderer && this._renderer._bringToFront(this), this
        }, bringToBack: function () {
            return this._renderer && this._renderer._bringToBack(this), this
        }, getElement: function () {
            return this._path
        }, _reset: function () {
            this._project(), this._update()
        }, _clickTolerance: function () {
            return (this.options.stroke ? this.options.weight / 2 : 0) + this._renderer.options.tolerance
        }
    }), tn = Qe.extend({
        options: {fill: !0, radius: 10}, initialize: function (t, i) {
            l(this, i), this._latlng = C(t), this._radius = this.options.radius
        }, setLatLng: function (t) {
            return this._latlng = C(t), this.redraw(), this.fire("move", {latlng: this._latlng})
        }, getLatLng: function () {
            return this._latlng
        }, setRadius: function (t) {
            return this.options.radius = this._radius = t, this.redraw()
        }, getRadius: function () {
            return this._radius
        }, setStyle: function (t) {
            var i = t && t.radius || this._radius;
            return Qe.prototype.setStyle.call(this, t), this.setRadius(i), this
        }, _project: function () {
            this._point = this._map.latLngToLayerPoint(this._latlng), this._updateBounds()
        }, _updateBounds: function () {
            var t = this._radius, i = this._radiusY || t, e = this._clickTolerance(), n = [t + e, i + e];
            this._pxBounds = new P(this._point.subtract(n), this._point.add(n))
        }, _update: function () {
            this._map && this._updatePath()
        }, _updatePath: function () {
            this._renderer._updateCircle(this)
        }, _empty: function () {
            return this._radius && !this._renderer._bounds.intersects(this._pxBounds)
        }, _containsPoint: function (t) {
            return t.distanceTo(this._point) <= this._radius + this._clickTolerance()
        }
    }), en = tn.extend({
        initialize: function (t, e, n) {
            if ("number" == typeof e && (e = i({}, n, {radius: e})), l(this, e), this._latlng = C(t), isNaN(this.options.radius)) throw new Error("Circle radius cannot be NaN");
            this._mRadius = this.options.radius
        }, setRadius: function (t) {
            return this._mRadius = t, this.redraw()
        }, getRadius: function () {
            return this._mRadius
        }, getBounds: function () {
            var t = [this._radius, this._radiusY || this._radius];
            return new T(this._map.layerPointToLatLng(this._point.subtract(t)), this._map.layerPointToLatLng(this._point.add(t)))
        }, setStyle: Qe.prototype.setStyle, _project: function () {
            var t = this._latlng.lng, i = this._latlng.lat, e = this._map, n = e.options.crs;
            if (n.distance === pi.distance) {
                var o = Math.PI / 180, s = this._mRadius / pi.R / o, r = e.project([i + s, t]),
                    a = e.project([i - s, t]), h = r.add(a).divideBy(2), u = e.unproject(h).lat,
                    l = Math.acos((Math.cos(s * o) - Math.sin(i * o) * Math.sin(u * o)) / (Math.cos(i * o) * Math.cos(u * o))) / o;
                (isNaN(l) || 0 === l) && (l = s / Math.cos(Math.PI / 180 * i)), this._point = h.subtract(e.getPixelOrigin()), this._radius = isNaN(l) ? 0 : h.x - e.project([u, t - l]).x, this._radiusY = h.y - r.y
            } else {
                var c = n.unproject(n.project(this._latlng).subtract([this._mRadius, 0]));
                this._point = e.latLngToLayerPoint(this._latlng), this._radius = this._point.x - e.latLngToLayerPoint(c).x
            }
            this._updateBounds()
        }
    }), nn = Qe.extend({
        options: {smoothFactor: 1, noClip: !1}, initialize: function (t, i) {
            l(this, i), this._setLatLngs(t)
        }, getLatLngs: function () {
            return this._latlngs
        }, setLatLngs: function (t) {
            return this._setLatLngs(t), this.redraw()
        }, isEmpty: function () {
            return !this._latlngs.length
        }, closestLayerPoint: function (t) {
            for (var i, e, n = 1 / 0, o = null, s = Dt, r = 0, a = this._parts.length; r < a; r++) for (var h = this._parts[r], u = 1, l = h.length; u < l; u++) {
                var c = s(t, i = h[u - 1], e = h[u], !0);
                c < n && (n = c, o = s(t, i, e))
            }
            return o && (o.distance = Math.sqrt(n)), o
        }, getCenter: function () {
            if (!this._map) throw new Error("Must add layer to map before using getCenter()");
            var t, i, e, n, o, s, r, a = this._rings[0], h = a.length;
            if (!h) return null;
            for (t = 0, i = 0; t < h - 1; t++) i += a[t].distanceTo(a[t + 1]) / 2;
            if (0 === i) return this._map.layerPointToLatLng(a[0]);
            for (t = 0, n = 0; t < h - 1; t++) if (o = a[t], s = a[t + 1], e = o.distanceTo(s), (n += e) > i) return r = (n - i) / e, this._map.layerPointToLatLng([s.x - r * (s.x - o.x), s.y - r * (s.y - o.y)])
        }, getBounds: function () {
            return this._bounds
        }, addLatLng: function (t, i) {
            return i = i || this._defaultShape(), t = C(t), i.push(t), this._bounds.extend(t), this.redraw()
        }, _setLatLngs: function (t) {
            this._bounds = new T, this._latlngs = this._convertLatLngs(t)
        }, _defaultShape: function () {
            return jt(this._latlngs) ? this._latlngs : this._latlngs[0]
        }, _convertLatLngs: function (t) {
            for (var i = [], e = jt(t), n = 0, o = t.length; n < o; n++) e ? (i[n] = C(t[n]), this._bounds.extend(i[n])) : i[n] = this._convertLatLngs(t[n]);
            return i
        }, _project: function () {
            var t = new P;
            this._rings = [], this._projectLatlngs(this._latlngs, this._rings, t);
            var i = this._clickTolerance(), e = new x(i, i);
            this._bounds.isValid() && t.isValid() && (t.min._subtract(e), t.max._add(e), this._pxBounds = t)
        }, _projectLatlngs: function (t, i, e) {
            var n, o, s = t[0] instanceof M, r = t.length;
            if (s) {
                for (o = [], n = 0; n < r; n++) o[n] = this._map.latLngToLayerPoint(t[n]), e.extend(o[n]);
                i.push(o)
            } else for (n = 0; n < r; n++) this._projectLatlngs(t[n], i, e)
        }, _clipPoints: function () {
            var t = this._renderer._bounds;
            if (this._parts = [], this._pxBounds && this._pxBounds.intersects(t)) if (this.options.noClip) this._parts = this._rings; else {
                var i, e, n, o, s, r, a, h = this._parts;
                for (i = 0, n = 0, o = this._rings.length; i < o; i++) for (e = 0, s = (a = this._rings[i]).length; e < s - 1; e++) (r = It(a[e], a[e + 1], t, e, !0)) && (h[n] = h[n] || [], h[n].push(r[0]), r[1] === a[e + 1] && e !== s - 2 || (h[n].push(r[1]), n++))
            }
        }, _simplifyPoints: function () {
            for (var t = this._parts, i = this.options.smoothFactor, e = 0, n = t.length; e < n; e++) t[e] = Zt(t[e], i)
        }, _update: function () {
            this._map && (this._clipPoints(), this._simplifyPoints(), this._updatePath())
        }, _updatePath: function () {
            this._renderer._updatePoly(this)
        }, _containsPoint: function (t, i) {
            var e, n, o, s, r, a, h = this._clickTolerance();
            if (!this._pxBounds || !this._pxBounds.contains(t)) return !1;
            for (e = 0, s = this._parts.length; e < s; e++) for (n = 0, o = (r = (a = this._parts[e]).length) - 1; n < r; o = n++) if ((i || 0 !== n) && Et(t, a[o], a[n]) <= h) return !0;
            return !1
        }
    });
    nn._flat = Wt;
    var on = nn.extend({
        options: {fill: !0}, isEmpty: function () {
            return !this._latlngs.length || !this._latlngs[0].length
        }, getCenter: function () {
            if (!this._map) throw new Error("Must add layer to map before using getCenter()");
            var t, i, e, n, o, s, r, a, h, u = this._rings[0], l = u.length;
            if (!l) return null;
            for (s = r = a = 0, t = 0, i = l - 1; t < l; i = t++) e = u[t], n = u[i], o = e.y * n.x - n.y * e.x, r += (e.x + n.x) * o, a += (e.y + n.y) * o, s += 3 * o;
            return h = 0 === s ? u[0] : [r / s, a / s], this._map.layerPointToLatLng(h)
        }, _convertLatLngs: function (t) {
            var i = nn.prototype._convertLatLngs.call(this, t), e = i.length;
            return e >= 2 && i[0] instanceof M && i[0].equals(i[e - 1]) && i.pop(), i
        }, _setLatLngs: function (t) {
            nn.prototype._setLatLngs.call(this, t), jt(this._latlngs) && (this._latlngs = [this._latlngs])
        }, _defaultShape: function () {
            return jt(this._latlngs[0]) ? this._latlngs[0] : this._latlngs[0][0]
        }, _clipPoints: function () {
            var t = this._renderer._bounds, i = this.options.weight, e = new x(i, i);
            if (t = new P(t.min.subtract(e), t.max.add(e)), this._parts = [], this._pxBounds && this._pxBounds.intersects(t)) if (this.options.noClip) this._parts = this._rings; else for (var n, o = 0, s = this._rings.length; o < s; o++) (n = Ht(this._rings[o], t, !0)).length && this._parts.push(n)
        }, _updatePath: function () {
            this._renderer._updatePoly(this, !0)
        }, _containsPoint: function (t) {
            var i, e, n, o, s, r, a, h, u = !1;
            if (!this._pxBounds || !this._pxBounds.contains(t)) return !1;
            for (o = 0, a = this._parts.length; o < a; o++) for (s = 0, r = (h = (i = this._parts[o]).length) - 1; s < h; r = s++) e = i[s], n = i[r], e.y > t.y != n.y > t.y && t.x < (n.x - e.x) * (t.y - e.y) / (n.y - e.y) + e.x && (u = !u);
            return u || nn.prototype._containsPoint.call(this, t, !0)
        }
    }), sn = Ke.extend({
        initialize: function (t, i) {
            l(this, i), this._layers = {}, t && this.addData(t)
        }, addData: function (t) {
            var i, e, n, o = oi(t) ? t : t.features;
            if (o) {
                for (i = 0, e = o.length; i < e; i++) ((n = o[i]).geometries || n.geometry || n.features || n.coordinates) && this.addData(n);
                return this
            }
            var s = this.options;
            if (s.filter && !s.filter(t)) return this;
            var r = Ft(t, s);
            return r ? (r.feature = Yt(t), r.defaultOptions = r.options, this.resetStyle(r), s.onEachFeature && s.onEachFeature(t, r), this.addLayer(r)) : this
        }, resetStyle: function (t) {
            return t.options = i({}, t.defaultOptions), this._setLayerStyle(t, this.options.style), this
        }, setStyle: function (t) {
            return this.eachLayer(function (i) {
                this._setLayerStyle(i, t)
            }, this)
        }, _setLayerStyle: function (t, i) {
            "function" == typeof i && (i = i(t.feature)), t.setStyle && t.setStyle(i)
        }
    }), rn = {
        toGeoJSON: function (t) {
            return Kt(this, {type: "Point", coordinates: qt(this.getLatLng(), t)})
        }
    };
    $e.include(rn), en.include(rn), tn.include(rn), nn.include({
        toGeoJSON: function (t) {
            var i = !jt(this._latlngs), e = Gt(this._latlngs, i ? 1 : 0, !1, t);
            return Kt(this, {type: (i ? "Multi" : "") + "LineString", coordinates: e})
        }
    }), on.include({
        toGeoJSON: function (t) {
            var i = !jt(this._latlngs), e = i && !jt(this._latlngs[0]), n = Gt(this._latlngs, e ? 2 : i ? 1 : 0, !0, t);
            return i || (n = [n]), Kt(this, {type: (e ? "Multi" : "") + "Polygon", coordinates: n})
        }
    }), Ge.include({
        toMultiPoint: function (t) {
            var i = [];
            return this.eachLayer(function (e) {
                i.push(e.toGeoJSON(t).geometry.coordinates)
            }), Kt(this, {type: "MultiPoint", coordinates: i})
        }, toGeoJSON: function (t) {
            var i = this.feature && this.feature.geometry && this.feature.geometry.type;
            if ("MultiPoint" === i) return this.toMultiPoint(t);
            var e = "GeometryCollection" === i, n = [];
            return this.eachLayer(function (i) {
                if (i.toGeoJSON) {
                    var o = i.toGeoJSON(t);
                    if (e) n.push(o.geometry); else {
                        var s = Yt(o);
                        "FeatureCollection" === s.type ? n.push.apply(n, s.features) : n.push(s)
                    }
                }
            }), e ? Kt(this, {geometries: n, type: "GeometryCollection"}) : {type: "FeatureCollection", features: n}
        }
    });
    var an = Xt, hn = qe.extend({
        options: {
            opacity: 1,
            alt: "",
            interactive: !1,
            crossOrigin: !1,
            errorOverlayUrl: "",
            zIndex: 1,
            className: ""
        }, initialize: function (t, i, e) {
            this._url = t, this._bounds = z(i), l(this, e)
        }, onAdd: function () {
            this._image || (this._initImage(), this.options.opacity < 1 && this._updateOpacity()), this.options.interactive && (Q(this._image, "leaflet-interactive"), this.addInteractiveTarget(this._image)), this.getPane().appendChild(this._image), this._reset()
        }, onRemove: function () {
            K(this._image), this.options.interactive && this.removeInteractiveTarget(this._image)
        }, setOpacity: function (t) {
            return this.options.opacity = t, this._image && this._updateOpacity(), this
        }, setStyle: function (t) {
            return t.opacity && this.setOpacity(t.opacity), this
        }, bringToFront: function () {
            return this._map && X(this._image), this
        }, bringToBack: function () {
            return this._map && J(this._image), this
        }, setUrl: function (t) {
            return this._url = t, this._image && (this._image.src = t), this
        }, setBounds: function (t) {
            return this._bounds = z(t), this._map && this._reset(), this
        }, getEvents: function () {
            var t = {zoom: this._reset, viewreset: this._reset};
            return this._zoomAnimated && (t.zoomanim = this._animateZoom), t
        }, setZIndex: function (t) {
            return this.options.zIndex = t, this._updateZIndex(), this
        }, getBounds: function () {
            return this._bounds
        }, getElement: function () {
            return this._image
        }, _initImage: function () {
            var t = "IMG" === this._url.tagName, i = this._image = t ? this._url : G("img");
            Q(i, "leaflet-image-layer"), this._zoomAnimated && Q(i, "leaflet-zoom-animated"), this.options.className && Q(i, this.options.className), i.onselectstart = r, i.onmousemove = r, i.onload = e(this.fire, this, "load"), i.onerror = e(this._overlayOnError, this, "error"), (this.options.crossOrigin || "" === this.options.crossOrigin) && (i.crossOrigin = !0 === this.options.crossOrigin ? "" : this.options.crossOrigin), this.options.zIndex && this._updateZIndex(), t ? this._url = i.src : (i.src = this._url, i.alt = this.options.alt)
        }, _animateZoom: function (t) {
            var i = this._map.getZoomScale(t.zoom),
                e = this._map._latLngBoundsToNewLayerBounds(this._bounds, t.zoom, t.center).min;
            rt(this._image, e, i)
        }, _reset: function () {
            var t = this._image,
                i = new P(this._map.latLngToLayerPoint(this._bounds.getNorthWest()), this._map.latLngToLayerPoint(this._bounds.getSouthEast())),
                e = i.getSize();
            at(t, i.min), t.style.width = e.x + "px", t.style.height = e.y + "px"
        }, _updateOpacity: function () {
            nt(this._image, this.options.opacity)
        }, _updateZIndex: function () {
            this._image && void 0 !== this.options.zIndex && null !== this.options.zIndex && (this._image.style.zIndex = this.options.zIndex)
        }, _overlayOnError: function () {
            this.fire("error");
            var t = this.options.errorOverlayUrl;
            t && this._url !== t && (this._url = t, this._image.src = t)
        }
    }), un = hn.extend({
        options: {autoplay: !0, loop: !0}, _initImage: function () {
            var t = "VIDEO" === this._url.tagName, i = this._image = t ? this._url : G("video");
            if (Q(i, "leaflet-image-layer"), this._zoomAnimated && Q(i, "leaflet-zoom-animated"), i.onselectstart = r, i.onmousemove = r, i.onloadeddata = e(this.fire, this, "load"), t) {
                for (var n = i.getElementsByTagName("source"), o = [], s = 0; s < n.length; s++) o.push(n[s].src);
                this._url = n.length > 0 ? o : [i.src]
            } else {
                oi(this._url) || (this._url = [this._url]), i.autoplay = !!this.options.autoplay, i.loop = !!this.options.loop;
                for (var a = 0; a < this._url.length; a++) {
                    var h = G("source");
                    h.src = this._url[a], i.appendChild(h)
                }
            }
        }
    }), ln = qe.extend({
        options: {offset: [0, 7], className: "", pane: "popupPane"}, initialize: function (t, i) {
            l(this, t), this._source = i
        }, onAdd: function (t) {
            this._zoomAnimated = t._zoomAnimated, this._container || this._initLayout(), t._fadeAnimated && nt(this._container, 0), clearTimeout(this._removeTimeout), this.getPane().appendChild(this._container), this.update(), t._fadeAnimated && nt(this._container, 1), this.bringToFront()
        }, onRemove: function (t) {
            t._fadeAnimated ? (nt(this._container, 0), this._removeTimeout = setTimeout(e(K, void 0, this._container), 200)) : K(this._container)
        }, getLatLng: function () {
            return this._latlng
        }, setLatLng: function (t) {
            return this._latlng = C(t), this._map && (this._updatePosition(), this._adjustPan()), this
        }, getContent: function () {
            return this._content
        }, setContent: function (t) {
            return this._content = t, this.update(), this
        }, getElement: function () {
            return this._container
        }, update: function () {
            this._map && (this._container.style.visibility = "hidden", this._updateContent(), this._updateLayout(), this._updatePosition(), this._container.style.visibility = "", this._adjustPan())
        }, getEvents: function () {
            var t = {zoom: this._updatePosition, viewreset: this._updatePosition};
            return this._zoomAnimated && (t.zoomanim = this._animateZoom), t
        }, isOpen: function () {
            return !!this._map && this._map.hasLayer(this)
        }, bringToFront: function () {
            return this._map && X(this._container), this
        }, bringToBack: function () {
            return this._map && J(this._container), this
        }, _updateContent: function () {
            if (this._content) {
                var t = this._contentNode,
                    i = "function" == typeof this._content ? this._content(this._source || this) : this._content;
                if ("string" == typeof i) t.innerHTML = i; else {
                    for (; t.hasChildNodes();) t.removeChild(t.firstChild);
                    t.appendChild(i)
                }
                this.fire("contentupdate")
            }
        }, _updatePosition: function () {
            if (this._map) {
                var t = this._map.latLngToLayerPoint(this._latlng), i = w(this.options.offset), e = this._getAnchor();
                this._zoomAnimated ? at(this._container, t.add(e)) : i = i.add(t).add(e);
                var n = this._containerBottom = -i.y,
                    o = this._containerLeft = -Math.round(this._containerWidth / 2) + i.x;
                this._container.style.bottom = n + "px", this._container.style.left = o + "px"
            }
        }, _getAnchor: function () {
            return [0, 0]
        }
    }), cn = ln.extend({
        options: {
            maxWidth: 300,
            minWidth: 50,
            maxHeight: null,
            autoPan: !0,
            autoPanPaddingTopLeft: null,
            autoPanPaddingBottomRight: null,
            autoPanPadding: [5, 5],
            keepInView: !1,
            closeButton: !0,
            autoClose: !0,
            closeOnEscapeKey: !0,
            className: ""
        }, openOn: function (t) {
            return t.openPopup(this), this
        }, onAdd: function (t) {
            ln.prototype.onAdd.call(this, t), t.fire("popupopen", {popup: this}), this._source && (this._source.fire("popupopen", {popup: this}, !0), this._source instanceof Qe || this._source.on("preclick", yt))
        }, onRemove: function (t) {
            ln.prototype.onRemove.call(this, t), t.fire("popupclose", {popup: this}), this._source && (this._source.fire("popupclose", {popup: this}, !0), this._source instanceof Qe || this._source.off("preclick", yt))
        }, getEvents: function () {
            var t = ln.prototype.getEvents.call(this);
            return (void 0 !== this.options.closeOnClick ? this.options.closeOnClick : this._map.options.closePopupOnClick) && (t.preclick = this._close), this.options.keepInView && (t.moveend = this._adjustPan), t
        }, _close: function () {
            this._map && this._map.closePopup(this)
        }, _initLayout: function () {
            var t = "leaflet-popup",
                i = this._container = G("div", t + " " + (this.options.className || "") + " leaflet-zoom-animated"),
                e = this._wrapper = G("div", t + "-content-wrapper", i);
            if (this._contentNode = G("div", t + "-content", e), wt(e), xt(this._contentNode), mt(e, "contextmenu", yt), this._tipContainer = G("div", t + "-tip-container", i), this._tip = G("div", t + "-tip", this._tipContainer), this.options.closeButton) {
                var n = this._closeButton = G("a", t + "-close-button", i);
                n.href = "#close", n.innerHTML = "&#215;", mt(n, "click", this._onCloseButtonClick, this)
            }
        }, _updateLayout: function () {
            var t = this._contentNode, i = t.style;
            i.width = "", i.whiteSpace = "nowrap";
            var e = t.offsetWidth;
            e = Math.min(e, this.options.maxWidth), e = Math.max(e, this.options.minWidth), i.width = e + 1 + "px", i.whiteSpace = "", i.height = "";
            var n = t.offsetHeight, o = this.options.maxHeight;
            o && n > o ? (i.height = o + "px", Q(t, "leaflet-popup-scrolled")) : tt(t, "leaflet-popup-scrolled"), this._containerWidth = this._container.offsetWidth
        }, _animateZoom: function (t) {
            var i = this._map._latLngToNewLayerPoint(this._latlng, t.zoom, t.center), e = this._getAnchor();
            at(this._container, i.add(e))
        }, _adjustPan: function () {
            if (!(!this.options.autoPan || this._map._panAnim && this._map._panAnim._inProgress)) {
                var t = this._map, i = parseInt(q(this._container, "marginBottom"), 10) || 0,
                    e = this._container.offsetHeight + i, n = this._containerWidth,
                    o = new x(this._containerLeft, -e - this._containerBottom);
                o._add(ht(this._container));
                var s = t.layerPointToContainerPoint(o), r = w(this.options.autoPanPadding),
                    a = w(this.options.autoPanPaddingTopLeft || r), h = w(this.options.autoPanPaddingBottomRight || r),
                    u = t.getSize(), l = 0, c = 0;
                s.x + n + h.x > u.x && (l = s.x + n - u.x + h.x), s.x - l - a.x < 0 && (l = s.x - a.x), s.y + e + h.y > u.y && (c = s.y + e - u.y + h.y), s.y - c - a.y < 0 && (c = s.y - a.y), (l || c) && t.fire("autopanstart").panBy([l, c])
            }
        }, _onCloseButtonClick: function (t) {
            this._close(), Lt(t)
        }, _getAnchor: function () {
            return w(this._source && this._source._getPopupAnchor ? this._source._getPopupAnchor() : [0, 0])
        }
    });
    be.mergeOptions({closePopupOnClick: !0}), be.include({
        openPopup: function (t, i, e) {
            return t instanceof cn || (t = new cn(e).setContent(t)), i && t.setLatLng(i), this.hasLayer(t) ? this : (this._popup && this._popup.options.autoClose && this.closePopup(), this._popup = t, this.addLayer(t))
        }, closePopup: function (t) {
            return t && t !== this._popup || (t = this._popup, this._popup = null), t && this.removeLayer(t), this
        }
    }), qe.include({
        bindPopup: function (t, i) {
            return t instanceof cn ? (l(t, i), this._popup = t, t._source = this) : (this._popup && !i || (this._popup = new cn(i, this)), this._popup.setContent(t)), this._popupHandlersAdded || (this.on({
                click: this._openPopup,
                keypress: this._onKeyPress,
                remove: this.closePopup,
                move: this._movePopup
            }), this._popupHandlersAdded = !0), this
        }, unbindPopup: function () {
            return this._popup && (this.off({
                click: this._openPopup,
                keypress: this._onKeyPress,
                remove: this.closePopup,
                move: this._movePopup
            }), this._popupHandlersAdded = !1, this._popup = null), this
        }, openPopup: function (t, i) {
            if (t instanceof qe || (i = t, t = this), t instanceof Ke) for (var e in this._layers) {
                t = this._layers[e];
                break
            }
            return i || (i = t.getCenter ? t.getCenter() : t.getLatLng()), this._popup && this._map && (this._popup._source = t, this._popup.update(), this._map.openPopup(this._popup, i)), this
        }, closePopup: function () {
            return this._popup && this._popup._close(), this
        }, togglePopup: function (t) {
            return this._popup && (this._popup._map ? this.closePopup() : this.openPopup(t)), this
        }, isPopupOpen: function () {
            return !!this._popup && this._popup.isOpen()
        }, setPopupContent: function (t) {
            return this._popup && this._popup.setContent(t), this
        }, getPopup: function () {
            return this._popup
        }, _openPopup: function (t) {
            var i = t.layer || t.target;
            this._popup && this._map && (Lt(t), i instanceof Qe ? this.openPopup(t.layer || t.target, t.latlng) : this._map.hasLayer(this._popup) && this._popup._source === i ? this.closePopup() : this.openPopup(i, t.latlng))
        }, _movePopup: function (t) {
            this._popup.setLatLng(t.latlng)
        }, _onKeyPress: function (t) {
            13 === t.originalEvent.keyCode && this._openPopup(t)
        }
    });
    var _n = ln.extend({
        options: {
            pane: "tooltipPane",
            offset: [0, 0],
            direction: "auto",
            permanent: !1,
            sticky: !1,
            interactive: !1,
            opacity: .9
        }, onAdd: function (t) {
            ln.prototype.onAdd.call(this, t), this.setOpacity(this.options.opacity), t.fire("tooltipopen", {tooltip: this}), this._source && this._source.fire("tooltipopen", {tooltip: this}, !0)
        }, onRemove: function (t) {
            ln.prototype.onRemove.call(this, t), t.fire("tooltipclose", {tooltip: this}), this._source && this._source.fire("tooltipclose", {tooltip: this}, !0)
        }, getEvents: function () {
            var t = ln.prototype.getEvents.call(this);
            return qi && !this.options.permanent && (t.preclick = this._close), t
        }, _close: function () {
            this._map && this._map.closeTooltip(this)
        }, _initLayout: function () {
            var t = "leaflet-tooltip " + (this.options.className || "") + " leaflet-zoom-" + (this._zoomAnimated ? "animated" : "hide");
            this._contentNode = this._container = G("div", t)
        }, _updateLayout: function () {
        }, _adjustPan: function () {
        }, _setPosition: function (t) {
            var i = this._map, e = this._container, n = i.latLngToContainerPoint(i.getCenter()),
                o = i.layerPointToContainerPoint(t), s = this.options.direction, r = e.offsetWidth, a = e.offsetHeight,
                h = w(this.options.offset), u = this._getAnchor();
            "top" === s ? t = t.add(w(-r / 2 + h.x, -a + h.y + u.y, !0)) : "bottom" === s ? t = t.subtract(w(r / 2 - h.x, -h.y, !0)) : "center" === s ? t = t.subtract(w(r / 2 + h.x, a / 2 - u.y + h.y, !0)) : "right" === s || "auto" === s && o.x < n.x ? (s = "right", t = t.add(w(h.x + u.x, u.y - a / 2 + h.y, !0))) : (s = "left", t = t.subtract(w(r + u.x - h.x, a / 2 - u.y - h.y, !0))), tt(e, "leaflet-tooltip-right"), tt(e, "leaflet-tooltip-left"), tt(e, "leaflet-tooltip-top"), tt(e, "leaflet-tooltip-bottom"), Q(e, "leaflet-tooltip-" + s), at(e, t)
        }, _updatePosition: function () {
            var t = this._map.latLngToLayerPoint(this._latlng);
            this._setPosition(t)
        }, setOpacity: function (t) {
            this.options.opacity = t, this._container && nt(this._container, t)
        }, _animateZoom: function (t) {
            var i = this._map._latLngToNewLayerPoint(this._latlng, t.zoom, t.center);
            this._setPosition(i)
        }, _getAnchor: function () {
            return w(this._source && this._source._getTooltipAnchor && !this.options.sticky ? this._source._getTooltipAnchor() : [0, 0])
        }
    });
    be.include({
        openTooltip: function (t, i, e) {
            return t instanceof _n || (t = new _n(e).setContent(t)), i && t.setLatLng(i), this.hasLayer(t) ? this : this.addLayer(t)
        }, closeTooltip: function (t) {
            return t && this.removeLayer(t), this
        }
    }), qe.include({
        bindTooltip: function (t, i) {
            return t instanceof _n ? (l(t, i), this._tooltip = t, t._source = this) : (this._tooltip && !i || (this._tooltip = new _n(i, this)), this._tooltip.setContent(t)), this._initTooltipInteractions(), this._tooltip.options.permanent && this._map && this._map.hasLayer(this) && this.openTooltip(), this
        }, unbindTooltip: function () {
            return this._tooltip && (this._initTooltipInteractions(!0), this.closeTooltip(), this._tooltip = null), this
        }, _initTooltipInteractions: function (t) {
            if (t || !this._tooltipHandlersAdded) {
                var i = t ? "off" : "on", e = {remove: this.closeTooltip, move: this._moveTooltip};
                this._tooltip.options.permanent ? e.add = this._openTooltip : (e.mouseover = this._openTooltip, e.mouseout = this.closeTooltip, this._tooltip.options.sticky && (e.mousemove = this._moveTooltip), qi && (e.click = this._openTooltip)), this[i](e), this._tooltipHandlersAdded = !t
            }
        }, openTooltip: function (t, i) {
            if (t instanceof qe || (i = t, t = this), t instanceof Ke) for (var e in this._layers) {
                t = this._layers[e];
                break
            }
            return i || (i = t.getCenter ? t.getCenter() : t.getLatLng()), this._tooltip && this._map && (this._tooltip._source = t, this._tooltip.update(), this._map.openTooltip(this._tooltip, i), this._tooltip.options.interactive && this._tooltip._container && (Q(this._tooltip._container, "leaflet-clickable"), this.addInteractiveTarget(this._tooltip._container))), this
        }, closeTooltip: function () {
            return this._tooltip && (this._tooltip._close(), this._tooltip.options.interactive && this._tooltip._container && (tt(this._tooltip._container, "leaflet-clickable"), this.removeInteractiveTarget(this._tooltip._container))), this
        }, toggleTooltip: function (t) {
            return this._tooltip && (this._tooltip._map ? this.closeTooltip() : this.openTooltip(t)), this
        }, isTooltipOpen: function () {
            return this._tooltip.isOpen()
        }, setTooltipContent: function (t) {
            return this._tooltip && this._tooltip.setContent(t), this
        }, getTooltip: function () {
            return this._tooltip
        }, _openTooltip: function (t) {
            var i = t.layer || t.target;
            this._tooltip && this._map && this.openTooltip(i, this._tooltip.options.sticky ? t.latlng : void 0)
        }, _moveTooltip: function (t) {
            var i, e, n = t.latlng;
            this._tooltip.options.sticky && t.originalEvent && (i = this._map.mouseEventToContainerPoint(t.originalEvent), e = this._map.containerPointToLayerPoint(i), n = this._map.layerPointToLatLng(e)), this._tooltip.setLatLng(n)
        }
    });
    var dn = Ye.extend({
        options: {iconSize: [12, 12], html: !1, bgPos: null, className: "leaflet-div-icon"},
        createIcon: function (t) {
            var i = t && "DIV" === t.tagName ? t : document.createElement("div"), e = this.options;
            if (i.innerHTML = !1 !== e.html ? e.html : "", e.bgPos) {
                var n = w(e.bgPos);
                i.style.backgroundPosition = -n.x + "px " + -n.y + "px"
            }
            return this._setIconStyles(i, "icon"), i
        },
        createShadow: function () {
            return null
        }
    });
    Ye.Default = Xe;
    var pn = qe.extend({
        options: {
            tileSize: 256,
            opacity: 1,
            updateWhenIdle: Wi,
            updateWhenZooming: !0,
            updateInterval: 200,
            zIndex: 1,
            bounds: null,
            minZoom: 0,
            maxZoom: void 0,
            maxNativeZoom: void 0,
            minNativeZoom: void 0,
            noWrap: !1,
            pane: "tilePane",
            className: "",
            keepBuffer: 2
        }, initialize: function (t) {
            l(this, t)
        }, onAdd: function () {
            this._initContainer(), this._levels = {}, this._tiles = {}, this._resetView(), this._update()
        }, beforeAdd: function (t) {
            t._addZoomLimit(this)
        }, onRemove: function (t) {
            this._removeAllTiles(), K(this._container), t._removeZoomLimit(this), this._container = null, this._tileZoom = void 0
        }, bringToFront: function () {
            return this._map && (X(this._container), this._setAutoZIndex(Math.max)), this
        }, bringToBack: function () {
            return this._map && (J(this._container), this._setAutoZIndex(Math.min)), this
        }, getContainer: function () {
            return this._container
        }, setOpacity: function (t) {
            return this.options.opacity = t, this._updateOpacity(), this
        }, setZIndex: function (t) {
            return this.options.zIndex = t, this._updateZIndex(), this
        }, isLoading: function () {
            return this._loading
        }, redraw: function () {
            return this._map && (this._removeAllTiles(), this._update()), this
        }, getEvents: function () {
            var t = {
                viewprereset: this._invalidateAll,
                viewreset: this._resetView,
                zoom: this._resetView,
                moveend: this._onMoveEnd
            };
            return this.options.updateWhenIdle || (this._onMove || (this._onMove = o(this._onMoveEnd, this.options.updateInterval, this)), t.move = this._onMove), this._zoomAnimated && (t.zoomanim = this._animateZoom), t
        }, createTile: function () {
            return document.createElement("div")
        }, getTileSize: function () {
            var t = this.options.tileSize;
            return t instanceof x ? t : new x(t, t)
        }, _updateZIndex: function () {
            this._container && void 0 !== this.options.zIndex && null !== this.options.zIndex && (this._container.style.zIndex = this.options.zIndex)
        }, _setAutoZIndex: function (t) {
            for (var i, e = this.getPane().children, n = -t(-1 / 0, 1 / 0), o = 0, s = e.length; o < s; o++) i = e[o].style.zIndex, e[o] !== this._container && i && (n = t(n, +i));
            isFinite(n) && (this.options.zIndex = n + t(-1, 1), this._updateZIndex())
        }, _updateOpacity: function () {
            if (this._map && !Li) {
                nt(this._container, this.options.opacity);
                var t = +new Date, i = !1, e = !1;
                for (var n in this._tiles) {
                    var o = this._tiles[n];
                    if (o.current && o.loaded) {
                        var s = Math.min(1, (t - o.loaded) / 200);
                        nt(o.el, s), s < 1 ? i = !0 : (o.active ? e = !0 : this._onOpaqueTile(o), o.active = !0)
                    }
                }
                e && !this._noPrune && this._pruneTiles(), i && (g(this._fadeFrame), this._fadeFrame = f(this._updateOpacity, this))
            }
        }, _onOpaqueTile: r, _initContainer: function () {
            this._container || (this._container = G("div", "leaflet-layer " + (this.options.className || "")), this._updateZIndex(), this.options.opacity < 1 && this._updateOpacity(), this.getPane().appendChild(this._container))
        }, _updateLevels: function () {
            var t = this._tileZoom, i = this.options.maxZoom;
            if (void 0 !== t) {
                for (var e in this._levels) this._levels[e].el.children.length || e === t ? (this._levels[e].el.style.zIndex = i - Math.abs(t - e), this._onUpdateLevel(e)) : (K(this._levels[e].el), this._removeTilesAtZoom(e), this._onRemoveLevel(e), delete this._levels[e]);
                var n = this._levels[t], o = this._map;
                return n || ((n = this._levels[t] = {}).el = G("div", "leaflet-tile-container leaflet-zoom-animated", this._container), n.el.style.zIndex = i, n.origin = o.project(o.unproject(o.getPixelOrigin()), t).round(), n.zoom = t, this._setZoomTransform(n, o.getCenter(), o.getZoom()), n.el.offsetWidth, this._onCreateLevel(n)), this._level = n, n
            }
        }, _onUpdateLevel: r, _onRemoveLevel: r, _onCreateLevel: r, _pruneTiles: function () {
            if (this._map) {
                var t, i, e = this._map.getZoom();
                if (e > this.options.maxZoom || e < this.options.minZoom) this._removeAllTiles(); else {
                    for (t in this._tiles) (i = this._tiles[t]).retain = i.current;
                    for (t in this._tiles) if ((i = this._tiles[t]).current && !i.active) {
                        var n = i.coords;
                        this._retainParent(n.x, n.y, n.z, n.z - 5) || this._retainChildren(n.x, n.y, n.z, n.z + 2)
                    }
                    for (t in this._tiles) this._tiles[t].retain || this._removeTile(t)
                }
            }
        }, _removeTilesAtZoom: function (t) {
            for (var i in this._tiles) this._tiles[i].coords.z === t && this._removeTile(i)
        }, _removeAllTiles: function () {
            for (var t in this._tiles) this._removeTile(t)
        }, _invalidateAll: function () {
            for (var t in this._levels) K(this._levels[t].el), this._onRemoveLevel(t), delete this._levels[t];
            this._removeAllTiles(), this._tileZoom = void 0
        }, _retainParent: function (t, i, e, n) {
            var o = Math.floor(t / 2), s = Math.floor(i / 2), r = e - 1, a = new x(+o, +s);
            a.z = +r;
            var h = this._tileCoordsToKey(a), u = this._tiles[h];
            return u && u.active ? (u.retain = !0, !0) : (u && u.loaded && (u.retain = !0), r > n && this._retainParent(o, s, r, n))
        }, _retainChildren: function (t, i, e, n) {
            for (var o = 2 * t; o < 2 * t + 2; o++) for (var s = 2 * i; s < 2 * i + 2; s++) {
                var r = new x(o, s);
                r.z = e + 1;
                var a = this._tileCoordsToKey(r), h = this._tiles[a];
                h && h.active ? h.retain = !0 : (h && h.loaded && (h.retain = !0), e + 1 < n && this._retainChildren(o, s, e + 1, n))
            }
        }, _resetView: function (t) {
            var i = t && (t.pinch || t.flyTo);
            this._setView(this._map.getCenter(), this._map.getZoom(), i, i)
        }, _animateZoom: function (t) {
            this._setView(t.center, t.zoom, !0, t.noUpdate)
        }, _clampZoom: function (t) {
            var i = this.options;
            return void 0 !== i.minNativeZoom && t < i.minNativeZoom ? i.minNativeZoom : void 0 !== i.maxNativeZoom && i.maxNativeZoom < t ? i.maxNativeZoom : t
        }, _setView: function (t, i, e, n) {
            var o = this._clampZoom(Math.round(i));
            (void 0 !== this.options.maxZoom && o > this.options.maxZoom || void 0 !== this.options.minZoom && o < this.options.minZoom) && (o = void 0);
            var s = this.options.updateWhenZooming && o !== this._tileZoom;
            n && !s || (this._tileZoom = o, this._abortLoading && this._abortLoading(), this._updateLevels(), this._resetGrid(), void 0 !== o && this._update(t), e || this._pruneTiles(), this._noPrune = !!e), this._setZoomTransforms(t, i)
        }, _setZoomTransforms: function (t, i) {
            for (var e in this._levels) this._setZoomTransform(this._levels[e], t, i)
        }, _setZoomTransform: function (t, i, e) {
            var n = this._map.getZoomScale(e, t.zoom),
                o = t.origin.multiplyBy(n).subtract(this._map._getNewPixelOrigin(i, e)).round();
            ji ? rt(t.el, o, n) : at(t.el, o)
        }, _resetGrid: function () {
            var t = this._map, i = t.options.crs, e = this._tileSize = this.getTileSize(), n = this._tileZoom,
                o = this._map.getPixelWorldBounds(this._tileZoom);
            o && (this._globalTileRange = this._pxBoundsToTileRange(o)), this._wrapX = i.wrapLng && !this.options.noWrap && [Math.floor(t.project([0, i.wrapLng[0]], n).x / e.x), Math.ceil(t.project([0, i.wrapLng[1]], n).x / e.y)], this._wrapY = i.wrapLat && !this.options.noWrap && [Math.floor(t.project([i.wrapLat[0], 0], n).y / e.x), Math.ceil(t.project([i.wrapLat[1], 0], n).y / e.y)]
        }, _onMoveEnd: function () {
            this._map && !this._map._animatingZoom && this._update()
        }, _getTiledPixelBounds: function (t) {
            var i = this._map, e = i._animatingZoom ? Math.max(i._animateToZoom, i.getZoom()) : i.getZoom(),
                n = i.getZoomScale(e, this._tileZoom), o = i.project(t, this._tileZoom).floor(),
                s = i.getSize().divideBy(2 * n);
            return new P(o.subtract(s), o.add(s))
        }, _update: function (t) {
            var i = this._map;
            if (i) {
                var e = this._clampZoom(i.getZoom());
                if (void 0 === t && (t = i.getCenter()), void 0 !== this._tileZoom) {
                    var n = this._getTiledPixelBounds(t), o = this._pxBoundsToTileRange(n), s = o.getCenter(), r = [],
                        a = this.options.keepBuffer,
                        h = new P(o.getBottomLeft().subtract([a, -a]), o.getTopRight().add([a, -a]));
                    if (!(isFinite(o.min.x) && isFinite(o.min.y) && isFinite(o.max.x) && isFinite(o.max.y))) throw new Error("Attempted to load an infinite number of tiles");
                    for (var u in this._tiles) {
                        var l = this._tiles[u].coords;
                        l.z === this._tileZoom && h.contains(new x(l.x, l.y)) || (this._tiles[u].current = !1)
                    }
                    if (Math.abs(e - this._tileZoom) > 1) this._setView(t, e); else {
                        for (var c = o.min.y; c <= o.max.y; c++) for (var _ = o.min.x; _ <= o.max.x; _++) {
                            var d = new x(_, c);
                            if (d.z = this._tileZoom, this._isValidTile(d)) {
                                var p = this._tiles[this._tileCoordsToKey(d)];
                                p ? p.current = !0 : r.push(d)
                            }
                        }
                        if (r.sort(function (t, i) {
                            return t.distanceTo(s) - i.distanceTo(s)
                        }), 0 !== r.length) {
                            this._loading || (this._loading = !0, this.fire("loading"));
                            var m = document.createDocumentFragment();
                            for (_ = 0; _ < r.length; _++) this._addTile(r[_], m);
                            this._level.el.appendChild(m)
                        }
                    }
                }
            }
        }, _isValidTile: function (t) {
            var i = this._map.options.crs;
            if (!i.infinite) {
                var e = this._globalTileRange;
                if (!i.wrapLng && (t.x < e.min.x || t.x > e.max.x) || !i.wrapLat && (t.y < e.min.y || t.y > e.max.y)) return !1
            }
            if (!this.options.bounds) return !0;
            var n = this._tileCoordsToBounds(t);
            return z(this.options.bounds).overlaps(n)
        }, _keyToBounds: function (t) {
            return this._tileCoordsToBounds(this._keyToTileCoords(t))
        }, _tileCoordsToNwSe: function (t) {
            var i = this._map, e = this.getTileSize(), n = t.scaleBy(e), o = n.add(e);
            return [i.unproject(n, t.z), i.unproject(o, t.z)]
        }, _tileCoordsToBounds: function (t) {
            var i = this._tileCoordsToNwSe(t), e = new T(i[0], i[1]);
            return this.options.noWrap || (e = this._map.wrapLatLngBounds(e)), e
        }, _tileCoordsToKey: function (t) {
            return t.x + ":" + t.y + ":" + t.z
        }, _keyToTileCoords: function (t) {
            var i = t.split(":"), e = new x(+i[0], +i[1]);
            return e.z = +i[2], e
        }, _removeTile: function (t) {
            var i = this._tiles[t];
            i && (K(i.el), delete this._tiles[t], this.fire("tileunload", {
                tile: i.el,
                coords: this._keyToTileCoords(t)
            }))
        }, _initTile: function (t) {
            Q(t, "leaflet-tile");
            var i = this.getTileSize();
            t.style.width = i.x + "px", t.style.height = i.y + "px", t.onselectstart = r, t.onmousemove = r, Li && this.options.opacity < 1 && nt(t, this.options.opacity), zi && !Mi && (t.style.WebkitBackfaceVisibility = "hidden")
        }, _addTile: function (t, i) {
            var n = this._getTilePos(t), o = this._tileCoordsToKey(t),
                s = this.createTile(this._wrapCoords(t), e(this._tileReady, this, t));
            this._initTile(s), this.createTile.length < 2 && f(e(this._tileReady, this, t, null, s)), at(s, n), this._tiles[o] = {
                el: s,
                coords: t,
                current: !0
            }, i.appendChild(s), this.fire("tileloadstart", {tile: s, coords: t})
        }, _tileReady: function (t, i, n) {
            i && this.fire("tileerror", {error: i, tile: n, coords: t});
            var o = this._tileCoordsToKey(t);
            (n = this._tiles[o]) && (n.loaded = +new Date, this._map._fadeAnimated ? (nt(n.el, 0), g(this._fadeFrame), this._fadeFrame = f(this._updateOpacity, this)) : (n.active = !0, this._pruneTiles()), i || (Q(n.el, "leaflet-tile-loaded"), this.fire("tileload", {
                tile: n.el,
                coords: t
            })), this._noTilesToLoad() && (this._loading = !1, this.fire("load"), Li || !this._map._fadeAnimated ? f(this._pruneTiles, this) : setTimeout(e(this._pruneTiles, this), 250)))
        }, _getTilePos: function (t) {
            return t.scaleBy(this.getTileSize()).subtract(this._level.origin)
        }, _wrapCoords: function (t) {
            var i = new x(this._wrapX ? s(t.x, this._wrapX) : t.x, this._wrapY ? s(t.y, this._wrapY) : t.y);
            return i.z = t.z, i
        }, _pxBoundsToTileRange: function (t) {
            var i = this.getTileSize();
            return new P(t.min.unscaleBy(i).floor(), t.max.unscaleBy(i).ceil().subtract([1, 1]))
        }, _noTilesToLoad: function () {
            for (var t in this._tiles) if (!this._tiles[t].loaded) return !1;
            return !0
        }
    }), mn = pn.extend({
        options: {
            minZoom: 0,
            maxZoom: 18,
            subdomains: "abc",
            errorTileUrl: "",
            zoomOffset: 0,
            tms: !1,
            zoomReverse: !1,
            detectRetina: !1,
            crossOrigin: !1
        }, initialize: function (t, i) {
            this._url = t, (i = l(this, i)).detectRetina && Yi && i.maxZoom > 0 && (i.tileSize = Math.floor(i.tileSize / 2), i.zoomReverse ? (i.zoomOffset--, i.minZoom++) : (i.zoomOffset++, i.maxZoom--), i.minZoom = Math.max(0, i.minZoom)), "string" == typeof i.subdomains && (i.subdomains = i.subdomains.split("")), zi || this.on("tileunload", this._onTileRemove)
        }, setUrl: function (t, i) {
            return this._url = t, i || this.redraw(), this
        }, createTile: function (t, i) {
            var n = document.createElement("img");
            return mt(n, "load", e(this._tileOnLoad, this, i, n)), mt(n, "error", e(this._tileOnError, this, i, n)), (this.options.crossOrigin || "" === this.options.crossOrigin) && (n.crossOrigin = !0 === this.options.crossOrigin ? "" : this.options.crossOrigin), n.alt = "", n.setAttribute("role", "presentation"), n.src = this.getTileUrl(t), n
        }, getTileUrl: function (t) {
            var e = {r: Yi ? "@2x" : "", s: this._getSubdomain(t), x: t.x, y: t.y, z: this._getZoomForUrl()};
            if (this._map && !this._map.options.crs.infinite) {
                var n = this._globalTileRange.max.y - t.y;
                this.options.tms && (e.y = n), e["-y"] = n
            }
            return _(this._url, i(e, this.options))
        }, _tileOnLoad: function (t, i) {
            Li ? setTimeout(e(t, this, null, i), 0) : t(null, i)
        }, _tileOnError: function (t, i, e) {
            var n = this.options.errorTileUrl;
            n && i.getAttribute("src") !== n && (i.src = n), t(e, i)
        }, _onTileRemove: function (t) {
            t.tile.onload = null
        }, _getZoomForUrl: function () {
            var t = this._tileZoom, i = this.options.maxZoom, e = this.options.zoomReverse, n = this.options.zoomOffset;
            return e && (t = i - t), t + n
        }, _getSubdomain: function (t) {
            var i = Math.abs(t.x + t.y) % this.options.subdomains.length;
            return this.options.subdomains[i]
        }, _abortLoading: function () {
            var t, i;
            for (t in this._tiles) this._tiles[t].coords.z !== this._tileZoom && ((i = this._tiles[t].el).onload = r, i.onerror = r, i.complete || (i.src = si, K(i), delete this._tiles[t]))
        }, _removeTile: function (t) {
            var i = this._tiles[t];
            if (i) return Si || i.el.setAttribute("src", si), pn.prototype._removeTile.call(this, t)
        }, _tileReady: function (t, i, e) {
            if (this._map && (!e || e.getAttribute("src") !== si)) return pn.prototype._tileReady.call(this, t, i, e)
        }
    }), fn = mn.extend({
        defaultWmsParams: {
            service: "WMS",
            request: "GetMap",
            layers: "",
            styles: "",
            format: "image/jpeg",
            transparent: !1,
            version: "1.1.1"
        }, options: {crs: null, uppercase: !1}, initialize: function (t, e) {
            this._url = t;
            var n = i({}, this.defaultWmsParams);
            for (var o in e) o in this.options || (n[o] = e[o]);
            var s = (e = l(this, e)).detectRetina && Yi ? 2 : 1, r = this.getTileSize();
            n.width = r.x * s, n.height = r.y * s, this.wmsParams = n
        }, onAdd: function (t) {
            this._crs = this.options.crs || t.options.crs, this._wmsVersion = parseFloat(this.wmsParams.version);
            var i = this._wmsVersion >= 1.3 ? "crs" : "srs";
            this.wmsParams[i] = this._crs.code, mn.prototype.onAdd.call(this, t)
        }, getTileUrl: function (t) {
            var i = this._tileCoordsToNwSe(t), e = this._crs, n = b(e.project(i[0]), e.project(i[1])), o = n.min,
                s = n.max,
                r = (this._wmsVersion >= 1.3 && this._crs === Ue ? [o.y, o.x, s.y, s.x] : [o.x, o.y, s.x, s.y]).join(","),
                a = mn.prototype.getTileUrl.call(this, t);
            return a + c(this.wmsParams, a, this.options.uppercase) + (this.options.uppercase ? "&BBOX=" : "&bbox=") + r
        }, setParams: function (t, e) {
            return i(this.wmsParams, t), e || this.redraw(), this
        }
    });
    mn.WMS = fn, Jt.wms = function (t, i) {
        return new fn(t, i)
    };
    var gn = qe.extend({
        options: {padding: .1, tolerance: 0}, initialize: function (t) {
            l(this, t), n(this), this._layers = this._layers || {}
        }, onAdd: function () {
            this._container || (this._initContainer(), this._zoomAnimated && Q(this._container, "leaflet-zoom-animated")), this.getPane().appendChild(this._container), this._update(), this.on("update", this._updatePaths, this)
        }, onRemove: function () {
            this.off("update", this._updatePaths, this), this._destroyContainer()
        }, getEvents: function () {
            var t = {viewreset: this._reset, zoom: this._onZoom, moveend: this._update, zoomend: this._onZoomEnd};
            return this._zoomAnimated && (t.zoomanim = this._onAnimZoom), t
        }, _onAnimZoom: function (t) {
            this._updateTransform(t.center, t.zoom)
        }, _onZoom: function () {
            this._updateTransform(this._map.getCenter(), this._map.getZoom())
        }, _updateTransform: function (t, i) {
            var e = this._map.getZoomScale(i, this._zoom), n = ht(this._container),
                o = this._map.getSize().multiplyBy(.5 + this.options.padding), s = this._map.project(this._center, i),
                r = this._map.project(t, i).subtract(s), a = o.multiplyBy(-e).add(n).add(o).subtract(r);
            ji ? rt(this._container, a, e) : at(this._container, a)
        }, _reset: function () {
            this._update(), this._updateTransform(this._center, this._zoom);
            for (var t in this._layers) this._layers[t]._reset()
        }, _onZoomEnd: function () {
            for (var t in this._layers) this._layers[t]._project()
        }, _updatePaths: function () {
            for (var t in this._layers) this._layers[t]._update()
        }, _update: function () {
            var t = this.options.padding, i = this._map.getSize(),
                e = this._map.containerPointToLayerPoint(i.multiplyBy(-t)).round();
            this._bounds = new P(e, e.add(i.multiplyBy(1 + 2 * t)).round()), this._center = this._map.getCenter(), this._zoom = this._map.getZoom()
        }
    }), vn = gn.extend({
        getEvents: function () {
            var t = gn.prototype.getEvents.call(this);
            return t.viewprereset = this._onViewPreReset, t
        }, _onViewPreReset: function () {
            this._postponeUpdatePaths = !0
        }, onAdd: function () {
            gn.prototype.onAdd.call(this), this._draw()
        }, _initContainer: function () {
            var t = this._container = document.createElement("canvas");
            mt(t, "mousemove", o(this._onMouseMove, 32, this), this), mt(t, "click dblclick mousedown mouseup contextmenu", this._onClick, this), mt(t, "mouseout", this._handleMouseOut, this), this._ctx = t.getContext("2d")
        }, _destroyContainer: function () {
            g(this._redrawRequest), delete this._ctx, K(this._container), ft(this._container), delete this._container
        }, _updatePaths: function () {
            if (!this._postponeUpdatePaths) {
                this._redrawBounds = null;
                for (var t in this._layers) this._layers[t]._update();
                this._redraw()
            }
        }, _update: function () {
            if (!this._map._animatingZoom || !this._bounds) {
                this._drawnLayers = {}, gn.prototype._update.call(this);
                var t = this._bounds, i = this._container, e = t.getSize(), n = Yi ? 2 : 1;
                at(i, t.min), i.width = n * e.x, i.height = n * e.y, i.style.width = e.x + "px", i.style.height = e.y + "px", Yi && this._ctx.scale(2, 2), this._ctx.translate(-t.min.x, -t.min.y), this.fire("update")
            }
        }, _reset: function () {
            gn.prototype._reset.call(this), this._postponeUpdatePaths && (this._postponeUpdatePaths = !1, this._updatePaths())
        }, _initPath: function (t) {
            this._updateDashArray(t), this._layers[n(t)] = t;
            var i = t._order = {layer: t, prev: this._drawLast, next: null};
            this._drawLast && (this._drawLast.next = i), this._drawLast = i, this._drawFirst = this._drawFirst || this._drawLast
        }, _addPath: function (t) {
            this._requestRedraw(t)
        }, _removePath: function (t) {
            var i = t._order, e = i.next, o = i.prev;
            e ? e.prev = o : this._drawLast = o, o ? o.next = e : this._drawFirst = e, delete this._drawnLayers[t._leaflet_id], delete t._order, delete this._layers[n(t)], this._requestRedraw(t)
        }, _updatePath: function (t) {
            this._extendRedrawBounds(t), t._project(), t._update(), this._requestRedraw(t)
        }, _updateStyle: function (t) {
            this._updateDashArray(t), this._requestRedraw(t)
        }, _updateDashArray: function (t) {
            if ("string" == typeof t.options.dashArray) {
                var i, e = t.options.dashArray.split(/[, ]+/), n = [];
                for (i = 0; i < e.length; i++) n.push(Number(e[i]));
                t.options._dashArray = n
            } else t.options._dashArray = t.options.dashArray
        }, _requestRedraw: function (t) {
            this._map && (this._extendRedrawBounds(t), this._redrawRequest = this._redrawRequest || f(this._redraw, this))
        }, _extendRedrawBounds: function (t) {
            if (t._pxBounds) {
                var i = (t.options.weight || 0) + 1;
                this._redrawBounds = this._redrawBounds || new P, this._redrawBounds.extend(t._pxBounds.min.subtract([i, i])), this._redrawBounds.extend(t._pxBounds.max.add([i, i]))
            }
        }, _redraw: function () {
            this._redrawRequest = null, this._redrawBounds && (this._redrawBounds.min._floor(), this._redrawBounds.max._ceil()), this._clear(), this._draw(), this._redrawBounds = null
        }, _clear: function () {
            var t = this._redrawBounds;
            if (t) {
                var i = t.getSize();
                this._ctx.clearRect(t.min.x, t.min.y, i.x, i.y)
            } else this._ctx.clearRect(0, 0, this._container.width, this._container.height)
        }, _draw: function () {
            var t, i = this._redrawBounds;
            if (this._ctx.save(), i) {
                var e = i.getSize();
                this._ctx.beginPath(), this._ctx.rect(i.min.x, i.min.y, e.x, e.y), this._ctx.clip()
            }
            this._drawing = !0;
            for (var n = this._drawFirst; n; n = n.next) t = n.layer, (!i || t._pxBounds && t._pxBounds.intersects(i)) && t._updatePath();
            this._drawing = !1, this._ctx.restore()
        }, _updatePoly: function (t, i) {
            if (this._drawing) {
                var e, n, o, s, r = t._parts, a = r.length, h = this._ctx;
                if (a) {
                    for (this._drawnLayers[t._leaflet_id] = t, h.beginPath(), e = 0; e < a; e++) {
                        for (n = 0, o = r[e].length; n < o; n++) s = r[e][n], h[n ? "lineTo" : "moveTo"](s.x, s.y);
                        i && h.closePath()
                    }
                    this._fillStroke(h, t)
                }
            }
        }, _updateCircle: function (t) {
            if (this._drawing && !t._empty()) {
                var i = t._point, e = this._ctx, n = Math.max(Math.round(t._radius), 1),
                    o = (Math.max(Math.round(t._radiusY), 1) || n) / n;
                this._drawnLayers[t._leaflet_id] = t, 1 !== o && (e.save(), e.scale(1, o)), e.beginPath(), e.arc(i.x, i.y / o, n, 0, 2 * Math.PI, !1), 1 !== o && e.restore(), this._fillStroke(e, t)
            }
        }, _fillStroke: function (t, i) {
            var e = i.options;
            e.fill && (t.globalAlpha = e.fillOpacity, t.fillStyle = e.fillColor || e.color, t.fill(e.fillRule || "evenodd")), e.stroke && 0 !== e.weight && (t.setLineDash && t.setLineDash(i.options && i.options._dashArray || []), t.globalAlpha = e.opacity, t.lineWidth = e.weight, t.strokeStyle = e.color, t.lineCap = e.lineCap, t.lineJoin = e.lineJoin, t.stroke())
        }, _onClick: function (t) {
            for (var i, e, n = this._map.mouseEventToLayerPoint(t), o = this._drawFirst; o; o = o.next) (i = o.layer).options.interactive && i._containsPoint(n) && !this._map._draggableMoved(i) && (e = i);
            e && (zt(t), this._fireEvent([e], t))
        }, _onMouseMove: function (t) {
            if (this._map && !this._map.dragging.moving() && !this._map._animatingZoom) {
                var i = this._map.mouseEventToLayerPoint(t);
                this._handleMouseHover(t, i)
            }
        }, _handleMouseOut: function (t) {
            var i = this._hoveredLayer;
            i && (tt(this._container, "leaflet-interactive"), this._fireEvent([i], t, "mouseout"), this._hoveredLayer = null)
        }, _handleMouseHover: function (t, i) {
            for (var e, n, o = this._drawFirst; o; o = o.next) (e = o.layer).options.interactive && e._containsPoint(i) && (n = e);
            n !== this._hoveredLayer && (this._handleMouseOut(t), n && (Q(this._container, "leaflet-interactive"), this._fireEvent([n], t, "mouseover"), this._hoveredLayer = n)), this._hoveredLayer && this._fireEvent([this._hoveredLayer], t)
        }, _fireEvent: function (t, i, e) {
            this._map._fireDOMEvent(i, e || i.type, t)
        }, _bringToFront: function (t) {
            var i = t._order, e = i.next, n = i.prev;
            e && (e.prev = n, n ? n.next = e : e && (this._drawFirst = e), i.prev = this._drawLast, this._drawLast.next = i, i.next = null, this._drawLast = i, this._requestRedraw(t))
        }, _bringToBack: function (t) {
            var i = t._order, e = i.next, n = i.prev;
            n && (n.next = e, e ? e.prev = n : n && (this._drawLast = n), i.prev = null, i.next = this._drawFirst, this._drawFirst.prev = i, this._drawFirst = i, this._requestRedraw(t))
        }
    }), yn = function () {
        try {
            return document.namespaces.add("lvml", "urn:schemas-microsoft-com:vml"), function (t) {
                return document.createElement("<lvml:" + t + ' class="lvml">')
            }
        } catch (t) {
            return function (t) {
                return document.createElement("<" + t + ' xmlns="urn:schemas-microsoft.com:vml" class="lvml">')
            }
        }
    }(), xn = {
        _initContainer: function () {
            this._container = G("div", "leaflet-vml-container")
        }, _update: function () {
            this._map._animatingZoom || (gn.prototype._update.call(this), this.fire("update"))
        }, _initPath: function (t) {
            var i = t._container = yn("shape");
            Q(i, "leaflet-vml-shape " + (this.options.className || "")), i.coordsize = "1 1", t._path = yn("path"), i.appendChild(t._path), this._updateStyle(t), this._layers[n(t)] = t
        }, _addPath: function (t) {
            var i = t._container;
            this._container.appendChild(i), t.options.interactive && t.addInteractiveTarget(i)
        }, _removePath: function (t) {
            var i = t._container;
            K(i), t.removeInteractiveTarget(i), delete this._layers[n(t)]
        }, _updateStyle: function (t) {
            var i = t._stroke, e = t._fill, n = t.options, o = t._container;
            o.stroked = !!n.stroke, o.filled = !!n.fill, n.stroke ? (i || (i = t._stroke = yn("stroke")), o.appendChild(i), i.weight = n.weight + "px", i.color = n.color, i.opacity = n.opacity, n.dashArray ? i.dashStyle = oi(n.dashArray) ? n.dashArray.join(" ") : n.dashArray.replace(/( *, *)/g, " ") : i.dashStyle = "", i.endcap = n.lineCap.replace("butt", "flat"), i.joinstyle = n.lineJoin) : i && (o.removeChild(i), t._stroke = null), n.fill ? (e || (e = t._fill = yn("fill")), o.appendChild(e), e.color = n.fillColor || n.color, e.opacity = n.fillOpacity) : e && (o.removeChild(e), t._fill = null)
        }, _updateCircle: function (t) {
            var i = t._point.round(), e = Math.round(t._radius), n = Math.round(t._radiusY || e);
            this._setPath(t, t._empty() ? "M0 0" : "AL " + i.x + "," + i.y + " " + e + "," + n + " 0,23592600")
        }, _setPath: function (t, i) {
            t._path.v = i
        }, _bringToFront: function (t) {
            X(t._container)
        }, _bringToBack: function (t) {
            J(t._container)
        }
    }, wn = $i ? yn : E, Pn = gn.extend({
        getEvents: function () {
            var t = gn.prototype.getEvents.call(this);
            return t.zoomstart = this._onZoomStart, t
        }, _initContainer: function () {
            this._container = wn("svg"), this._container.setAttribute("pointer-events", "none"), this._rootGroup = wn("g"), this._container.appendChild(this._rootGroup)
        }, _destroyContainer: function () {
            K(this._container), ft(this._container), delete this._container, delete this._rootGroup, delete this._svgSize
        }, _onZoomStart: function () {
            this._update()
        }, _update: function () {
            if (!this._map._animatingZoom || !this._bounds) {
                gn.prototype._update.call(this);
                var t = this._bounds, i = t.getSize(), e = this._container;
                this._svgSize && this._svgSize.equals(i) || (this._svgSize = i, e.setAttribute("width", i.x), e.setAttribute("height", i.y)), at(e, t.min), e.setAttribute("viewBox", [t.min.x, t.min.y, i.x, i.y].join(" ")), this.fire("update")
            }
        }, _initPath: function (t) {
            var i = t._path = wn("path");
            t.options.className && Q(i, t.options.className), t.options.interactive && Q(i, "leaflet-interactive"), this._updateStyle(t), this._layers[n(t)] = t
        }, _addPath: function (t) {
            this._rootGroup || this._initContainer(), this._rootGroup.appendChild(t._path), t.addInteractiveTarget(t._path)
        }, _removePath: function (t) {
            K(t._path), t.removeInteractiveTarget(t._path), delete this._layers[n(t)]
        }, _updatePath: function (t) {
            t._project(), t._update()
        }, _updateStyle: function (t) {
            var i = t._path, e = t.options;
            i && (e.stroke ? (i.setAttribute("stroke", e.color), i.setAttribute("stroke-opacity", e.opacity), i.setAttribute("stroke-width", e.weight), i.setAttribute("stroke-linecap", e.lineCap), i.setAttribute("stroke-linejoin", e.lineJoin), e.dashArray ? i.setAttribute("stroke-dasharray", e.dashArray) : i.removeAttribute("stroke-dasharray"), e.dashOffset ? i.setAttribute("stroke-dashoffset", e.dashOffset) : i.removeAttribute("stroke-dashoffset")) : i.setAttribute("stroke", "none"), e.fill ? (i.setAttribute("fill", e.fillColor || e.color), i.setAttribute("fill-opacity", e.fillOpacity), i.setAttribute("fill-rule", e.fillRule || "evenodd")) : i.setAttribute("fill", "none"))
        }, _updatePoly: function (t, i) {
            this._setPath(t, k(t._parts, i))
        }, _updateCircle: function (t) {
            var i = t._point, e = Math.max(Math.round(t._radius), 1),
                n = "a" + e + "," + (Math.max(Math.round(t._radiusY), 1) || e) + " 0 1,0 ",
                o = t._empty() ? "M0 0" : "M" + (i.x - e) + "," + i.y + n + 2 * e + ",0 " + n + 2 * -e + ",0 ";
            this._setPath(t, o)
        }, _setPath: function (t, i) {
            t._path.setAttribute("d", i)
        }, _bringToFront: function (t) {
            X(t._path)
        }, _bringToBack: function (t) {
            J(t._path)
        }
    });
    $i && Pn.include(xn), be.include({
        getRenderer: function (t) {
            var i = t.options.renderer || this._getPaneRenderer(t.options.pane) || this.options.renderer || this._renderer;
            return i || (i = this._renderer = this._createRenderer()), this.hasLayer(i) || this.addLayer(i), i
        }, _getPaneRenderer: function (t) {
            if ("overlayPane" === t || void 0 === t) return !1;
            var i = this._paneRenderers[t];
            return void 0 === i && (i = this._createRenderer({pane: t}), this._paneRenderers[t] = i), i
        }, _createRenderer: function (t) {
            return this.options.preferCanvas && $t(t) || Qt(t)
        }
    });
    var Ln = on.extend({
        initialize: function (t, i) {
            on.prototype.initialize.call(this, this._boundsToLatLngs(t), i)
        }, setBounds: function (t) {
            return this.setLatLngs(this._boundsToLatLngs(t))
        }, _boundsToLatLngs: function (t) {
            return t = z(t), [t.getSouthWest(), t.getNorthWest(), t.getNorthEast(), t.getSouthEast()]
        }
    });
    Pn.create = wn, Pn.pointsToPath = k, sn.geometryToLayer = Ft, sn.coordsToLatLng = Ut, sn.coordsToLatLngs = Vt, sn.latLngToCoords = qt, sn.latLngsToCoords = Gt, sn.getFeature = Kt, sn.asFeature = Yt, be.mergeOptions({boxZoom: !0});
    var bn = Ee.extend({
        initialize: function (t) {
            this._map = t, this._container = t._container, this._pane = t._panes.overlayPane, this._resetStateTimeout = 0, t.on("unload", this._destroy, this)
        }, addHooks: function () {
            mt(this._container, "mousedown", this._onMouseDown, this)
        }, removeHooks: function () {
            ft(this._container, "mousedown", this._onMouseDown, this)
        }, moved: function () {
            return this._moved
        }, _destroy: function () {
            K(this._pane), delete this._pane
        }, _resetState: function () {
            this._resetStateTimeout = 0, this._moved = !1
        }, _clearDeferredResetState: function () {
            0 !== this._resetStateTimeout && (clearTimeout(this._resetStateTimeout), this._resetStateTimeout = 0)
        }, _onMouseDown: function (t) {
            if (!t.shiftKey || 1 !== t.which && 1 !== t.button) return !1;
            this._clearDeferredResetState(), this._resetState(), fi(), ut(), this._startPoint = this._map.mouseEventToContainerPoint(t), mt(document, {
                contextmenu: Lt,
                mousemove: this._onMouseMove,
                mouseup: this._onMouseUp,
                keydown: this._onKeyDown
            }, this)
        }, _onMouseMove: function (t) {
            this._moved || (this._moved = !0, this._box = G("div", "leaflet-zoom-box", this._container), Q(this._container, "leaflet-crosshair"), this._map.fire("boxzoomstart")), this._point = this._map.mouseEventToContainerPoint(t);
            var i = new P(this._point, this._startPoint), e = i.getSize();
            at(this._box, i.min), this._box.style.width = e.x + "px", this._box.style.height = e.y + "px"
        }, _finish: function () {
            this._moved && (K(this._box), tt(this._container, "leaflet-crosshair")), gi(), lt(), ft(document, {
                contextmenu: Lt,
                mousemove: this._onMouseMove,
                mouseup: this._onMouseUp,
                keydown: this._onKeyDown
            }, this)
        }, _onMouseUp: function (t) {
            if ((1 === t.which || 1 === t.button) && (this._finish(), this._moved)) {
                this._clearDeferredResetState(), this._resetStateTimeout = setTimeout(e(this._resetState, this), 0);
                var i = new T(this._map.containerPointToLatLng(this._startPoint), this._map.containerPointToLatLng(this._point));
                this._map.fitBounds(i).fire("boxzoomend", {boxZoomBounds: i})
            }
        }, _onKeyDown: function (t) {
            27 === t.keyCode && this._finish()
        }
    });
    be.addInitHook("addHandler", "boxZoom", bn), be.mergeOptions({doubleClickZoom: !0});
    var Tn = Ee.extend({
        addHooks: function () {
            this._map.on("dblclick", this._onDoubleClick, this)
        }, removeHooks: function () {
            this._map.off("dblclick", this._onDoubleClick, this)
        }, _onDoubleClick: function (t) {
            var i = this._map, e = i.getZoom(), n = i.options.zoomDelta, o = t.originalEvent.shiftKey ? e - n : e + n;
            "center" === i.options.doubleClickZoom ? i.setZoom(o) : i.setZoomAround(t.containerPoint, o)
        }
    });
    be.addInitHook("addHandler", "doubleClickZoom", Tn), be.mergeOptions({
        dragging: !0,
        inertia: !Mi,
        inertiaDeceleration: 3400,
        inertiaMaxSpeed: 1 / 0,
        easeLinearity: .2,
        worldCopyJump: !1,
        maxBoundsViscosity: 0
    });
    var zn = Ee.extend({
        addHooks: function () {
            if (!this._draggable) {
                var t = this._map;
                this._draggable = new Re(t._mapPane, t._container), this._draggable.on({
                    dragstart: this._onDragStart,
                    drag: this._onDrag,
                    dragend: this._onDragEnd
                }, this), this._draggable.on("predrag", this._onPreDragLimit, this), t.options.worldCopyJump && (this._draggable.on("predrag", this._onPreDragWrap, this), t.on("zoomend", this._onZoomEnd, this), t.whenReady(this._onZoomEnd, this))
            }
            Q(this._map._container, "leaflet-grab leaflet-touch-drag"), this._draggable.enable(), this._positions = [], this._times = []
        }, removeHooks: function () {
            tt(this._map._container, "leaflet-grab"), tt(this._map._container, "leaflet-touch-drag"), this._draggable.disable()
        }, moved: function () {
            return this._draggable && this._draggable._moved
        }, moving: function () {
            return this._draggable && this._draggable._moving
        }, _onDragStart: function () {
            var t = this._map;
            if (t._stop(), this._map.options.maxBounds && this._map.options.maxBoundsViscosity) {
                var i = z(this._map.options.maxBounds);
                this._offsetLimit = b(this._map.latLngToContainerPoint(i.getNorthWest()).multiplyBy(-1), this._map.latLngToContainerPoint(i.getSouthEast()).multiplyBy(-1).add(this._map.getSize())), this._viscosity = Math.min(1, Math.max(0, this._map.options.maxBoundsViscosity))
            } else this._offsetLimit = null;
            t.fire("movestart").fire("dragstart"), t.options.inertia && (this._positions = [], this._times = [])
        }, _onDrag: function (t) {
            if (this._map.options.inertia) {
                var i = this._lastTime = +new Date,
                    e = this._lastPos = this._draggable._absPos || this._draggable._newPos;
                this._positions.push(e), this._times.push(i), this._prunePositions(i)
            }
            this._map.fire("move", t).fire("drag", t)
        }, _prunePositions: function (t) {
            for (; this._positions.length > 1 && t - this._times[0] > 50;) this._positions.shift(), this._times.shift()
        }, _onZoomEnd: function () {
            var t = this._map.getSize().divideBy(2), i = this._map.latLngToLayerPoint([0, 0]);
            this._initialWorldOffset = i.subtract(t).x, this._worldWidth = this._map.getPixelWorldBounds().getSize().x
        }, _viscousLimit: function (t, i) {
            return t - (t - i) * this._viscosity
        }, _onPreDragLimit: function () {
            if (this._viscosity && this._offsetLimit) {
                var t = this._draggable._newPos.subtract(this._draggable._startPos), i = this._offsetLimit;
                t.x < i.min.x && (t.x = this._viscousLimit(t.x, i.min.x)), t.y < i.min.y && (t.y = this._viscousLimit(t.y, i.min.y)), t.x > i.max.x && (t.x = this._viscousLimit(t.x, i.max.x)), t.y > i.max.y && (t.y = this._viscousLimit(t.y, i.max.y)), this._draggable._newPos = this._draggable._startPos.add(t)
            }
        }, _onPreDragWrap: function () {
            var t = this._worldWidth, i = Math.round(t / 2), e = this._initialWorldOffset,
                n = this._draggable._newPos.x, o = (n - i + e) % t + i - e, s = (n + i + e) % t - i - e,
                r = Math.abs(o + e) < Math.abs(s + e) ? o : s;
            this._draggable._absPos = this._draggable._newPos.clone(), this._draggable._newPos.x = r
        }, _onDragEnd: function (t) {
            var i = this._map, e = i.options, n = !e.inertia || this._times.length < 2;
            if (i.fire("dragend", t), n) i.fire("moveend"); else {
                this._prunePositions(+new Date);
                var o = this._lastPos.subtract(this._positions[0]), s = (this._lastTime - this._times[0]) / 1e3,
                    r = e.easeLinearity, a = o.multiplyBy(r / s), h = a.distanceTo([0, 0]),
                    u = Math.min(e.inertiaMaxSpeed, h), l = a.multiplyBy(u / h), c = u / (e.inertiaDeceleration * r),
                    _ = l.multiplyBy(-c / 2).round();
                _.x || _.y ? (_ = i._limitOffset(_, i.options.maxBounds), f(function () {
                    i.panBy(_, {duration: c, easeLinearity: r, noMoveStart: !0, animate: !0})
                })) : i.fire("moveend")
            }
        }
    });
    be.addInitHook("addHandler", "dragging", zn), be.mergeOptions({keyboard: !0, keyboardPanDelta: 80});
    var Mn = Ee.extend({
        keyCodes: {
            left: [37],
            right: [39],
            down: [40],
            up: [38],
            zoomIn: [187, 107, 61, 171],
            zoomOut: [189, 109, 54, 173]
        }, initialize: function (t) {
            this._map = t, this._setPanDelta(t.options.keyboardPanDelta), this._setZoomDelta(t.options.zoomDelta)
        }, addHooks: function () {
            var t = this._map._container;
            t.tabIndex <= 0 && (t.tabIndex = "0"), mt(t, {
                focus: this._onFocus,
                blur: this._onBlur,
                mousedown: this._onMouseDown
            }, this), this._map.on({focus: this._addHooks, blur: this._removeHooks}, this)
        }, removeHooks: function () {
            this._removeHooks(), ft(this._map._container, {
                focus: this._onFocus,
                blur: this._onBlur,
                mousedown: this._onMouseDown
            }, this), this._map.off({focus: this._addHooks, blur: this._removeHooks}, this)
        }, _onMouseDown: function () {
            if (!this._focused) {
                var t = document.body, i = document.documentElement, e = t.scrollTop || i.scrollTop,
                    n = t.scrollLeft || i.scrollLeft;
                this._map._container.focus(), window.scrollTo(n, e)
            }
        }, _onFocus: function () {
            this._focused = !0, this._map.fire("focus")
        }, _onBlur: function () {
            this._focused = !1, this._map.fire("blur")
        }, _setPanDelta: function (t) {
            var i, e, n = this._panKeys = {}, o = this.keyCodes;
            for (i = 0, e = o.left.length; i < e; i++) n[o.left[i]] = [-1 * t, 0];
            for (i = 0, e = o.right.length; i < e; i++) n[o.right[i]] = [t, 0];
            for (i = 0, e = o.down.length; i < e; i++) n[o.down[i]] = [0, t];
            for (i = 0, e = o.up.length; i < e; i++) n[o.up[i]] = [0, -1 * t]
        }, _setZoomDelta: function (t) {
            var i, e, n = this._zoomKeys = {}, o = this.keyCodes;
            for (i = 0, e = o.zoomIn.length; i < e; i++) n[o.zoomIn[i]] = t;
            for (i = 0, e = o.zoomOut.length; i < e; i++) n[o.zoomOut[i]] = -t
        }, _addHooks: function () {
            mt(document, "keydown", this._onKeyDown, this)
        }, _removeHooks: function () {
            ft(document, "keydown", this._onKeyDown, this)
        }, _onKeyDown: function (t) {
            if (!(t.altKey || t.ctrlKey || t.metaKey)) {
                var i, e = t.keyCode, n = this._map;
                if (e in this._panKeys) n._panAnim && n._panAnim._inProgress || (i = this._panKeys[e], t.shiftKey && (i = w(i).multiplyBy(3)), n.panBy(i), n.options.maxBounds && n.panInsideBounds(n.options.maxBounds)); else if (e in this._zoomKeys) n.setZoom(n.getZoom() + (t.shiftKey ? 3 : 1) * this._zoomKeys[e]); else {
                    if (27 !== e || !n._popup || !n._popup.options.closeOnEscapeKey) return;
                    n.closePopup()
                }
                Lt(t)
            }
        }
    });
    be.addInitHook("addHandler", "keyboard", Mn), be.mergeOptions({
        scrollWheelZoom: !0,
        wheelDebounceTime: 40,
        wheelPxPerZoomLevel: 60
    });
    var Cn = Ee.extend({
        addHooks: function () {
            mt(this._map._container, "mousewheel", this._onWheelScroll, this), this._delta = 0
        }, removeHooks: function () {
            ft(this._map._container, "mousewheel", this._onWheelScroll, this)
        }, _onWheelScroll: function (t) {
            var i = Tt(t), n = this._map.options.wheelDebounceTime;
            this._delta += i, this._lastMousePos = this._map.mouseEventToContainerPoint(t), this._startTime || (this._startTime = +new Date);
            var o = Math.max(n - (+new Date - this._startTime), 0);
            clearTimeout(this._timer), this._timer = setTimeout(e(this._performZoom, this), o), Lt(t)
        }, _performZoom: function () {
            var t = this._map, i = t.getZoom(), e = this._map.options.zoomSnap || 0;
            t._stop();
            var n = this._delta / (4 * this._map.options.wheelPxPerZoomLevel),
                o = 4 * Math.log(2 / (1 + Math.exp(-Math.abs(n)))) / Math.LN2, s = e ? Math.ceil(o / e) * e : o,
                r = t._limitZoom(i + (this._delta > 0 ? s : -s)) - i;
            this._delta = 0, this._startTime = null, r && ("center" === t.options.scrollWheelZoom ? t.setZoom(i + r) : t.setZoomAround(this._lastMousePos, i + r))
        }
    });
    be.addInitHook("addHandler", "scrollWheelZoom", Cn), be.mergeOptions({tap: !0, tapTolerance: 15});
    var Sn = Ee.extend({
        addHooks: function () {
            mt(this._map._container, "touchstart", this._onDown, this)
        }, removeHooks: function () {
            ft(this._map._container, "touchstart", this._onDown, this)
        }, _onDown: function (t) {
            if (t.touches) {
                if (Pt(t), this._fireClick = !0, t.touches.length > 1) return this._fireClick = !1, void clearTimeout(this._holdTimeout);
                var i = t.touches[0], n = i.target;
                this._startPos = this._newPos = new x(i.clientX, i.clientY), n.tagName && "a" === n.tagName.toLowerCase() && Q(n, "leaflet-active"), this._holdTimeout = setTimeout(e(function () {
                    this._isTapValid() && (this._fireClick = !1, this._onUp(), this._simulateEvent("contextmenu", i))
                }, this), 1e3), this._simulateEvent("mousedown", i), mt(document, {
                    touchmove: this._onMove,
                    touchend: this._onUp
                }, this)
            }
        }, _onUp: function (t) {
            if (clearTimeout(this._holdTimeout), ft(document, {
                touchmove: this._onMove,
                touchend: this._onUp
            }, this), this._fireClick && t && t.changedTouches) {
                var i = t.changedTouches[0], e = i.target;
                e && e.tagName && "a" === e.tagName.toLowerCase() && tt(e, "leaflet-active"), this._simulateEvent("mouseup", i), this._isTapValid() && this._simulateEvent("click", i)
            }
        }, _isTapValid: function () {
            return this._newPos.distanceTo(this._startPos) <= this._map.options.tapTolerance
        }, _onMove: function (t) {
            var i = t.touches[0];
            this._newPos = new x(i.clientX, i.clientY), this._simulateEvent("mousemove", i)
        }, _simulateEvent: function (t, i) {
            var e = document.createEvent("MouseEvents");
            e._simulated = !0, i.target._simulatedClick = !0, e.initMouseEvent(t, !0, !0, window, 1, i.screenX, i.screenY, i.clientX, i.clientY, !1, !1, !1, !1, 0, null), i.target.dispatchEvent(e)
        }
    });
    qi && !Vi && be.addInitHook("addHandler", "tap", Sn), be.mergeOptions({
        touchZoom: qi && !Mi,
        bounceAtZoomLimits: !0
    });
    var Zn = Ee.extend({
        addHooks: function () {
            Q(this._map._container, "leaflet-touch-zoom"), mt(this._map._container, "touchstart", this._onTouchStart, this)
        }, removeHooks: function () {
            tt(this._map._container, "leaflet-touch-zoom"), ft(this._map._container, "touchstart", this._onTouchStart, this)
        }, _onTouchStart: function (t) {
            var i = this._map;
            if (t.touches && 2 === t.touches.length && !i._animatingZoom && !this._zooming) {
                var e = i.mouseEventToContainerPoint(t.touches[0]), n = i.mouseEventToContainerPoint(t.touches[1]);
                this._centerPoint = i.getSize()._divideBy(2), this._startLatLng = i.containerPointToLatLng(this._centerPoint), "center" !== i.options.touchZoom && (this._pinchStartLatLng = i.containerPointToLatLng(e.add(n)._divideBy(2))), this._startDist = e.distanceTo(n), this._startZoom = i.getZoom(), this._moved = !1, this._zooming = !0, i._stop(), mt(document, "touchmove", this._onTouchMove, this), mt(document, "touchend", this._onTouchEnd, this), Pt(t)
            }
        }, _onTouchMove: function (t) {
            if (t.touches && 2 === t.touches.length && this._zooming) {
                var i = this._map, n = i.mouseEventToContainerPoint(t.touches[0]),
                    o = i.mouseEventToContainerPoint(t.touches[1]), s = n.distanceTo(o) / this._startDist;
                if (this._zoom = i.getScaleZoom(s, this._startZoom), !i.options.bounceAtZoomLimits && (this._zoom < i.getMinZoom() && s < 1 || this._zoom > i.getMaxZoom() && s > 1) && (this._zoom = i._limitZoom(this._zoom)), "center" === i.options.touchZoom) {
                    if (this._center = this._startLatLng, 1 === s) return
                } else {
                    var r = n._add(o)._divideBy(2)._subtract(this._centerPoint);
                    if (1 === s && 0 === r.x && 0 === r.y) return;
                    this._center = i.unproject(i.project(this._pinchStartLatLng, this._zoom).subtract(r), this._zoom)
                }
                this._moved || (i._moveStart(!0, !1), this._moved = !0), g(this._animRequest);
                var a = e(i._move, i, this._center, this._zoom, {pinch: !0, round: !1});
                this._animRequest = f(a, this, !0), Pt(t)
            }
        }, _onTouchEnd: function () {
            this._moved && this._zooming ? (this._zooming = !1, g(this._animRequest), ft(document, "touchmove", this._onTouchMove), ft(document, "touchend", this._onTouchEnd), this._map.options.zoomAnimation ? this._map._animateZoom(this._center, this._map._limitZoom(this._zoom), !0, this._map.options.zoomSnap) : this._map._resetView(this._center, this._map._limitZoom(this._zoom))) : this._zooming = !1
        }
    });
    be.addInitHook("addHandler", "touchZoom", Zn), be.BoxZoom = bn, be.DoubleClickZoom = Tn, be.Drag = zn, be.Keyboard = Mn, be.ScrollWheelZoom = Cn, be.Tap = Sn, be.TouchZoom = Zn, Object.freeze = ti, t.version = "1.3.4+HEAD.0e566b2", t.Control = Te, t.control = ze, t.Browser = Qi, t.Evented = ci, t.Mixin = Ae, t.Util = ui, t.Class = v, t.Handler = Ee, t.extend = i, t.bind = e, t.stamp = n, t.setOptions = l, t.DomEvent = Pe, t.DomUtil = ve, t.PosAnimation = Le, t.Draggable = Re, t.LineUtil = Ne, t.PolyUtil = De, t.Point = x, t.point = w, t.Bounds = P, t.bounds = b, t.Transformation = S, t.transformation = Z, t.Projection = He, t.LatLng = M, t.latLng = C, t.LatLngBounds = T, t.latLngBounds = z, t.CRS = di, t.GeoJSON = sn, t.geoJSON = Xt, t.geoJson = an, t.Layer = qe, t.LayerGroup = Ge, t.layerGroup = function (t, i) {
        return new Ge(t, i)
    }, t.FeatureGroup = Ke, t.featureGroup = function (t) {
        return new Ke(t)
    }, t.ImageOverlay = hn, t.imageOverlay = function (t, i, e) {
        return new hn(t, i, e)
    }, t.VideoOverlay = un, t.videoOverlay = function (t, i, e) {
        return new un(t, i, e)
    }, t.DivOverlay = ln, t.Popup = cn, t.popup = function (t, i) {
        return new cn(t, i)
    }, t.Tooltip = _n, t.tooltip = function (t, i) {
        return new _n(t, i)
    }, t.Icon = Ye, t.icon = function (t) {
        return new Ye(t)
    }, t.DivIcon = dn, t.divIcon = function (t) {
        return new dn(t)
    }, t.Marker = $e, t.marker = function (t, i) {
        return new $e(t, i)
    }, t.TileLayer = mn, t.tileLayer = Jt, t.GridLayer = pn, t.gridLayer = function (t) {
        return new pn(t)
    }, t.SVG = Pn, t.svg = Qt, t.Renderer = gn, t.Canvas = vn, t.canvas = $t, t.Path = Qe, t.CircleMarker = tn, t.circleMarker = function (t, i) {
        return new tn(t, i)
    }, t.Circle = en, t.circle = function (t, i, e) {
        return new en(t, i, e)
    }, t.Polyline = nn, t.polyline = function (t, i) {
        return new nn(t, i)
    }, t.Polygon = on, t.polygon = function (t, i) {
        return new on(t, i)
    }, t.Rectangle = Ln, t.rectangle = function (t, i) {
        return new Ln(t, i)
    }, t.Map = be, t.map = function (t, i) {
        return new be(t, i)
    };
    var En = window.L;
    t.noConflict = function () {
        return window.L = En, this
    }, window.L = t
});
// End leaflet map

/*! Magnific Popup - v1.1.0 - 2016-02-20
* http://dimsemenov.com/plugins/magnific-popup/
* Copyright (c) 2016 Dmitry Semenov; */
!function (a) {
    "function" == typeof define && define.amd ? define(["jquery"], a) : a("object" == typeof exports ? require("jquery") : window.jQuery || window.Zepto)
}(function (a) {
    var b, c, d, e, f, g, h = "Close", i = "BeforeClose", j = "AfterClose", k = "BeforeAppend", l = "MarkupParse",
        m = "Open", n = "Change", o = "mfp", p = "." + o, q = "mfp-ready", r = "mfp-removing", s = "mfp-prevent-close",
        t = function () {
        }, u = !!window.jQuery, v = a(window), w = function (a, c) {
            b.ev.on(o + a + p, c)
        }, x = function (b, c, d, e) {
            var f = document.createElement("div");
            return f.className = "mfp-" + b, d && (f.innerHTML = d), e ? c && c.appendChild(f) : (f = a(f), c && f.appendTo(c)), f
        }, y = function (c, d) {
            b.ev.triggerHandler(o + c, d), b.st.callbacks && (c = c.charAt(0).toLowerCase() + c.slice(1), b.st.callbacks[c] && b.st.callbacks[c].apply(b, a.isArray(d) ? d : [d]))
        }, z = function (c) {
            return c === g && b.currTemplate.closeBtn || (b.currTemplate.closeBtn = a(b.st.closeMarkup.replace("%title%", b.st.tClose)), g = c), b.currTemplate.closeBtn
        }, A = function () {
            a.magnificPopup.instance || (b = new t, b.init(), a.magnificPopup.instance = b)
        }, B = function () {
            var a = document.createElement("p").style, b = ["ms", "O", "Moz", "Webkit"];
            if (void 0 !== a.transition) return !0;
            for (; b.length;) if (b.pop() + "Transition" in a) return !0;
            return !1
        };
    t.prototype = {
        constructor: t, init: function () {
            var c = navigator.appVersion;
            b.isLowIE = b.isIE8 = document.all && !document.addEventListener, b.isAndroid = /android/gi.test(c), b.isIOS = /iphone|ipad|ipod/gi.test(c), b.supportsTransition = B(), b.probablyMobile = b.isAndroid || b.isIOS || /(Opera Mini)|Kindle|webOS|BlackBerry|(Opera Mobi)|(Windows Phone)|IEMobile/i.test(navigator.userAgent), d = a(document), b.popupsCache = {}
        }, open: function (c) {
            var e;
            if (c.isObj === !1) {
                b.items = c.items.toArray(), b.index = 0;
                var g, h = c.items;
                for (e = 0; e < h.length; e++) if (g = h[e], g.parsed && (g = g.el[0]), g === c.el[0]) {
                    b.index = e;
                    break
                }
            } else b.items = a.isArray(c.items) ? c.items : [c.items], b.index = c.index || 0;
            if (b.isOpen) return void b.updateItemHTML();
            b.types = [], f = "", c.mainEl && c.mainEl.length ? b.ev = c.mainEl.eq(0) : b.ev = d, c.key ? (b.popupsCache[c.key] || (b.popupsCache[c.key] = {}), b.currTemplate = b.popupsCache[c.key]) : b.currTemplate = {}, b.st = a.extend(!0, {}, a.magnificPopup.defaults, c), b.fixedContentPos = "auto" === b.st.fixedContentPos ? !b.probablyMobile : b.st.fixedContentPos, b.st.modal && (b.st.closeOnContentClick = !1, b.st.closeOnBgClick = !1, b.st.showCloseBtn = !1, b.st.enableEscapeKey = !1), b.bgOverlay || (b.bgOverlay = x("bg").on("click" + p, function () {
                b.close()
            }), b.wrap = x("wrap").attr("tabindex", -1).on("click" + p, function (a) {
                b._checkIfClose(a.target) && b.close()
            }), b.container = x("container", b.wrap)), b.contentContainer = x("content"), b.st.preloader && (b.preloader = x("preloader", b.container, b.st.tLoading));
            var i = a.magnificPopup.modules;
            for (e = 0; e < i.length; e++) {
                var j = i[e];
                j = j.charAt(0).toUpperCase() + j.slice(1), b["init" + j].call(b)
            }
            y("BeforeOpen"), b.st.showCloseBtn && (b.st.closeBtnInside ? (w(l, function (a, b, c, d) {
                c.close_replaceWith = z(d.type)
            }), f += " mfp-close-btn-in") : b.wrap.append(z())), b.st.alignTop && (f += " mfp-align-top"), b.fixedContentPos ? b.wrap.css({
                overflow: b.st.overflowY,
                overflowX: "hidden",
                overflowY: b.st.overflowY
            }) : b.wrap.css({
                top: v.scrollTop(),
                position: "absolute"
            }), (b.st.fixedBgPos === !1 || "auto" === b.st.fixedBgPos && !b.fixedContentPos) && b.bgOverlay.css({
                height: d.height(),
                position: "absolute"
            }), b.st.enableEscapeKey && d.on("keyup" + p, function (a) {
                27 === a.keyCode && b.close()
            }), v.on("resize" + p, function () {
                b.updateSize()
            }), b.st.closeOnContentClick || (f += " mfp-auto-cursor"), f && b.wrap.addClass(f);
            var k = b.wH = v.height(), n = {};
            if (b.fixedContentPos && b._hasScrollBar(k)) {
                var o = b._getScrollbarSize();
                o && (n.marginRight = o)
            }
            b.fixedContentPos && (b.isIE7 ? a("body, html").css("overflow", "hidden") : n.overflow = "hidden");
            var r = b.st.mainClass;
            return b.isIE7 && (r += " mfp-ie7"), r && b._addClassToMFP(r), b.updateItemHTML(), y("BuildControls"), a("html").css(n), b.bgOverlay.add(b.wrap).prependTo(b.st.prependTo || a(document.body)), b._lastFocusedEl = document.activeElement, setTimeout(function () {
                b.content ? (b._addClassToMFP(q), b._setFocus()) : b.bgOverlay.addClass(q), d.on("focusin" + p, b._onFocusIn)
            }, 16), b.isOpen = !0, b.updateSize(k), y(m), c
        }, close: function () {
            b.isOpen && (y(i), b.isOpen = !1, b.st.removalDelay && !b.isLowIE && b.supportsTransition ? (b._addClassToMFP(r), setTimeout(function () {
                b._close()
            }, b.st.removalDelay)) : b._close())
        }, _close: function () {
            y(h);
            var c = r + " " + q + " ";
            if (b.bgOverlay.detach(), b.wrap.detach(), b.container.empty(), b.st.mainClass && (c += b.st.mainClass + " "), b._removeClassFromMFP(c), b.fixedContentPos) {
                var e = {marginRight: ""};
                b.isIE7 ? a("body, html").css("overflow", "") : e.overflow = "", a("html").css(e)
            }
            d.off("keyup" + p + " focusin" + p), b.ev.off(p), b.wrap.attr("class", "mfp-wrap").removeAttr("style"), b.bgOverlay.attr("class", "mfp-bg"), b.container.attr("class", "mfp-container"), !b.st.showCloseBtn || b.st.closeBtnInside && b.currTemplate[b.currItem.type] !== !0 || b.currTemplate.closeBtn && b.currTemplate.closeBtn.detach(), b.st.autoFocusLast && b._lastFocusedEl && a(b._lastFocusedEl).focus(), b.currItem = null, b.content = null, b.currTemplate = null, b.prevHeight = 0, y(j)
        }, updateSize: function (a) {
            if (b.isIOS) {
                var c = document.documentElement.clientWidth / window.innerWidth, d = window.innerHeight * c;
                b.wrap.css("height", d), b.wH = d
            } else b.wH = a || v.height();
            b.fixedContentPos || b.wrap.css("height", b.wH), y("Resize")
        }, updateItemHTML: function () {
            var c = b.items[b.index];
            b.contentContainer.detach(), b.content && b.content.detach(), c.parsed || (c = b.parseEl(b.index));
            var d = c.type;
            if (y("BeforeChange", [b.currItem ? b.currItem.type : "", d]), b.currItem = c, !b.currTemplate[d]) {
                var f = b.st[d] ? b.st[d].markup : !1;
                y("FirstMarkupParse", f), f ? b.currTemplate[d] = a(f) : b.currTemplate[d] = !0
            }
            e && e !== c.type && b.container.removeClass("mfp-" + e + "-holder");
            var g = b["get" + d.charAt(0).toUpperCase() + d.slice(1)](c, b.currTemplate[d]);
            b.appendContent(g, d), c.preloaded = !0, y(n, c), e = c.type, b.container.prepend(b.contentContainer), y("AfterChange")
        }, appendContent: function (a, c) {
            b.content = a, a ? b.st.showCloseBtn && b.st.closeBtnInside && b.currTemplate[c] === !0 ? b.content.find(".mfp-close").length || b.content.append(z()) : b.content = a : b.content = "", y(k), b.container.addClass("mfp-" + c + "-holder"), b.contentContainer.append(b.content)
        }, parseEl: function (c) {
            var d, e = b.items[c];
            if (e.tagName ? e = {el: a(e)} : (d = e.type, e = {data: e, src: e.src}), e.el) {
                for (var f = b.types, g = 0; g < f.length; g++) if (e.el.hasClass("mfp-" + f[g])) {
                    d = f[g];
                    break
                }
                e.src = e.el.attr("data-mfp-src"), e.src || (e.src = e.el.attr("href"))
            }
            return e.type = d || b.st.type || "inline", e.index = c, e.parsed = !0, b.items[c] = e, y("ElementParse", e), b.items[c]
        }, addGroup: function (a, c) {
            var d = function (d) {
                d.mfpEl = this, b._openClick(d, a, c)
            };
            c || (c = {});
            var e = "click.magnificPopup";
            c.mainEl = a, c.items ? (c.isObj = !0, a.off(e).on(e, d)) : (c.isObj = !1, c.delegate ? a.off(e).on(e, c.delegate, d) : (c.items = a, a.off(e).on(e, d)))
        }, _openClick: function (c, d, e) {
            var f = void 0 !== e.midClick ? e.midClick : a.magnificPopup.defaults.midClick;
            if (f || !(2 === c.which || c.ctrlKey || c.metaKey || c.altKey || c.shiftKey)) {
                var g = void 0 !== e.disableOn ? e.disableOn : a.magnificPopup.defaults.disableOn;
                if (g) if (a.isFunction(g)) {
                    if (!g.call(b)) return !0
                } else if (v.width() < g) return !0;
                c.type && (c.preventDefault(), b.isOpen && c.stopPropagation()), e.el = a(c.mfpEl), e.delegate && (e.items = d.find(e.delegate)), b.open(e)
            }
        }, updateStatus: function (a, d) {
            if (b.preloader) {
                c !== a && b.container.removeClass("mfp-s-" + c), d || "loading" !== a || (d = b.st.tLoading);
                var e = {status: a, text: d};
                y("UpdateStatus", e), a = e.status, d = e.text, b.preloader.html(d), b.preloader.find("a").on("click", function (a) {
                    a.stopImmediatePropagation()
                }), b.container.addClass("mfp-s-" + a), c = a
            }
        }, _checkIfClose: function (c) {
            if (!a(c).hasClass(s)) {
                var d = b.st.closeOnContentClick, e = b.st.closeOnBgClick;
                if (d && e) return !0;
                if (!b.content || a(c).hasClass("mfp-close") || b.preloader && c === b.preloader[0]) return !0;
                if (c === b.content[0] || a.contains(b.content[0], c)) {
                    if (d) return !0
                } else if (e && a.contains(document, c)) return !0;
                return !1
            }
        }, _addClassToMFP: function (a) {
            b.bgOverlay.addClass(a), b.wrap.addClass(a)
        }, _removeClassFromMFP: function (a) {
            this.bgOverlay.removeClass(a), b.wrap.removeClass(a)
        }, _hasScrollBar: function (a) {
            return (b.isIE7 ? d.height() : document.body.scrollHeight) > (a || v.height())
        }, _setFocus: function () {
            (b.st.focus ? b.content.find(b.st.focus).eq(0) : b.wrap).focus()
        }, _onFocusIn: function (c) {
            return c.target === b.wrap[0] || a.contains(b.wrap[0], c.target) ? void 0 : (b._setFocus(), !1)
        }, _parseMarkup: function (b, c, d) {
            var e;
            d.data && (c = a.extend(d.data, c)), y(l, [b, c, d]), a.each(c, function (c, d) {
                if (void 0 === d || d === !1) return !0;
                if (e = c.split("_"), e.length > 1) {
                    var f = b.find(p + "-" + e[0]);
                    if (f.length > 0) {
                        var g = e[1];
                        "replaceWith" === g ? f[0] !== d[0] && f.replaceWith(d) : "img" === g ? f.is("img") ? f.attr("src", d) : f.replaceWith(a("<img>").attr("src", d).attr("class", f.attr("class"))) : f.attr(e[1], d)
                    }
                } else b.find(p + "-" + c).html(d)
            })
        }, _getScrollbarSize: function () {
            if (void 0 === b.scrollbarSize) {
                var a = document.createElement("div");
                a.style.cssText = "width: 99px; height: 99px; overflow: scroll; position: absolute; top: -9999px;", document.body.appendChild(a), b.scrollbarSize = a.offsetWidth - a.clientWidth, document.body.removeChild(a)
            }
            return b.scrollbarSize
        }
    }, a.magnificPopup = {
        instance: null,
        proto: t.prototype,
        modules: [],
        open: function (b, c) {
            return A(), b = b ? a.extend(!0, {}, b) : {}, b.isObj = !0, b.index = c || 0, this.instance.open(b)
        },
        close: function () {
            return a.magnificPopup.instance && a.magnificPopup.instance.close()
        },
        registerModule: function (b, c) {
            c.options && (a.magnificPopup.defaults[b] = c.options), a.extend(this.proto, c.proto), this.modules.push(b)
        },
        defaults: {
            disableOn: 0,
            key: null,
            midClick: !1,
            mainClass: "",
            preloader: !0,
            focus: "",
            closeOnContentClick: !1,
            closeOnBgClick: !0,
            closeBtnInside: !0,
            showCloseBtn: !0,
            enableEscapeKey: !0,
            modal: !1,
            alignTop: !1,
            removalDelay: 0,
            prependTo: null,
            fixedContentPos: "auto",
            fixedBgPos: "auto",
            overflowY: "auto",
            closeMarkup: '<button title="%title%" type="button" class="mfp-close">&#215;</button>',
            tClose: "Close (Esc)",
            tLoading: "Loading...",
            autoFocusLast: !0
        }
    }, a.fn.magnificPopup = function (c) {
        A();
        var d = a(this);
        if ("string" == typeof c) if ("open" === c) {
            var e, f = u ? d.data("magnificPopup") : d[0].magnificPopup, g = parseInt(arguments[1], 10) || 0;
            f.items ? e = f.items[g] : (e = d, f.delegate && (e = e.find(f.delegate)), e = e.eq(g)), b._openClick({mfpEl: e}, d, f)
        } else b.isOpen && b[c].apply(b, Array.prototype.slice.call(arguments, 1)); else c = a.extend(!0, {}, c), u ? d.data("magnificPopup", c) : d[0].magnificPopup = c, b.addGroup(d, c);
        return d
    };
    var C, D, E, F = "inline", G = function () {
        E && (D.after(E.addClass(C)).detach(), E = null)
    };
    a.magnificPopup.registerModule(F, {
        options: {hiddenClass: "hide", markup: "", tNotFound: "Content not found"},
        proto: {
            initInline: function () {
                b.types.push(F), w(h + "." + F, function () {
                    G()
                })
            }, getInline: function (c, d) {
                if (G(), c.src) {
                    var e = b.st.inline, f = a(c.src);
                    if (f.length) {
                        var g = f[0].parentNode;
                        g && g.tagName && (D || (C = e.hiddenClass, D = x(C), C = "mfp-" + C), E = f.after(D).detach().removeClass(C)), b.updateStatus("ready")
                    } else b.updateStatus("error", e.tNotFound), f = a("<div>");
                    return c.inlineElement = f, f
                }
                return b.updateStatus("ready"), b._parseMarkup(d, {}, c), d
            }
        }
    });
    var H, I = "ajax", J = function () {
        H && a(document.body).removeClass(H)
    }, K = function () {
        J(), b.req && b.req.abort()
    };
    a.magnificPopup.registerModule(I, {
        options: {
            settings: null,
            cursor: "mfp-ajax-cur",
            tError: '<a href="%url%">The content</a> could not be loaded.'
        }, proto: {
            initAjax: function () {
                b.types.push(I), H = b.st.ajax.cursor, w(h + "." + I, K), w("BeforeChange." + I, K)
            }, getAjax: function (c) {
                H && a(document.body).addClass(H), b.updateStatus("loading");
                var d = a.extend({
                    url: c.src, success: function (d, e, f) {
                        var g = {data: d, xhr: f};
                        y("ParseAjax", g), b.appendContent(a(g.data), I), c.finished = !0, J(), b._setFocus(), setTimeout(function () {
                            b.wrap.addClass(q)
                        }, 16), b.updateStatus("ready"), y("AjaxContentAdded")
                    }, error: function () {
                        J(), c.finished = c.loadError = !0, b.updateStatus("error", b.st.ajax.tError.replace("%url%", c.src))
                    }
                }, b.st.ajax.settings);
                return b.req = a.ajax(d), ""
            }
        }
    });
    var L, M = function (c) {
        if (c.data && void 0 !== c.data.title) return c.data.title;
        var d = b.st.image.titleSrc;
        if (d) {
            if (a.isFunction(d)) return d.call(b, c);
            if (c.el) return c.el.attr(d) || ""
        }
        return ""
    };
    a.magnificPopup.registerModule("image", {
        options: {
            markup: '<div class="mfp-figure"><div class="mfp-close"></div><figure><div class="mfp-img"></div><figcaption><div class="mfp-bottom-bar"><div class="mfp-title"></div><div class="mfp-counter"></div></div></figcaption></figure></div>',
            cursor: "mfp-zoom-out-cur",
            titleSrc: "title",
            verticalFit: !0,
            tError: '<a href="%url%">The image</a> could not be loaded.'
        }, proto: {
            initImage: function () {
                var c = b.st.image, d = ".image";
                b.types.push("image"), w(m + d, function () {
                    "image" === b.currItem.type && c.cursor && a(document.body).addClass(c.cursor)
                }), w(h + d, function () {
                    c.cursor && a(document.body).removeClass(c.cursor), v.off("resize" + p)
                }), w("Resize" + d, b.resizeImage), b.isLowIE && w("AfterChange", b.resizeImage)
            }, resizeImage: function () {
                var a = b.currItem;
                if (a && a.img && b.st.image.verticalFit) {
                    var c = 0;
                    b.isLowIE && (c = parseInt(a.img.css("padding-top"), 10) + parseInt(a.img.css("padding-bottom"), 10)), a.img.css("max-height", b.wH - c)
                }
            }, _onImageHasSize: function (a) {
                a.img && (a.hasSize = !0, L && clearInterval(L), a.isCheckingImgSize = !1, y("ImageHasSize", a), a.imgHidden && (b.content && b.content.removeClass("mfp-loading"), a.imgHidden = !1))
            }, findImageSize: function (a) {
                var c = 0, d = a.img[0], e = function (f) {
                    L && clearInterval(L), L = setInterval(function () {
                        return d.naturalWidth > 0 ? void b._onImageHasSize(a) : (c > 200 && clearInterval(L), c++, void(3 === c ? e(10) : 40 === c ? e(50) : 100 === c && e(500)))
                    }, f)
                };
                e(1)
            }, getImage: function (c, d) {
                var e = 0, f = function () {
                    c && (c.img[0].complete ? (c.img.off(".mfploader"), c === b.currItem && (b._onImageHasSize(c), b.updateStatus("ready")), c.hasSize = !0, c.loaded = !0, y("ImageLoadComplete")) : (e++, 200 > e ? setTimeout(f, 100) : g()))
                }, g = function () {
                    c && (c.img.off(".mfploader"), c === b.currItem && (b._onImageHasSize(c), b.updateStatus("error", h.tError.replace("%url%", c.src))), c.hasSize = !0, c.loaded = !0, c.loadError = !0)
                }, h = b.st.image, i = d.find(".mfp-img");
                if (i.length) {
                    var j = document.createElement("img");
                    j.className = "mfp-img", c.el && c.el.find("img").length && (j.alt = c.el.find("img").attr("alt")), c.img = a(j).on("load.mfploader", f).on("error.mfploader", g), j.src = c.src, i.is("img") && (c.img = c.img.clone()), j = c.img[0], j.naturalWidth > 0 ? c.hasSize = !0 : j.width || (c.hasSize = !1)
                }
                return b._parseMarkup(d, {
                    title: M(c),
                    img_replaceWith: c.img
                }, c), b.resizeImage(), c.hasSize ? (L && clearInterval(L), c.loadError ? (d.addClass("mfp-loading"), b.updateStatus("error", h.tError.replace("%url%", c.src))) : (d.removeClass("mfp-loading"), b.updateStatus("ready")), d) : (b.updateStatus("loading"), c.loading = !0, c.hasSize || (c.imgHidden = !0, d.addClass("mfp-loading"), b.findImageSize(c)), d)
            }
        }
    });
    var N, O = function () {
        return void 0 === N && (N = void 0 !== document.createElement("p").style.MozTransform), N
    };
    a.magnificPopup.registerModule("zoom", {
        options: {
            enabled: !1,
            easing: "ease-in-out",
            duration: 300,
            opener: function (a) {
                return a.is("img") ? a : a.find("img")
            }
        }, proto: {
            initZoom: function () {
                var a, c = b.st.zoom, d = ".zoom";
                if (c.enabled && b.supportsTransition) {
                    var e, f, g = c.duration, j = function (a) {
                        var b = a.clone().removeAttr("style").removeAttr("class").addClass("mfp-animated-image"),
                            d = "all " + c.duration / 1e3 + "s " + c.easing, e = {
                                position: "fixed",
                                zIndex: 9999,
                                left: 0,
                                top: 0,
                                "-webkit-backface-visibility": "hidden"
                            }, f = "transition";
                        return e["-webkit-" + f] = e["-moz-" + f] = e["-o-" + f] = e[f] = d, b.css(e), b
                    }, k = function () {
                        b.content.css("visibility", "visible")
                    };
                    w("BuildControls" + d, function () {
                        if (b._allowZoom()) {
                            if (clearTimeout(e), b.content.css("visibility", "hidden"), a = b._getItemToZoom(), !a) return void k();
                            f = j(a), f.css(b._getOffset()), b.wrap.append(f), e = setTimeout(function () {
                                f.css(b._getOffset(!0)), e = setTimeout(function () {
                                    k(), setTimeout(function () {
                                        f.remove(), a = f = null, y("ZoomAnimationEnded")
                                    }, 16)
                                }, g)
                            }, 16)
                        }
                    }), w(i + d, function () {
                        if (b._allowZoom()) {
                            if (clearTimeout(e), b.st.removalDelay = g, !a) {
                                if (a = b._getItemToZoom(), !a) return;
                                f = j(a)
                            }
                            f.css(b._getOffset(!0)), b.wrap.append(f), b.content.css("visibility", "hidden"), setTimeout(function () {
                                f.css(b._getOffset())
                            }, 16)
                        }
                    }), w(h + d, function () {
                        b._allowZoom() && (k(), f && f.remove(), a = null)
                    })
                }
            }, _allowZoom: function () {
                return "image" === b.currItem.type
            }, _getItemToZoom: function () {
                return b.currItem.hasSize ? b.currItem.img : !1
            }, _getOffset: function (c) {
                var d;
                d = c ? b.currItem.img : b.st.zoom.opener(b.currItem.el || b.currItem);
                var e = d.offset(), f = parseInt(d.css("padding-top"), 10), g = parseInt(d.css("padding-bottom"), 10);
                e.top -= a(window).scrollTop() - f;
                var h = {width: d.width(), height: (u ? d.innerHeight() : d[0].offsetHeight) - g - f};
                return O() ? h["-moz-transform"] = h.transform = "translate(" + e.left + "px," + e.top + "px)" : (h.left = e.left, h.top = e.top), h
            }
        }
    });
    var P = "iframe", Q = "//about:blank", R = function (a) {
        if (b.currTemplate[P]) {
            var c = b.currTemplate[P].find("iframe");
            c.length && (a || (c[0].src = Q), b.isIE8 && c.css("display", a ? "block" : "none"))
        }
    };
    a.magnificPopup.registerModule(P, {
        options: {
            markup: '<div class="mfp-iframe-scaler"><div class="mfp-close"></div><iframe class="mfp-iframe" src="//about:blank" frameborder="0" allowfullscreen></iframe></div>',
            srcAction: "iframe_src",
            patterns: {
                youtube: {index: "youtube.com", id: "v=", src: "//www.youtube.com/embed/%id%?autoplay=1"},
                vimeo: {index: "vimeo.com/", id: "/", src: "//player.vimeo.com/video/%id%?autoplay=1"},
                gmaps: {index: "//maps.google.", src: "%id%&output=embed"}
            }
        }, proto: {
            initIframe: function () {
                b.types.push(P), w("BeforeChange", function (a, b, c) {
                    b !== c && (b === P ? R() : c === P && R(!0))
                }), w(h + "." + P, function () {
                    R()
                })
            }, getIframe: function (c, d) {
                var e = c.src, f = b.st.iframe;
                a.each(f.patterns, function () {
                    return e.indexOf(this.index) > -1 ? (this.id && (e = "string" == typeof this.id ? e.substr(e.lastIndexOf(this.id) + this.id.length, e.length) : this.id.call(this, e)), e = this.src.replace("%id%", e), !1) : void 0
                });
                var g = {};
                return f.srcAction && (g[f.srcAction] = e), b._parseMarkup(d, g, c), b.updateStatus("ready"), d
            }
        }
    });
    var S = function (a) {
        var c = b.items.length;
        return a > c - 1 ? a - c : 0 > a ? c + a : a
    }, T = function (a, b, c) {
        return a.replace(/%curr%/gi, b + 1).replace(/%total%/gi, c)
    };
    a.magnificPopup.registerModule("gallery", {
        options: {
            enabled: !1,
            arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',
            preload: [0, 2],
            navigateByImgClick: !0,
            arrows: !0,
            tPrev: "Previous (Left arrow key)",
            tNext: "Next (Right arrow key)",
            tCounter: "%curr% of %total%"
        }, proto: {
            initGallery: function () {
                var c = b.st.gallery, e = ".mfp-gallery";
                return b.direction = !0, c && c.enabled ? (f += " mfp-gallery", w(m + e, function () {
                    c.navigateByImgClick && b.wrap.on("click" + e, ".mfp-img", function () {
                        return b.items.length > 1 ? (b.next(), !1) : void 0
                    }), d.on("keydown" + e, function (a) {
                        37 === a.keyCode ? b.prev() : 39 === a.keyCode && b.next()
                    })
                }), w("UpdateStatus" + e, function (a, c) {
                    c.text && (c.text = T(c.text, b.currItem.index, b.items.length))
                }), w(l + e, function (a, d, e, f) {
                    var g = b.items.length;
                    e.counter = g > 1 ? T(c.tCounter, f.index, g) : ""
                }), w("BuildControls" + e, function () {
                    if (b.items.length > 1 && c.arrows && !b.arrowLeft) {
                        var d = c.arrowMarkup,
                            e = b.arrowLeft = a(d.replace(/%title%/gi, c.tPrev).replace(/%dir%/gi, "left")).addClass(s),
                            f = b.arrowRight = a(d.replace(/%title%/gi, c.tNext).replace(/%dir%/gi, "right")).addClass(s);
                        e.click(function () {
                            b.prev()
                        }), f.click(function () {
                            b.next()
                        }), b.container.append(e.add(f))
                    }
                }), w(n + e, function () {
                    b._preloadTimeout && clearTimeout(b._preloadTimeout), b._preloadTimeout = setTimeout(function () {
                        b.preloadNearbyImages(), b._preloadTimeout = null
                    }, 16)
                }), void w(h + e, function () {
                    d.off(e), b.wrap.off("click" + e), b.arrowRight = b.arrowLeft = null
                })) : !1
            }, next: function () {
                b.direction = !0, b.index = S(b.index + 1), b.updateItemHTML()
            }, prev: function () {
                b.direction = !1, b.index = S(b.index - 1), b.updateItemHTML()
            }, goTo: function (a) {
                b.direction = a >= b.index, b.index = a, b.updateItemHTML()
            }, preloadNearbyImages: function () {
                var a, c = b.st.gallery.preload, d = Math.min(c[0], b.items.length), e = Math.min(c[1], b.items.length);
                for (a = 1; a <= (b.direction ? e : d); a++) b._preloadItem(b.index + a);
                for (a = 1; a <= (b.direction ? d : e); a++) b._preloadItem(b.index - a)
            }, _preloadItem: function (c) {
                if (c = S(c), !b.items[c].preloaded) {
                    var d = b.items[c];
                    d.parsed || (d = b.parseEl(c)), y("LazyLoad", d), "image" === d.type && (d.img = a('<img class="mfp-img" />').on("load.mfploader", function () {
                        d.hasSize = !0
                    }).on("error.mfploader", function () {
                        d.hasSize = !0, d.loadError = !0, y("LazyLoadError", d)
                    }).attr("src", d.src)), d.preloaded = !0
                }
            }
        }
    });
    var U = "retina";
    a.magnificPopup.registerModule(U, {
        options: {
            replaceSrc: function (a) {
                return a.src.replace(/\.\w+$/, function (a) {
                    return "@2x" + a
                })
            }, ratio: 1
        }, proto: {
            initRetina: function () {
                if (window.devicePixelRatio > 1) {
                    var a = b.st.retina, c = a.ratio;
                    c = isNaN(c) ? c() : c, c > 1 && (w("ImageHasSize." + U, function (a, b) {
                        b.img.css({"max-width": b.img[0].naturalWidth / c, width: "100%"})
                    }), w("ElementParse." + U, function (b, d) {
                        d.src = a.replaceSrc(d, c)
                    }))
                }
            }
        }
    }), A()
});

//End Magnific Popup Js

/**
 * sticky-sidebar - A JavaScript plugin for making smart and high performance.
 * @version v3.3.1
 * @link https://github.com/abouolia/sticky-sidebar
 * @author Ahmed Bouhuolia
 * @license The MIT License (MIT)
 **/
!function (t, e) {
    "object" == typeof exports && "undefined" != typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define(e) : t.StickySidebar = e()
}(this, function () {
    "use strict";
    "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof self && self;

    function t(t) {
        return t && t.__esModule && Object.prototype.hasOwnProperty.call(t, "default") ? t.default : t
    }

    function e(t, e) {
        return t(e = {exports: {}}, e.exports), e.exports
    }

    var i = e(function (t, e) {
        (function (t) {
            Object.defineProperty(t, "__esModule", {value: !0});
            var l, n, e = function () {
                function n(t, e) {
                    for (var i = 0; i < e.length; i++) {
                        var n = e[i];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(t, n.key, n)
                    }
                }

                return function (t, e, i) {
                    return e && n(t.prototype, e), i && n(t, i), t
                }
            }(), i = (l = ".stickySidebar", n = {
                topSpacing: 0,
                bottomSpacing: 0,
                containerSelector: !1,
                innerWrapperSelector: ".inner-wrapper-sticky",
                stickyClass: "is-affixed",
                resizeSensor: !0,
                minWidth: !1
            }, function () {
                function c(t) {
                    var e = this, i = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : {};
                    if (function (t, e) {
                        if (!(t instanceof e)) throw new TypeError("Cannot call a class as a function")
                    }(this, c), this.options = c.extend(n, i), this.sidebar = "string" == typeof t ? document.querySelector(t) : t, void 0 === this.sidebar) throw new Error("There is no specific sidebar element.");
                    this.sidebarInner = !1, this.container = this.sidebar.parentElement, this.affixedType = "STATIC", this.direction = "down", this.support = {
                        transform: !1,
                        transform3d: !1
                    }, this._initialized = !1, this._reStyle = !1, this._breakpoint = !1, this.dimensions = {
                        translateY: 0,
                        maxTranslateY: 0,
                        topSpacing: 0,
                        lastTopSpacing: 0,
                        bottomSpacing: 0,
                        lastBottomSpacing: 0,
                        sidebarHeight: 0,
                        sidebarWidth: 0,
                        containerTop: 0,
                        containerHeight: 0,
                        viewportHeight: 0,
                        viewportTop: 0,
                        lastViewportTop: 0
                    }, ["handleEvent"].forEach(function (t) {
                        e[t] = e[t].bind(e)
                    }), this.initialize()
                }

                return e(c, [{
                    key: "initialize", value: function () {
                        var i = this;
                        if (this._setSupportFeatures(), this.options.innerWrapperSelector && (this.sidebarInner = this.sidebar.querySelector(this.options.innerWrapperSelector), null === this.sidebarInner && (this.sidebarInner = !1)), !this.sidebarInner) {
                            var t = document.createElement("div");
                            for (t.setAttribute("class", "inner-wrapper-sticky"), this.sidebar.appendChild(t); this.sidebar.firstChild != t;) t.appendChild(this.sidebar.firstChild);
                            this.sidebarInner = this.sidebar.querySelector(".inner-wrapper-sticky")
                        }
                        if (this.options.containerSelector) {
                            var e = document.querySelectorAll(this.options.containerSelector);
                            if ((e = Array.prototype.slice.call(e)).forEach(function (t, e) {
                                t.contains(i.sidebar) && (i.container = t)
                            }), !e.length) throw new Error("The container does not contains on the sidebar.")
                        }
                        "function" != typeof this.options.topSpacing && (this.options.topSpacing = parseInt(this.options.topSpacing) || 0), "function" != typeof this.options.bottomSpacing && (this.options.bottomSpacing = parseInt(this.options.bottomSpacing) || 0), this._widthBreakpoint(), this.calcDimensions(), this.stickyPosition(), this.bindEvents(), this._initialized = !0
                    }
                }, {
                    key: "bindEvents", value: function () {
                        window.addEventListener("resize", this, {
                            passive: !0,
                            capture: !1
                        }), window.addEventListener("scroll", this, {
                            passive: !0,
                            capture: !1
                        }), this.sidebar.addEventListener("update" + l, this), this.options.resizeSensor && "undefined" != typeof ResizeSensor && (new ResizeSensor(this.sidebarInner, this.handleEvent), new ResizeSensor(this.container, this.handleEvent))
                    }
                }, {
                    key: "handleEvent", value: function (t) {
                        this.updateSticky(t)
                    }
                }, {
                    key: "calcDimensions", value: function () {
                        if (!this._breakpoint) {
                            var t = this.dimensions;
                            t.containerTop = c.offsetRelative(this.container).top, t.containerHeight = this.container.clientHeight, t.containerBottom = t.containerTop + t.containerHeight, t.sidebarHeight = this.sidebarInner.offsetHeight, t.sidebarWidth = this.sidebarInner.offsetWidth, t.viewportHeight = window.innerHeight, t.maxTranslateY = t.containerHeight - t.sidebarHeight, this._calcDimensionsWithScroll()
                        }
                    }
                }, {
                    key: "_calcDimensionsWithScroll", value: function () {
                        var t = this.dimensions;
                        t.sidebarLeft = c.offsetRelative(this.sidebar).left, t.viewportTop = document.documentElement.scrollTop || document.body.scrollTop, t.viewportBottom = t.viewportTop + t.viewportHeight, t.viewportLeft = document.documentElement.scrollLeft || document.body.scrollLeft, t.topSpacing = this.options.topSpacing, t.bottomSpacing = this.options.bottomSpacing, "function" == typeof t.topSpacing && (t.topSpacing = parseInt(t.topSpacing(this.sidebar)) || 0), "function" == typeof t.bottomSpacing && (t.bottomSpacing = parseInt(t.bottomSpacing(this.sidebar)) || 0), "VIEWPORT-TOP" === this.affixedType ? t.topSpacing < t.lastTopSpacing && (t.translateY += t.lastTopSpacing - t.topSpacing, this._reStyle = !0) : "VIEWPORT-BOTTOM" === this.affixedType && t.bottomSpacing < t.lastBottomSpacing && (t.translateY += t.lastBottomSpacing - t.bottomSpacing, this._reStyle = !0), t.lastTopSpacing = t.topSpacing, t.lastBottomSpacing = t.bottomSpacing
                    }
                }, {
                    key: "isSidebarFitsViewport", value: function () {
                        var t = this.dimensions,
                            e = "down" === this.scrollDirection ? t.lastBottomSpacing : t.lastTopSpacing;
                        return this.dimensions.sidebarHeight + e < this.dimensions.viewportHeight
                    }
                }, {
                    key: "observeScrollDir", value: function () {
                        var t = this.dimensions;
                        if (t.lastViewportTop !== t.viewportTop) {
                            var e = "down" === this.direction ? Math.min : Math.max;
                            t.viewportTop === e(t.viewportTop, t.lastViewportTop) && (this.direction = "down" === this.direction ? "up" : "down")
                        }
                    }
                }, {
                    key: "getAffixType", value: function () {
                        this._calcDimensionsWithScroll();
                        var t = this.dimensions, e = t.viewportTop + t.topSpacing, i = this.affixedType;
                        return e <= t.containerTop || t.containerHeight <= t.sidebarHeight ? (t.translateY = 0, i = "STATIC") : i = "up" === this.direction ? this._getAffixTypeScrollingUp() : this._getAffixTypeScrollingDown(), t.translateY = Math.max(0, t.translateY), t.translateY = Math.min(t.containerHeight, t.translateY), t.translateY = Math.round(t.translateY), t.lastViewportTop = t.viewportTop, i
                    }
                }, {
                    key: "_getAffixTypeScrollingDown", value: function () {
                        var t = this.dimensions, e = t.sidebarHeight + t.containerTop, i = t.viewportTop + t.topSpacing,
                            n = t.viewportBottom - t.bottomSpacing, o = this.affixedType;
                        return this.isSidebarFitsViewport() ? t.sidebarHeight + i >= t.containerBottom ? (t.translateY = t.containerBottom - e, o = "CONTAINER-BOTTOM") : i >= t.containerTop && (t.translateY = i - t.containerTop, o = "VIEWPORT-TOP") : t.containerBottom <= n ? (t.translateY = t.containerBottom - e, o = "CONTAINER-BOTTOM") : e + t.translateY <= n ? (t.translateY = n - e, o = "VIEWPORT-BOTTOM") : t.containerTop + t.translateY <= i && 0 !== t.translateY && t.maxTranslateY !== t.translateY && (o = "VIEWPORT-UNBOTTOM"), o
                    }
                }, {
                    key: "_getAffixTypeScrollingUp", value: function () {
                        var t = this.dimensions, e = t.sidebarHeight + t.containerTop, i = t.viewportTop + t.topSpacing,
                            n = t.viewportBottom - t.bottomSpacing, o = this.affixedType;
                        return i <= t.translateY + t.containerTop ? (t.translateY = i - t.containerTop, o = "VIEWPORT-TOP") : t.containerBottom <= n ? (t.translateY = t.containerBottom - e, o = "CONTAINER-BOTTOM") : this.isSidebarFitsViewport() || t.containerTop <= i && 0 !== t.translateY && t.maxTranslateY !== t.translateY && (o = "VIEWPORT-UNBOTTOM"), o
                    }
                }, {
                    key: "_getStyle", value: function (t) {
                        if (void 0 !== t) {
                            var e = {inner: {}, outer: {}}, i = this.dimensions;
                            switch (t) {
                                case"VIEWPORT-TOP":
                                    e.inner = {
                                        position: "fixed",
                                        top: i.topSpacing,
                                        left: i.sidebarLeft - i.viewportLeft,
                                        width: i.sidebarWidth
                                    };
                                    break;
                                case"VIEWPORT-BOTTOM":
                                    e.inner = {
                                        position: "fixed",
                                        top: "auto",
                                        left: i.sidebarLeft,
                                        bottom: i.bottomSpacing,
                                        width: i.sidebarWidth
                                    };
                                    break;
                                case"CONTAINER-BOTTOM":
                                case"VIEWPORT-UNBOTTOM":
                                    var n = this._getTranslate(0, i.translateY + "px");
                                    e.inner = n ? {transform: n} : {
                                        position: "absolute",
                                        top: i.translateY,
                                        width: i.sidebarWidth
                                    }
                            }
                            switch (t) {
                                case"VIEWPORT-TOP":
                                case"VIEWPORT-BOTTOM":
                                case"VIEWPORT-UNBOTTOM":
                                case"CONTAINER-BOTTOM":
                                    e.outer = {height: i.sidebarHeight, position: "relative"}
                            }
                            return e.outer = c.extend({
                                height: "",
                                position: ""
                            }, e.outer), e.inner = c.extend({
                                position: "relative",
                                top: "",
                                left: "",
                                bottom: "",
                                width: "",
                                transform: ""
                            }, e.inner), e
                        }
                    }
                }, {
                    key: "stickyPosition", value: function (t) {
                        if (!this._breakpoint) {
                            t = this._reStyle || t || !1, this.options.topSpacing, this.options.bottomSpacing;
                            var e = this.getAffixType(), i = this._getStyle(e);
                            if ((this.affixedType != e || t) && e) {
                                var n = "affix." + e.toLowerCase().replace("viewport-", "") + l;
                                for (var o in c.eventTrigger(this.sidebar, n), "STATIC" === e ? c.removeClass(this.sidebar, this.options.stickyClass) : c.addClass(this.sidebar, this.options.stickyClass), i.outer) {
                                    var s = "number" == typeof i.outer[o] ? "px" : "";
                                    this.sidebar.style[o] = i.outer[o] + s
                                }
                                for (var r in i.inner) {
                                    var a = "number" == typeof i.inner[r] ? "px" : "";
                                    this.sidebarInner.style[r] = i.inner[r] + a
                                }
                                var p = "affixed." + e.toLowerCase().replace("viewport-", "") + l;
                                c.eventTrigger(this.sidebar, p)
                            } else this._initialized && (this.sidebarInner.style.left = i.inner.left);
                            this.affixedType = e
                        }
                    }
                }, {
                    key: "_widthBreakpoint", value: function () {
                        window.innerWidth <= this.options.minWidth ? (this._breakpoint = !0, this.affixedType = "STATIC", this.sidebar.removeAttribute("style"), c.removeClass(this.sidebar, this.options.stickyClass), this.sidebarInner.removeAttribute("style")) : this._breakpoint = !1
                    }
                }, {
                    key: "updateSticky", value: function () {
                        var t, e = this, i = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : {};
                        this._running || (this._running = !0, t = i.type, requestAnimationFrame(function () {
                            switch (t) {
                                case"scroll":
                                    e._calcDimensionsWithScroll(), e.observeScrollDir(), e.stickyPosition();
                                    break;
                                case"resize":
                                default:
                                    e._widthBreakpoint(), e.calcDimensions(), e.stickyPosition(!0)
                            }
                            e._running = !1
                        }))
                    }
                }, {
                    key: "_setSupportFeatures", value: function () {
                        var t = this.support;
                        t.transform = c.supportTransform(), t.transform3d = c.supportTransform(!0)
                    }
                }, {
                    key: "_getTranslate", value: function () {
                        var t = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : 0,
                            e = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : 0,
                            i = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : 0;
                        return this.support.transform3d ? "translate3d(" + t + ", " + e + ", " + i + ")" : !!this.support.translate && "translate(" + t + ", " + e + ")"
                    }
                }, {
                    key: "destroy", value: function () {
                        window.removeEventListener("resize", this, {capture: !1}), window.removeEventListener("scroll", this, {capture: !1}), this.sidebar.classList.remove(this.options.stickyClass), this.sidebar.style.minHeight = "", this.sidebar.removeEventListener("update" + l, this);
                        var t = {inner: {}, outer: {}};
                        for (var e in t.inner = {
                            position: "",
                            top: "",
                            left: "",
                            bottom: "",
                            width: "",
                            transform: ""
                        }, t.outer = {height: "", position: ""}, t.outer) this.sidebar.style[e] = t.outer[e];
                        for (var i in t.inner) this.sidebarInner.style[i] = t.inner[i];
                        this.options.resizeSensor && "undefined" != typeof ResizeSensor && (ResizeSensor.detach(this.sidebarInner, this.handleEvent), ResizeSensor.detach(this.container, this.handleEvent))
                    }
                }], [{
                    key: "supportTransform", value: function (t) {
                        var i = !1, e = t ? "perspective" : "transform", n = e.charAt(0).toUpperCase() + e.slice(1),
                            o = document.createElement("support").style;
                        return (e + " " + ["Webkit", "Moz", "O", "ms"].join(n + " ") + n).split(" ").forEach(function (t, e) {
                            if (void 0 !== o[t]) return i = t, !1
                        }), i
                    }
                }, {
                    key: "eventTrigger", value: function (t, e, i) {
                        try {
                            var n = new CustomEvent(e, {detail: i})
                        } catch (t) {
                            (n = document.createEvent("CustomEvent")).initCustomEvent(e, !0, !0, i)
                        }
                        t.dispatchEvent(n)
                    }
                }, {
                    key: "extend", value: function (t, e) {
                        var i = {};
                        for (var n in t) void 0 !== e[n] ? i[n] = e[n] : i[n] = t[n];
                        return i
                    }
                }, {
                    key: "offsetRelative", value: function (t) {
                        var e = {left: 0, top: 0};
                        do {
                            var i = t.offsetTop, n = t.offsetLeft;
                            isNaN(i) || (e.top += i), isNaN(n) || (e.left += n), t = "BODY" === t.tagName ? t.parentElement : t.offsetParent
                        } while (t);
                        return e
                    }
                }, {
                    key: "addClass", value: function (t, e) {
                        c.hasClass(t, e) || (t.classList ? t.classList.add(e) : t.className += " " + e)
                    }
                }, {
                    key: "removeClass", value: function (t, e) {
                        c.hasClass(t, e) && (t.classList ? t.classList.remove(e) : t.className = t.className.replace(new RegExp("(^|\\b)" + e.split(" ").join("|") + "(\\b|$)", "gi"), " "))
                    }
                }, {
                    key: "hasClass", value: function (t, e) {
                        return t.classList ? t.classList.contains(e) : new RegExp("(^| )" + e + "( |$)", "gi").test(t.className)
                    }
                }, {
                    key: "defaults", get: function () {
                        return n
                    }
                }]), c
            }());
            t.default = i, window.StickySidebar = i
        })(e)
    });
    return t(i), t(e(function (t, e) {
        (function (t) {
            var e, s = (e = t) && e.__esModule ? e : {default: e};
            !function () {
                if ("undefined" != typeof window) {
                    var n = window.$ || window.jQuery || window.Zepto, o = "stickySidebar";
                    if (n) {
                        n.fn.stickySidebar = function (i) {
                            return this.each(function () {
                                var t = n(this), e = n(this).data(o);
                                if (e || (e = new s.default(this, "object" == typeof i && i), t.data(o, e)), "string" == typeof i) {
                                    if (void 0 === e[i] && -1 === ["destroy", "updateSticky"].indexOf(i)) throw new Error('No method named "' + i + '"');
                                    e[i]()
                                }
                            })
                        }, n.fn.stickySidebar.Constructor = s.default;
                        var t = n.fn.stickySidebar;
                        n.fn.stickySidebar.noConflict = function () {
                            return n.fn.stickySidebar = t, this
                        }
                    }
                }
            }()
        })(i)
    }))
});

// Sticky Sidebar End
