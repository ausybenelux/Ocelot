var helper = require("../modules/helper");

module.exports = {
  attach: function(context) {
    if (helper.contextCheck(context)) {
      return;
    }

    var breakpoints = Drupal.settings.breakpoints;
    console.log(breakpoints);
  }
};

