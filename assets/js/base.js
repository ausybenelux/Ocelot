var site = require('./behaviours/*.js', {mode: 'hash'});
_.extend(Drupal.behaviors, site);
