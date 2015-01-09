module.exports = (grunt) ->
  require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks);

  # get the theme from the command
  if grunt.option('theme')
    theme = "#{grunt.option('theme')}/" || ""

  # PROJECT CONFIGURATION.
  grunt.initConfig
    settings:
      base: ""
      theme: theme
      # BASE
      # can be node's __dirname, or reference to deeper directory (when this gruntfile sits on the root of the projects)
      # EMPTY STRING when gruntfile sits in the THEME folder

      # THEME
      # This is a parrameter that lets you compile multiple themes grunt --theme="subtheme/theme" or grunt --theme="subtheme/othertheme"
      # EMPTY STRING when gruntfile sits in the THEME folder
      # of course the theme must be based upon the boilerplate

    compass:
      app:
        options:
          specify: "<%= settings.base %><%= settings.theme %>assets/scss/styles.scss",
          sassDir: "<%= settings.base %><%= settings.theme %>assets/scss"
          cssDir: "<%= settings.base %><%= settings.theme %>assets/css"
          imagesDir: "<%= settings.base %><%= settings.theme %>assets/img"
          fontsDir: "<%= settings.base %><%= settings.theme %>assets/font"
          require: ["compass-h5bp", "rgbapng", "ceaser-easing", "susy", "sass-globbing"]
          httpPath: "/"
          bundleExec: true
          relativeAssets: true
          sourcemap: true
          noLineComments: true
          outputStyle: "expanded"
          raw: "preferred_syntax = :scss\n"

      deploy:
        options:
          specify: "<%= settings.base %><%= settings.theme %>assets/scss/styles.scss",
          sassDir: "<%= settings.base %><%= settings.theme %>assets/scss"
          cssDir: "<%= settings.base %><%= settings.theme %>assets/css"
          imagesDir: "<%= settings.base %><%= settings.theme %>assets/img"
          fontsDir: "<%= settings.base %><%= settings.theme %>assets/font"
          require: ["compass-h5bp", "rgbapng", "ceaser-easing", "susy", "sass-globbing"]
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
        config: "scsslint.yml"
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
          src: "**/*.js",
          dest: "<%= settings.base %><%= settings.theme %>assets/js/",
          ext: ".min.js",
          extDot: "first"
        ]
      own:
        files: [
          expand: true,
          cwd: "<%= settings.base %><%= settings.theme %>assets/js/",
          src: "*.js",
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
      js:
        files: ["<%= settings.base %><%= settings.theme %>assets/js/*.js"]
        tasks: ["jshint", "uglify:own"]
      scss:
        files: ["<%= settings.base %><%= settings.theme %>assets/scss/**/*.scss"]
        tasks: ["compass:app", "scsslint"]

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
