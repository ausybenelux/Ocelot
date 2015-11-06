(function($, Drupal) {
  var helper, settings, site;

  settings = {
    timings: {
      speedy: 200,
      fast: 400,
      normal: 600,
      slow: 800
    },
    breakpoints: {
      mobile-landscape: 480,
      tablet-portrait: 768,
      desktop: 960,
      widescreen: 1200
    },
    debounce: {
      medium: 200
    }
  };

  helper = {
    scrollTo: function(target) {
      var destination, speed, topoffset;

      if ($(target).offset() !== null) {
        topoffset = 70;
        speed = settings.timings.normal;
        destination = $(target).offset().top - topoffset;
        $("html:not(:animated),body:not(:animated)").animate({
          scrollTop: destination
        }, speed, function() {
          return $(document).scrollTop(destination);
        });
      }
      return false;
    },

    contextCheck: function(context) {
      return (context !== document) ? true: false;
    }
  };

  site = {
    myCode: {
      attach: function(context) {
        if (helper.contextCheck(context)) {
          return;
        }

        return console.log("myCode");
      }
    },
    myCode2: {
      attach: function(context) {
        if (helper.contextCheck(context)) {
          return;
        }

        return console.log("myCode2");
      }
    }
  };

  _.extend(Drupal.behaviors, site);

})(jQuery, Drupal);
