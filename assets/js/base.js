(function($, Drupal) {
  var helper, site;

  helper = {
    scrollTo: function(target) {
      var destination, speed, topoffset;

      if ($(target).offset() !== null) {
        topoffset = 70;
        speed = 600;
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
