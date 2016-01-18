window.$ = jQuery;

var site = require('./behaviors/*.js', {mode: 'hash'});
_.extend(Drupal.behaviors, site);
