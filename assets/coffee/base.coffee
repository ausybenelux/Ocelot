site =
  page: $('body').attr 'data-page'
  index: ->
    app.router = new app.Router()
    Backbone.history.start pushState: true, hashChange: false

    $('body').delegate ".overlay", "click", (e) ->
      do e.preventDefault
      if $(e.target).hasClass("overlay") or $(e.target).hasClass("close")
        $(e.currentTarget).addClass "hidden"

    $('.main').delegate ".open-overlay", "click", (e) ->
      do e.preventDefault
      parent = $(@).parent()
      current = $(e.currentTarget)

      if parent.hasClass "slideshow"
        app.views.gal.show current.data "key"
      else
        app.views.video.show current.data "key"


    enquire.register "screen and (min-width:1024px)",
      match : -> $(window).on "scroll", helper.scroll
      unmatch : ->
        $(window).off "scroll", helper.scroll
        do helper.unscroll

$ ->
  if typeof site[site.page] is "function"
    do site[site.page]
