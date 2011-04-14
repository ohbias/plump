$ ->
  # Resize Hacks
  $(window).bind "resize", ->
    $('#canvas > svg').width($('#canvas').width()).height($('#canvas').height())
  # End hacks
