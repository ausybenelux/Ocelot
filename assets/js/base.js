(function($, Drupal) {
  var helper, site;
  helper = {
    scroll_to: function(target) {
      var destination, speed, topoffset;
      if ($(target).offset() != null) {
        topoffset = 70;
        speed = 600;
        destination = $(target).offset().top - topoffset;
        $('html:not(:animated),body:not(:animated)').animate({
          scrollTop: destination
        }, speed, function() {
          return $(document).scrollTop(destination);
        });
      }
      return false;
    }
  };
  site = {
    myCode: {
      attach: function(context, settings) {
        return console.log("myCode");
      }
    },
    myCode2: {
      attach: function(context, settings) {
        return console.log("myCode2");
      }
    }
  };
  _.extend(Drupal.behaviors, site);
  $(function() {
    return console.log("Document is ready");
  });
  return $(window).load(function(e) {
    return console.log("Window is loaded");
  });
})(jQuery, Drupal);

//# sourceMappingURL=base.js.map
