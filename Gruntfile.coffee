module.exports = (grunt) ->
  require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks);

  # PROJECT CONFIGURATION.
  grunt.initConfig
    settings:
      base: ""
      # can be node's __dirname, or reference to deeper directory (when this gruntfile sits on the root of the projects)
      # EMPTY STRING when gruntfile sits in the THEME folder

    compass:
      app:
        options:
          specify: ["<%= settings.base %>assets/scss/styles.scss", "<%= settings.base %>assets/scss/drupal/**/*.scss"],
          bundleExec: true
          require: ["compass-h5bp", "rgbapng", "ceaser-easing", "susy", "sass-globbing"]
          httpPath: "/"
          sassDir: "<%= settings.base %>assets/scss"
          cssDir: "<%= settings.base %>assets/css"
          imagesDir: "<%= settings.base %>assets/img"
          fontsDir: "<%= settings.base %>assets/font"
          relativeAssets: true
          debugInfo: true
          outputStyle: "expanded"
          noLineComments: true
          raw: "preferred_syntax = :scss\n"

      deploy:
        options:
          specify: ["<%= settings.base %>assets/scss/styles.scss", "<%= settings.base %>assets/scss/drupal/**/*.scss"],
          bundleExec: true
          require: ["compass-h5bp", "rgbapng", "ceaser-easing", "susy", "sass-globbing"]
          httpPath: "/"
          sassDir: "<%= settings.base %>assets/scss"
          cssDir: "<%= settings.base %>assets/css"
          imagesDir: "<%= settings.base %>assets/img"
          fontsDir: "<%= settings.base %>assets/font"
          relativeAssets: true
          outputStyle: "compressed"
          noLineComments: true
          raw: "preferred_syntax = :scss\n"

    jshint:
      app:
        options:
          jshintrc: true
        files:
          src: "<%= settings.base %>assets/js/*.js"

    uglify:
      # options:
      #   sourceMap: true
      all:
        files: [
          expand: true,
          cwd: "<%= settings.base %>assets/js/",
          src: "**/*.js",
          dest: "<%= settings.base %>assets/js/",
          ext: ".min.js",
          extDot: "first"
        ]
      own:
        files: [
          expand: true,
          cwd: "<%= settings.base %>assets/js/",
          src: "*.js",
          dest: "<%= settings.base %>assets/js/",
          ext: ".min.js",
          extDot: "first"
        ]

    imagemin:
      dist:
        options:
          optimizationLevel: 3
        files: [
            expand: true,
            cwd: "<%= settings.base %>assets/img/"
            src: "**/*.{png,jpg,jpeg}"
            dest: "<%= settings.base %>assets/img/"
        ]

    watch:
      options:
        atBegin: true
        interrupt: false
        spawn: false
      js:
        files: ["<%= settings.base %>assets/js/**/*.js"]
        tasks: ["jshint", "uglify:own"]
      scss:
        files: ["<%= settings.base %>assets/scss/**/*.scss"]
        tasks: ["compass:app"]

  # DEFAULT TASK.
  grunt.registerTask "default", [
    "compass:app"
    "jshint"
    "uglify:own"
  ]


  # DEPLOY
  grunt.registerTask "deploy", [
    "compass:deploy"
    "jshint"
    "uglify:all"
    "imagemin"
  ]
