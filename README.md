drupal-theme-boilerplate
========================

A base theme implementation for drupal theming that Follows [http://smacss.com/](smacss) specs.<br>
**target**: provide clean theming setu


###Requirements:
  * [nodejs](http://nodejs.org) trough: website, nvm or brew
  * npm *(comes with node, no installation needed)*
  * [grunt](http://gruntjs.com/) `npm install -g grunt-cli`
  * clone this repo `git@github.com:rob-bar/drupal-theme-boilerplate.git`
  * run `npm install` inside and you are set to grunt


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
  * `grunt watch` [grunt](http://gruntjs.com/) watches all files described in watch task
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

#####Separation of files by smacss:

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
