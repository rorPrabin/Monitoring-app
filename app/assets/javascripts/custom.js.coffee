class @Theme
  constructor: ->
    that = @
    @body = $("body")
    @header = $(".header")
    @sidebar_scroller = $("#sidebar-content")
    @notif_scroller = $(".quick_notification .scroller")
    @js_initializers()
    @set_body_height()

  calculate_bodyheight: =>
    height_diff = $(document).height() - $(window).height()
    if height_diff <= @header.outerHeight()
      body_height = $(document).height() - height_diff
    else
      body_height = $(document).height()
    body_height = body_height - @header.outerHeight()
    return body_height

  set_body_height: =>
    body_height = @calculate_bodyheight
    @body.height(body_height)
  
  js_initializers: =>
    @sidebar_scroller.slimScroll
      height: "100%"
      railVisible: true
      alwaysVisible: true
      allowPageScroll: false
    @notif_scroller.slimScroll
      height: "157px"
      alwaysVisible: true
      allowPageScroll: true

$(document).ready ->
  t = new Theme
  $(window).resize ->
    t.set_body_height()

$(document).on 'page:change', ->  
  t = new Theme
  $(window).resize ->
    t.set_body_height()