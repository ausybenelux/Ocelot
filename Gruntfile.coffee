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

    coffee:
      app:
        options:
          sourceMap: true
          bare: true
          join: true
        files:
          'assets/js/base.js': ['assets/coffee/**/*.coffee']

    jshint:
      app:
        options:
          boss: true
          expr: true
          eqnull: true
        files:
          src: 'assets/js/*.js'

    uglify:
      app:
        options:
          sourceMap: 'assets/js/base.js.map'
        files:
          'assets/js/base.min.js': ['assets/js/base.js']

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
      app:
        files: ['assets/coffee/**/*.coffee']
        tasks: ['coffee']
      sass:
        files: ['assets/sass/**/*.sass']
        tasks: ['compass:app']

  # Default task.
  grunt.registerTask 'default', [
    'compass:app'
    'coffee'
    'jshint'
  ]

  # deploy
  grunt.registerTask 'deploy', [
    'compass:deploy'
    'coffee'
    'jshint'
    'uglify'
    'imagemin'
  ]
