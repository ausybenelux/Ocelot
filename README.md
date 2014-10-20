drupal-theme-boilerplate
========================

A base theme implementation for drupal theming that Follows [http://smacss.com/](smacss) specs.<br>

### Requirements:

  * [nodejs](http://nodejs.org) trough: website, nvm or brew
  * npm *comes with node, no installation needed*
    * `brew install node`
    * [pkg](http://nodejs.org/dist/v0.10.29/node-v0.10.29.pkg)
    * [nvm](https://github.com/creationix/nvm)

  * [grunt](http://gruntjs.com/)
    * `npm install -g grunt-cli`
  * clone this repo
    * `git@github.com:rob-bar/drupal-theme-boilerplate.git`

### Installation procedure:

When you have never worked on this project before you must go trough some basic installation steps.
So 4 important files that will keep this project isolated from developer specific configuration,
so no one compiles with the wrong version of a gem file.

    * .ruby-gemset
    * .ruby-version
    * Gemfile
    * Gemfile.lock

#### install rvm
  * If you don't have **RVM** you must install it

`curl -sSL https://get.rvm.io | bash`

#### install correct ruby version

  * When you browse to the theme folder, the .ruby-version file checks if you have the proper ruby version installed. If you don't rvm will prompt you with the command(**rvm install ruby-2.0.0-p481**) to run and to install the right ruby version, this can take some time.

output when you browse to the folder:

    `ruby-2.0.0-p481 is not installed.`
    `To install do: 'rvm install ruby-2.0.0-p481'`

#### setup the gemset to use

  * When you successfully installed this ruby version, you can do 2 things:

    * cd out and in the folder again, this will create the gemset crosscheck_theme for you, <br>
    **with this gemset the project it's gems are isolated, this is the same for every developer that works on this theme project.**

    * you can also create and use the gemset yourself by doing
    `rvm gemset create crosscheck_theme && rvm gemset use crosscheck_theme`
    **the crosscheck_theme name can not be altered**

output:<br>

    ruby-2.0.0-p481 - #gemset created /Users/USERNAME/.rvm/gems/ruby-2.0.0-p481@crosscheck_theme
    ruby-2.0.0-p481 - #generating crosscheck_theme wrappers - please wait

#### install gems from Gemfile to gemset

  * This means the gemset is created and is being used.
  The final step is to install all the gems that are specified in the Gemfile so your gemset is complete.
  When you created the gemset bundle was included in the gemset.

run the command<br>
**bundle install**<br>
output:

    Fetching gem metadata from https://rubygems.org/...........
    Fetching additional metadata from https://rubygems.org/..
    Using rake 10.3.2
    Using sass 3.3.7
    Using chunky_png 1.3.1
    Using multi_json 1.10.1
    Using compass-core 1.0.0.alpha.19
    Using compass-import-once 1.0.4
    Installing json 1.8.1
    Using rb-fsevent 0.9.4
    Installing ffi 1.9.3
    Installing rb-inotify 0.9.4
    Installing rb-kqueue 0.2.2
    Installing listen 1.1.6
    Installing compass 1.0.0.alpha.19
    Installing sassy-maps 0.3.2
    Using breakpoint 2.4.2
    Installing ceaser-easing 0.7
    Installing compass-h5bp 0.1.2
    Installing compass-rgbapng 0.2.1
    Installing sass-globbing 1.1.1
    Installing susy 2.1.2
    Using bundler 1.6.2
    Your bundle is complete!
    Use `bundle show [gemname]` to see where a bundled gem is installed.
    Post-install message from compass:
        Compass is charityware. If you love it, please donate on our behalf at http://umdf.org/compass Thanks!

#### extra gem, rvm, bundle related commands
Here are some extra commands that you can run for easier understanding gemsets, gems and rvm.

  * rvm list (displays all installed ruby versions)
  * gem list (displays all local gems installed in gemset)
  * rvm gemset list (displays all gemsets for current folder/ruby install)
  * rvm gemset help (displays help commands)
  * rvm help (displays help commands)
  * gem help commands (displays all the commands available for gem)

#### install npm packages with node

This will download the npm packages that are specified in the package.json file.
In this project mainly grunt plugins and grunt itself.

  * run: `npm install;`
  * additionaly you can try : `npm help;` for more information

## Compiling and building procedure

  * `grunt watch` *([grunt](http://gruntjs.com/) watches all files described in watch task)*
  * `grunt watch:sass` *(watches all .sass files)*
  * `grunt` *(executes default grunt task compass:app, coffee, jshint)*
  * `grunt deploy` *(executes deploy grunt task compass:deploy, coffee, jshint, concat, uglify, imagemin)*

### General theme Structure:
  * templates/
  * crosscheck_theme.info
  * Gemfile
  * Gemfile.lock
  * Gruntfile.coffee
  * package.json
  * template.php
  * .gitignore
  * .jshintrc
  * .ruby-gemset
  * .ruby-version
  * assets/
    * coffee/
    * css/
    * font/
    * img/
    * js/
    * sass/

### Extra information
  * On the master branch recommended use of
    **coffeescript** over **javascript**, checkout [http://coffeescript.org/](coffeescript.org)
  * On master and omega_sass branch recommended use of **.sass** syntax over **.scss** syntax
  * On omega_scss branch recommended use of **.scss** syntax over **.sass** syntax
  * img structure can be altered but is recommended
  * you can use svg for logo's and icons
  * font folder should contain webfonts `.TTF, .EOT, .WOFF, .SVG`

## Structure in depth

#### general

* All compiled files and assets sit in the assets/ folder, like that this remains isolated and does not get cluttered between templates and php files.

* All configuration files like (.jshintrc, .ruby-gemset, .ruby-version, config.rb, Gemfile, Gemfile.lock, crosscheck_theme.info) are located in the root of the theme directory, all added config options should be located in the root of the theme.

* The rest of the files are files that drupal needs to make the theme.

* The assets folder holds: css(compiled css **always styles.css**), images (**all the images**), js (**/lib /vendor and base.js**), sass or scss files(these are all the scss files organized and ready to compile to styles.css)

#### scss / sass & compass

The theme is structured the [smacss](https://smacss.com/) way.
What this means is that a certain structure is followed at directory and files level.

    + lib/
    base.sass
    fallback.sass
    layout.sass
    state.sass
    styles.sass

The goal of the theme is to let the files compile and do all the work and spit out a single file. (styles.css)

##### summary of the files

  * **styles.sass**

      This file can be used for general imports and structure,
      here you can alter the order of the way your files are compiled.
      this way you have control over what will be compiled and what won't be compiled into styles.css
      The styles file imports the gemfiles and lib files for use in base, layout components state or fallback

  * **lib/**

      The lib folder holds all the helper mixins, vars, grid, normalize files
      Basicly all the setup and helper files can be added in lib folder

  * **lib/var.sass**

      This file holds all the global variables, can be used for configuration or for making own variables

  * **lib/mixin.sass**

      This file holds all mixin helpers, if you make a mixin
      this is the place where you should add them

  * **base.sass**

      Here you can find the base styles of the theme, base styles are mainly html tag styles
      some minimal extra helper classes can also sit in this file

  * **layout.sass**

      Here you can find the layout styles of the theme, layout styles are styles for the main pictue,
      the bigger parts of the website can be styled here, in this file you can say for example where to put a component
      Region styles are also perfect for the layout.sass file

  * **component/** or components.sass

      Componnets are supose to be parts of the website that can live everywhere on the page, on every page.
      Styling of these components may not defer when they are moved to another container or place,
      this means that a component must always look the same in the website independent of its locationw.
      When components must look different depending on the place they are used that is where the layout.sass commes into place.
      In layout.sass you can define how a component must look in a specific location of div.
      Components can sit in one components.sass/scss file for small projects, but for larger projects it is recommended to use
      separate files and use sass globbing (see omega_sass and omega_scss files).

  * **state.sass**

    Here you can find the mediaqueries and responsive styling,
    anything that is styled for specific screen sizes must go in this file

  * **fallback.sass**

    This file is the crossbrowser file, all the fixes/styles made for specific browsers
    must go in this file


## Things to notice

General things you should know:

  * **Compilation debug lines**

    Because we compile to one css file it is handy to know when you are debugging in a browser inspector
    where that css line came from.

    @media -sass-debug-info{filename{font-family:file\:\/\/\/Users\/USERNAME\/Documents\/REPO\/drupal_grunt\/assets\/sass\/lib\/mixin\.sass}line{font-family:\00003176}}

    These lines are added in the css files so when you inspect in the browser you can go to the css file and check where the broken rule commes from. Handy!

  * **importance of order**

    As you know the importance of order is very crucial in css therefore the styles.sass file follows a stable flow of order.
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

    In state.sass/scss we have provided some **helper classes**.
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

## Gems included
  * **susy** for grid calculations [doc](http://susy.oddbird.net/)

    susy has a great set of mixins and functions for making and calculating grid columns

  * **compass-h5bp** for normalizing and helpers [source](https://github.com/sporkd/compass-h5bp)

    In base.sass you will find the mixins that do all the normalisation work. The helpers are (.ir .hidden .visuallyhidden .invisible .clearfix)

        +h5bp-normalize
        +h5bp-helpers

  * **ceaser-easing** transitions and easing [source](https://github.com/jhardy/compass-ceaser-easing)

    You can easaly create transitions with this gem

        @include ceaser-transition(width, 500ms, $easeInOutExpo, 1s);

  * **sass globbing for components [source](https://github.com/chriseppstein/sass-globbing)**

    On the omega branches you will encounter the rule in styles.sass **@import "component/**/*";**.
    This is a globbing rule. <br>
    Since components are independent it does not matter in what order they are compiled into syle.css
    The order they are compiled though is alphabetically. **This has one great advantage.**
    When you add a component file it is directly compiled in styles.css

  * **breakpoint [source](https://github.com/team-sass/breakpoint)**

    Breakpoint makes writing media queries in Sass super simple.
    It's just a little extra helper that let's you configure your breakpoints in variables and then push them into mixinis that handle you configuration (see state.sass and /lib/var.sass)
