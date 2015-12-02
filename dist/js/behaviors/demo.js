var helper = require("../modules/helper");

module.exports = {
  attach: function(context) {
    if (helper.contextCheck(context)) {
      return;
    }

    return console.log("myCode");
  }
};
