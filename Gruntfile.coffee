module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  # Project configuration.
  grunt.initConfig
    vendorlibs:[
      'assets/js/vendor/respond.js'
      'assets/js/vendor/underscore.js'
      'assets/js/base.js'
    ]

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

    concat:
      options:
        stripBanners: true
      dist:
        src: '<%= vendorlibs %>'
        dest: 'assets/js/main.js'

    uglify:
      app:
        options:
          sourceMap: 'assets/js/app.js.map'
        files:
          'assets/js/app.min.js': ['assets/js/app.js']

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
        files: ['assets/sass/**/*.sass', '!assets/sass/lib/**']
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
    'concat'
    'uglify'
    'imagemin'
  ]
