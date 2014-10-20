module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  # Project configuration.
  grunt.initConfig
    compass:
      app:
        options:
          specify: 'assets/sass/styles.sass',
          bundleExec: true
          require: ['compass-h5bp', 'rgbapng', 'ceaser-easing', 'susy', 'sass-globbing']
          httpPath: '/'
          sassDir: 'assets/sass'
          cssDir: 'assets/css'
          imagesDir: 'assets/img'
          fontsDir: 'assets/font'
          relativeAssets: true
          debugInfo: true
          outputStyle: 'expanded'
          noLineComments: true
          raw: 'preferred_syntax = :sass\n'

      deploy:
        options:
          specify: 'assets/sass/styles.sass',
          bundleExec: true
          require: ['compass-h5bp', 'rgbapng', 'ceaser-easing', 'susy', 'sass-globbing']
          httpPath: '/'
          sassDir: 'assets/sass'
          cssDir: 'assets/css'
          imagesDir: 'assets/img'
          fontsDir: 'assets/font'
          relativeAssets: true
          outputStyle: 'compressed'
          noLineComments: true
          raw: 'preferred_syntax = :sass\n'

    jshint:
      app:
        options:
          jshintrc: true
        files:
          src: 'assets/js/*.js'

    uglify:
      options:
        sourceMap: true
      build:
        files: [
          expand: true,
          cwd: 'assets/js/',
          src: '**/*.js',
          dest: 'assets/js/',
          ext: '.min.js',
          extDot: 'first'
        ]

    imagemin:
      dist:
        options:
          optimizationLevel: 3
        files: [
            expand: true,
            cwd: "assets/img/"
            src: "**/*.{png,jpg,jpeg}"
            dest: "assets/img/"
        ]

    watch:
      options:
        atBegin: true
        interrupt: false
        spawn: false
      js:
        files: ['assets/js/**/*.js']
        tasks: ['jshint', 'uglify']
      sass:
        files: ['assets/sass/**/*.sass']
        tasks: ['compass:app']

  # Default task.
  grunt.registerTask 'default', [
    'compass:app'
    'jshint'
    'uglify'
  ]

  # deploy
  grunt.registerTask 'deploy', [
    'compass:deploy'
    'jshint'
    'uglify'
    'imagemin'
  ]
