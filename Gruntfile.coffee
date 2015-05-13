module.exports = (grunt) ->
  require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks);

  # get the theme from the command
  if grunt.option('theme')
    theme = "#{grunt.option('theme')}/" || ""

  compile = grunt.option('force') || false

  # PROJECT CONFIGURATION.
  grunt.initConfig
    settings:
      base: ""
      theme: theme
      compile: compile
      # BASE
      # can be node's __dirname, or reference to deeper directory (when this gruntfile sits on the root of the projects)
      # EMPTY STRING when gruntfile sits in the THEME folder

      # THEME
      # This is a parrameter that lets you compile multiple themes grunt --theme="subtheme/theme" or grunt --theme="subtheme/othertheme"
      # EMPTY STRING when gruntfile sits in the THEME folder
      # of course the theme must be based upon the boilerplate

      # COMPILE
      # This is a parrameter that lets you force compile all the scss files in the theme
      # grunt --force=true

    compass:
      app:
        options:
          specify: ["<%= settings.base %><%= settings.theme %>assets/scss/**/*.scss"]
          sassDir: "<%= settings.base %><%= settings.theme %>assets/scss"
          cssDir: "<%= settings.base %><%= settings.theme %>assets/css"
          imagesDir: "<%= settings.base %><%= settings.theme %>assets/img"
          fontsDir: "<%= settings.base %><%= settings.theme %>assets/font"
          require: ["compass-h5bp", "rgbapng", "ceaser-easing", "susy", "sass-globbing", "font-awesome-sass", "breakpoint"]
          httpPath: "/"
          bundleExec: true
          relativeAssets: true
          sourcemap: true
          noLineComments: true
          outputStyle: "expanded"
          raw: "preferred_syntax = :scss\n"
          force: "<%= settings.compile %>"

      deploy:
        options:
          specify: ["<%= settings.base %><%= settings.theme %>assets/scss/**/*.scss"]
          sassDir: "<%= settings.base %><%= settings.theme %>assets/scss"
          cssDir: "<%= settings.base %><%= settings.theme %>assets/css"
          imagesDir: "<%= settings.base %><%= settings.theme %>assets/img"
          fontsDir: "<%= settings.base %><%= settings.theme %>assets/font"
          require: ["compass-h5bp", "rgbapng", "ceaser-easing", "susy", "sass-globbing", "font-awesome-sass", "breakpoint"]
          httpPath: "/"
          bundleExec: true
          sourcemap: true
          force: true
          relativeAssets: true
          noLineComments: true
          outputStyle: "compressed"
          raw: "preferred_syntax = :scss\n"

    scsslint:
      options:
        bundleExec: true
        config: ".scss-lint.yml"
        colorizeOutput: true
      allFiles: [
        "<%= settings.base %><%= settings.theme %>assets/scss/**/*.scss"
      ]

    jshint:
      app:
        options:
          jshintrc: true
        files:
          src: "<%= settings.base %><%= settings.theme %>assets/js/*.js"

    uglify:
      # options:
      #   sourceMap: true
      all:
        files: [
          expand: true,
          cwd: "<%= settings.base %><%= settings.theme %>assets/js/",
          src: [
            "**/*.js"
            "!**/*.min.js"
          ]
          dest: "<%= settings.base %><%= settings.theme %>assets/js/",
          ext: ".min.js",
          extDot: "first"
        ]
      own:
        files: [
          expand: true,
          cwd: "<%= settings.base %><%= settings.theme %>assets/js/",
          src: [
            "*.js"
            "!*.min.js"
          ]
          dest: "<%= settings.base %><%= settings.theme %>assets/js/",
          ext: ".min.js",
          extDot: "first"
        ]

    imagemin:
      dist:
        options:
          optimizationLevel: 3
        files: [
            expand: true,
            cwd: "<%= settings.base %><%= settings.theme %>assets/img/"
            src: "**/*.{png,jpg,jpeg}"
            dest: "<%= settings.base %><%= settings.theme %>assets/img/"
        ]

    watch:
      options:
        atBegin: true
        interrupt: false
        spawn: false
        # Set to `true` or set `livereload: 1337` to a port number to enable live reloading.
        # Default and recommended port is 35729.
        livereload: false
      js:
        files: ["<%= settings.base %><%= settings.theme %>assets/js/*.js"]
        tasks: ["jshint"]
      scss:
        files: ["<%= settings.base %><%= settings.theme %>assets/scss/**/*.scss"]
        tasks: ["compass:app"]

  # DEFAULT TASK.
  grunt.registerTask "default", [
    "compass:app"
    "scsslint"
    "jshint"
    "uglify:own"
  ]

  # DEPLOY
  grunt.registerTask "deploy", [
    "compass:deploy"
    "scsslint"
    "jshint"
    "uglify:all"
    "imagemin"
  ]
