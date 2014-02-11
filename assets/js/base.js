(function() {
  var site;

  site = {
    page: $('body').attr('data-page'),
    index: function() {
      app.router = new app.Router();
      Backbone.history.start({
        pushState: true,
        hashChange: false
      });
      $('body').delegate(".overlay", "click", function(e) {
        e.preventDefault();
        if ($(e.target).hasClass("overlay") || $(e.target).hasClass("close")) {
          return $(e.currentTarget).addClass("hidden");
        }
      });
      $('.main').delegate(".open-overlay", "click", function(e) {
        var current, parent;
        e.preventDefault();
        parent = $(this).parent();
        current = $(e.currentTarget);
        if (parent.hasClass("slideshow")) {
          return app.views.gal.show(current.data("key"));
        } else {
          return app.views.video.show(current.data("key"));
        }
      });
      return enquire.register("screen and (min-width:1024px)", {
        match: function() {
          return $(window).on("scroll", helper.scroll);
        },
        unmatch: function() {
          $(window).off("scroll", helper.scroll);
          return helper.unscroll();
        }
      });
    }
  };

  $(function() {
    if (typeof site[site.page] === "function") {
      return site[site.page]();
    }
  });

}).call(this);

//# sourceMappingURL=base.js.map
