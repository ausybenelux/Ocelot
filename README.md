Drupal Xcheck Theme boilerplate
========================

A base theme implementation for drupal theming that Follows [http://smacss.com/](smacss) specs.<br>

## 1.0.1 Requirements:
  * [rvm](http://rvm.io/)
  * [nodejs](http://nodejs.org)
  * [grunt](http://gruntjs.com/)
  * This repository
    * `git clone git@github.com:Crosscheck/drupal-theme-boilerplate.git`

## 2.0.1 Installation:

When you have never worked on this project before you must go trough some basic installation steps. 

###### IMPORTANT !!!
When you are working on the [CrossCheck](https://github.com/Crosscheck/VagrantDrupalDev) Vagrant box you can skip to **2.1.1**

* install [rvm](http://rvm.io/) `\curl -sSL https://get.rvm.io | bash -s stable`
* install [node](http://nodejs.org/) `brew install node`
* install [grunt](http://gruntjs.com/) `npm install -g grunt-cli`


### 2.1.1 Install correct ruby version

  * When you browse to the theme folder, the .ruby-version file checks if you have the proper ruby version installed. If you don't rvm will prompt you with the command(**rvm install ruby-2.0.0-p481**) to run and to install the right ruby version, this can take some time.

Output when you browse to the folder:

    `ruby-2.0.0-p481 is not installed.`
    `To install do: 'rvm install ruby-2.0.0-p481'`

### 2.1.2 Setup the gemset to use

When you successfully installed this ruby version, you should create a gemset:
    
  * Change the name of `crosscheck_theme` to the real name of the theme 
  in your `.ruby-gemset` file, also in the `.ruby-version` file change it to ruby-2.0.0-p481@**yourthemename** <br><br>

  * Cd out and in the folder again, this will create the gemset with that name specified in `.ruby-gemset` for you, <br>
  **with this gemset the project it's gems are isolated, this is the same for every developer that works on this project.**<br><br>

  * You can also create and use the gemset yourself by doing
  `rvm gemset create crosscheck_theme && rvm gemset use crosscheck_theme`

### 2.1.3 Install gems from Gemfile to gemset

The final step is to install all the gems that are specified in the Gemfile so your gemset is complete. When you created the gemset `bundle` was included in the gemset.
  So you should use it te create your bundle.

run `bundle install` to install all gems

### 2.1.4 Extra gem, rvm, bundle related commands
Here are some extra commands that you can run for easier understanding gemsets, gems and rvm.

  * rvm list (displays all installed ruby versions)
  * gem list (displays all local gems installed in gemset)
  * rvm gemset list (displays all gemsets for current folder/ruby install)
  * rvm gemset help (displays help commands)
  * rvm help (displays help commands)
  * gem help commands (displays all the commands available for gem)

### 2.2.1 install npm packages with node

This will download the npm packages that are specified in the package.json file.
In this project mainly grunt plugins and grunt itself.

  * run: `npm install;`
  * additionaly you can try : `npm help;` for more information

### 2.2.2 Compiling and building procedure

  * `grunt watch` *([grunt](http://gruntjs.com/) watches all files described in watch task)*
  * `grunt watch:scss` *(watches all .scss files)*
  * `grunt` *(executes default grunt task compass:app, coffee, jshint)*
  * `grunt deploy` *(executes deploy grunt task compass:deploy, coffee, jshint, concat, uglify, imagemin)*

### 2.2.3 General theme Structure:
  
    crosscheck_theme.info
    Gemfile
    Gemfile.lock
    Gruntfile.coffee
    package.json
    template.php
    .gitignore
    .jshintrc
    .ruby-gemset
    .ruby-version
    templates/
    assets/
      css/
      font/
      img/
      js/
      scss/

## 3.0.1 Extra information
  * The [master](https://github.com/Crosscheck/drupal-theme-boilerplate/tree/master) branch is build so that it does not need a parent theme
  * The [omega](https://github.com/Crosscheck/drupal-theme-boilerplate/tree/omega) branch is a mixture of the [omega4 project](https://www.drupal.org/project/omega) and this boilerplate
  * You should use svg for logo's and icons
  * The font folder in assets should contain webfonts `.TTF, .EOT, .WOFF, .SVG`

## 4.0.1 Structure

### 4.1.1 General

* All compiled files and assets sit in the assets/ folder, like that this remains isolated and does not get cluttered between templates and php files.

* All configuration files like (.jshintrc, .ruby-gemset, .ruby-version, config.rb, Gemfile, Gemfile.lock, crosscheck_theme.info) are located in the root of the theme directory, all added config options should be located in the root of the theme.

* The rest of the files are files that drupal needs to make the theme.

* The assets folder holds: css(compiled css **always styles.css**), images (**all the images**), js (**/lib /vendor and base.js**), sass or scss files(these are all the scss files organized and ready to compile to styles.css)

### 4.1.2 Scss & compass

The theme is structured the [smacss](https://smacss.com/) way.
What this means is that a certain structure is followed at directory and files level.

    + lib/
    base.scss
    fallback.scss
    layout.scss
    state.scss
    styles.scss

The goal of the theme is to let the files compile and do all the work and spit out a single file. (styles.css)

### 4.1.3 Summary of the files

  * **styles.scss**

      This file can be used for general imports and structure,
      here you can alter the order of the way your files are compiled.
      this way you have control over what will be compiled and what won't be compiled into styles.css
      The styles file imports the gemfiles and lib files for use in base, layout components state or fallback

  * **lib/**

      The lib folder holds all the helper mixins, vars, grid, normalize files
      Basicly all the setup and helper files can be added in lib folder

  * **lib/var.scss**

      This file holds all the global variables, can be used for configuration or for making own variables

  * **lib/mixin.scss**

      This file holds all mixin helpers, if you make a mixin
      this is the place where you should add them

  * **base.scss**

      Here you can find the base styles of the theme, base styles are mainly html tag styles
      some minimal extra helper classes can also sit in this file

  * **layout.scss**

      Here you can find the layout styles of the theme, layout styles are styles for the main pictue,
      the bigger parts of the website can be styled here, in this file you can say for example where to put a component
      Region styles are also perfect for the layout.scss file

  * **component/** or components.scss

      Componnets are supose to be parts of the website that can live everywhere on the page, on every page.
      Styling of these components may not defer when they are moved to another container or place,
      this means that a component must always look the same in the website independent of its locationw.
      When components must look different depending on the place they are used that is where the layout.scss commes into place.
      In layout.scss you can define how a component must look in a specific location of div.
      Components can sit in one components.scss/scss file for small projects, but for larger projects it is recommended to use
      separate files and use sass globbing (see omega_sass and omega_scss files).

  * **state.scss**

    Here you can find the mediaqueries and responsive styling,
    anything that is styled for specific screen sizes can go in this file.
    This does not apply to components, these files can have their own mediaqueries or own fallback rules

  * **fallback.scss**

    This file is the crossbrowser file, all the fixes/styles made for specific browsers can go in this file
    This does not apply to components, these files can have their own mediaqueries or own fallback rules


### 4.1.4 Things to notice

General things you should know:

  * **css sourcemaps**
    The grunt configuration file sets sourcemapping on the styles.css files, that way you can inspect the project in chrome devtools or firefox debugger and find the actual source (scss) files.
    These `.css.map` files are ignored bythe gitignore. <br>
    How to set it up in [Chrome devtools](https://developer.chrome.com/devtools/docs/css-preprocessors). <br>
    How to set it up in [Firefox debugger](https://hacks.mozilla.org/2014/02/live-editing-sass-and-less-in-the-firefox-developer-tools/)
    

  * **importance of order**

    As you know the importance of order is very crucial in css therefore the styles.scss file follows a stable flow of order.
    Make sure you are aware of that flow.

    For example if you add something in the layout file to override something from the component at the same selector level.
    The selector from the component will run last and therefore your override wil not work. You must override with a more specific selector from the layout file.


  * **compressed or not compressed**

    There are 2 tasks commands in the gruntfile:

      `grunt`<br>
      `grunt deploy`

    Use `grunt` for **developmnet**, use `grunt deploy` when your project is in **production**!


  * **Something about comments**

    In scss / sass it is so that /* comments */ are outputted in the css file and // comments **not**.
    Being aware of that you should place your comments **always** in // form.
    That way your css files won't get cluttered in dev mode.
    Also the comments are in caps, this catches the attention slightly more and gives a nice touch.

        // VARS & MIXINS & HELPERS & GRID


    In adition to line comments you have separator comments. These comments are used to indicate a region or a piece that is tied together. This let's you identify parts of the code quicker. Also these are block comments so they are outputted to css files. There you will find it also handy to see these regions when you scroll trough the file.

        /* ====================================================================================================== */
        /* COMPONENTS
        /* ====================================================================================================== */

  * **Something about the grid**

    In state.scss/scss we have provided some **helper classes**.
    To **make columns** in a container div we have .w1 to .w12
    These classes are there to help you build your grids.
    For example if you want 2 columns you should use 2 divs with the classes w6 on them, and latest on the last column / div.
    Susy will map those classes to the column calculations.
    classes to your disposal **(w1, w2, w3, w4, w5, w6 ,w7, w8, w9, w10, w11, w12, latest, container, clearfix, pie-clearfix)**.

        <!-- 2 cols -->
        <div class="container (clearfix) (pie-clearfix)">
          <div class="w6"></div>
          <div class="w6 latest"></div>
        </div>

        <!-- 3 cols -->
        <div class="container (clearfix) (pie-clearfix)">
          <div class="w4"></div>
          <div class="w4"></div>
          <div class="w4 latest"></div>
        </div>

        <!-- 4 cols -->
        <div class="container (clearfix) (pie-clearfix)">
          <div class="w3"></div>
          <div class="w3"></div>
          <div class="w3"></div>
          <div class="w3 latest"></div>
        </div>

        <!-- 6 cols -->
        <div class="container (clearfix) (pie-clearfix)">
          <div class="w2"></div>
          <div class="w2"></div>
          <div class="w2"></div>
          <div class="w2"></div>
          <div class="w2"></div>
          <div class="w2 latest"></div>
        </div>

### 4.1.5 Gems included

  * **susy** for grid calculations [doc](http://susy.oddbird.net/)

    susy has a great set of mixins and functions for making and calculating grid columns

  * **compass-h5bp** for normalizing and helpers [source](https://github.com/sporkd/compass-h5bp)

    In base.scss you will find the mixins that do all the normalisation work. The helpers are (.ir .hidden .visuallyhidden .invisible .clearfix)

        +h5bp-normalize
        +h5bp-helpers

  * **ceaser-easing** transitions and easing [source](https://github.com/jhardy/compass-ceaser-easing)

    You can easaly create transitions with this gem

        @include ceaser-transition(width, 500ms, $easeInOutExpo, 1s);

  * **sass globbing for components [source](https://github.com/chriseppstein/sass-globbing)**

    On the omega branches you will encounter the rule in styles.scss **@import "component/**/*";**.
    This is a globbing rule. <br>
    Since components are independent it does not matter in what order they are compiled into syle.css
    The order they are compiled though is alphabetically. **This has one great advantage.**
    When you add a component file it is directly compiled in styles.css

  * **breakpoint [source](https://github.com/team-sass/breakpoint)**

    Breakpoint makes writing media queries in Sass super simple.
    It's just a little extra helper that let's you configure your breakpoints in variables and then push them into mixinis that handle you configuration (see state.scss and /lib/var.scss)
