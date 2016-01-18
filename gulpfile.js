//    ______   __    __  __        _______
//   /      \ /  |  /  |/  |      /       \
//  /$$$$$$  |$$ |  $$ |$$ |      $$$$$$$  |
//  $$ | _$$/ $$ |  $$ |$$ |      $$ |__$$ |
//  $$ |/    |$$ |  $$ |$$ |      $$    $$/
//  $$ |$$$$ |$$ |  $$ |$$ |      $$$$$$$/
//  $$ \__$$ |$$ \__$$ |$$ |_____ $$ |
//  $$    $$/ $$    $$/ $$       |$$ |
//   $$$$$$/   $$$$$$/  $$$$$$$$/ $$/
//

// Gulp and some tools
var gulp = require("gulp-help")(require("gulp"));
var gutil = require("gulp-util");
var chalk = require("chalk");
var browserSync = require('browser-sync').create();
var modernizr = require('gulp-modernizr');
var rename = require("gulp-rename");
var gulpSequence = require('gulp-sequence');

// JS
var browserify = require('gulp-browserify');
var jshint = require("gulp-jshint");
var uglify = require('gulp-uglify');

// Load configuration file
var config = require("./config.json");

// Favicons
var favicons = require('favicons');

// Error Callback
var errorCallBack = function (error, metadata) {
  if (error) {
    // throw error;
    console.log(error);
  }

  console.log(metadata, 'Metadata produced during the build process');
}

// -----------------------------------------------------------------------------
// BROWSERIFY -- https://www.npmjs.com/package/gulp-browserify
// -----------------------------------------------------------------------------

gulp.task("browserify", "Browserify lets you require('modules') in the browser by bundling up all of your dependencies.", function() {
  // Single entry point to browserify
  return gulp.src(config.path.js + "/base.js", {read: false})
      .pipe(browserify({
        insertGlobals : true,
        transform: ['require-globify']
      }))
      .pipe(rename("app.js"))
      .pipe(gulp.dest(config.path.js))
});

// -----------------------------------------------------------------------------
// JS HINT -- https://www.npmjs.com/package/gulp-jshint
// -----------------------------------------------------------------------------

gulp.task("jshint", "Scans your JS files for errors", function() {
  return gulp.src([config.path.js + "/behaviors/*.js", config.path.js + "/modules/*.js", config.path.js + "/base.js"])
    .pipe(jshint())
    .pipe(jshint.reporter("jshint-stylish"));
});

// -----------------------------------------------------------------------------
// JS UGLIFY -- https://www.npmjs.com/package/gulp-uglify
// -----------------------------------------------------------------------------

gulp.task("uglify", "Compress your app.js code to a minified version", function() {
  return gulp.src(config.path.js + "/app.js")
    .pipe(uglify())
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest(config.path.js));
});

// -----------------------------------------------------------------------------
// FAVICONS -- https://github.com/haydenbleasel/favicons
// -----------------------------------------------------------------------------

gulp.task("favicons", "Generates cross-device favicons from assets/img/logo/favicon.png", function() {
  return favicons(config.favicons, errorCallBack);
});


// -----------------------------------------------------------------------------
// MODERNIZR -- https://www.npmjs.com/package/gulp-modernizr
// -----------------------------------------------------------------------------

gulp.task("modernizr", "Build custom Modernizr file", function() {
  gulp.src(config.path.js + "/*.js")
    .pipe(modernizr(config.modernizr))
    .pipe(gulp.dest(config.path.js + "/vendor/"))
    .pipe(uglify())
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest(config.path.js + "/vendor/"))
});

// -----------------------------------------------------------------------------
// BROWSERSYNC -- http://www.browsersync.io/docs/gulp/
// -----------------------------------------------------------------------------

gulp.task("browser-sync", "Set up a server with BrowserSync and test across devices", function() {
  browserSync.init({
    proxy: "project.local"
  });
});

// -----------------------------------------------------------------------------
// WATCH
// -----------------------------------------------------------------------------

gulp.task("watch", "Watches your files", function() {
  gulp.watch([config.path.js + "/behaviors/*.js", config.path.js + "/modules/*.js", config.path.js + "/base.js"], ["browserify"]);
});

// -----------------------------------------------------------------------------
// DEFAULT TASK
// -----------------------------------------------------------------------------

gulp.task("default", gulpSequence(
    "install",
    "compile",
    "lint",
    "improve",
    "serve"
  )
);

gulp.task("install", [
  "help"
  //here should be an install task
]);

gulp.task("compile", [
  "browserify"
]);

gulp.task("lint", [
  "jshint"
]);

gulp.task("improve", [
  "uglify"
]);

gulp.task("serve", [
  "watch",
  "browser-sync"
]);
