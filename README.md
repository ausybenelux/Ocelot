drupal-theme-boilerplate
========================

A base theme implementation for drupal theming that Follows [http://smacss.com/](smacss) specs.

###Structure:
  * templates/
  * default.info
  * gemfile.rb
  * Gruntfile.coffee
  * package.json
  * template.php
  * assets/
    * coffee/
    * css/
    * font/
    * img/
    * js/
    * sass/
    * svg/

###Grunt tasks examples:
  * `grunt watch` watches all files described in watch task
  * `grunt watch:sass` watches all .sass files
  * `grunt` executes default grunt task `compass:app, coffee, jshint`
  * `grunt deploy` executes deploy grunt task `compass:deploy, concat_css, coffee, jshint, concat, uglify, imagemin`


###Syntax:
  * recommended use of **coffeescript** over **javascript**, checkout [http://coffeescript.org/](coffeescript.org)
  * recommended use of **.sass** syntax over **.scss** syntax
  * img structure can be altered but is recommended
  * you can use svg for logo's and icons
  * font folder should contain webfonts `.TTF, .EOT, .WOFF, .SVG`

###Sass and smacss:
#####separation of files by smacss principal:

  * `base.sass`
  * `layout.sass`
  * `module.sass`
  * `print.sass`
  * `state.sass`

#####3thparty and vendor libs can sit in *vendor/*

  * `vendor/_grid.scss` [profoundgrid](http://www.profoundgrid.com/)
  * `vendor/_media-queries.scss` [sass-mediaqueries](http://paranoida.github.io/sass-mediaqueries/)

Other vendor libs can be used

#####Libs dir
  * `lib/var.sass` all variables
  * `lib/mixin.sass` all mixins and extendables
