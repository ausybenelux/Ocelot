(($, Drupal) ->

  # HELPER FUNCTIONS
  helper =
    scroll_to: (target) ->
      if $(target).offset()?
        topoffset = 70
        speed = 600
        destination = $(target).offset().top - topoffset
        $('html:not(:animated),body:not(:animated)').animate(
          {scrollTop: destination}
          speed
          ->
            $(document).scrollTop(destination)
        )
      return false

  # DRUPAL BEHAVIORS
  site =
    myCode:
      attach: (context, settings) ->
        console.log "myCode"
    myCode2:
      attach: (context, settings) ->
        console.log "myCode2"

  _.extend Drupal.behaviors, site

  # DOC READY
  $ ->
    console.log "Document is ready"

  # WINDOW LOAD
  $(window).load (e) ->
    console.log "Window is loaded"

) jQuery, Drupal
