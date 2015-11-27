var helper = require("../modules/helper");

module.exports = {
  attach: function(context) {
    if (helper.contextCheck(context)) {
      return;
    }

    var breakpointMobile = Drupal.settings.breakpoints.mobile;
    console.log("Mobile breakpoint: " + breakpointMobile);
  }
};

