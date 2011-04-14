do ->
  # raphael
  paper = Raphael("raphael-canvas", $('#raphael-canvas').width(), $('#raphael-canvas').height())
  window.paper = paper
  width = "100%"
  height = "100%"
  Raphael.getColor.reset()
  cwidth = $('#raphael-canvas').width()
  cheight = $('#raphael-canvas').height()

  # canvas
  html5canvas = document.getElementById("html5-canvas")
  if html5canvas.getContext
    window.canvas = html5canvas.getContext("2d")
    canvas.fillStyle = "rgb(200,0,0)"
    canvas.fillRect(10, 10, 55, 50)
    canvas.fillStyle = "rgba(0, 0, 200, 0.5)"
    canvas.fillRect(30, 30, 55, 50)

  # protovis


  # math
  window.abs = Math.abs
  window.acos = Math.acos
  window.asin = Math.asin
  window.atan = Math.atan
  window.ceil = Math.ceil
  window.cos = Math.cos
  window.exp = Math.exp
  window.floor = Math.floor
  window.log = Math.log
  window.max = Math.max
  window.min = Math.min
  window.pi = Math.PI
  window.pow = Math.pow
  window.random = Math.random
  window.round = Math.round
  window.sin = Math.sin
  window.sqrt = Math.sqrt
  window.tan = Math.tan

  # jquery
  window.background = (color) -> $('body').css {background: color}

  # underscore
  window.type = (object) ->
    if _.isArray(object)
      return "array"
    if _.isElement(object)
      return "element"
    if _.isNull(object)
      return "null"
    if _.isNaN(object)
      return "NaN"
    if _.isDate(object)
      return "date"
    if _.isArguments(object)
      return "arguments"
    if _.isRegExp(object)
      return "RegExp"
    else
      return typeof object

  attrs = ['cursor', 'cx', 'cy', 'fill', 'font', 'height',
           'href', 'opacity', 'path', 'r', 'rotation', 'rx', 'ry',
           'src', 'stroke', 'target', 'title', 'translation', 'width',
           'x', 'y']

  attrs2 = ['clip-rect', 'fill-opacity', 'font-family', 'font-size',
            'font-weight', 'stroke-dasharray', 'stroke-linecap',
            'stroke-linejoin', 'stroke-miterlimit', 'stroke-opacity',
            'text-anchor']

  toCamel = (str)->
    str.replace(/(\-[a-z])/g, `function($1){return $1.toUpperCase().replace('-','');}`)

  # shorthand for changing attributes
  #    circle(25,25,5).fill("red")
  for attr in attrs
    do (attr) ->
      Raphael.el[attr] = (value) ->
        obj = {}
        obj[attr] = value
        this.attr obj

  for attr in attrs2
    do (attr) ->
      attr = toCamel attr
      Raphael.el[attr] = (value) ->
        obj = {}
        obj[attr] = value
        this.attr obj
  
  # basic drag and drop
  start = ->
    # storing original coordinates
    this.ox = this.attr("cx")
    this.oy = this.attr("cy")
  move = (dx, dy) ->
      this.attr({cx: this.ox + dx, cy: this.oy + dy})
  up = ->
    # restoring state
  Raphael.el.draggable = ->
    this.drag(move,start,up)

  window.draggable = (object) ->
    object.drag(move,start,up)
