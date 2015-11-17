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

// Sass
var sass = require("gulp-sass");
var sassGlob = require('gulp-sass-glob');
var jsonImporter = require('node-sass-json-importer');
var prefix = require("gulp-autoprefixer");
var sourcemaps = require("gulp-sourcemaps");
var mincss = require("gulp-minify-css");
var scsslint = require('gulp-scss-lint');

// JS
var jshint = require("gulp-jshint");
var uglify = require('gulp-uglify');

// Load Ocelot configuration file
var config = require("./ocelot.config.json");

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
// JS HINT -- https://www.npmjs.com/package/gulp-jshint
// -----------------------------------------------------------------------------

gulp.task("jshint", "Scans your JS files for errors", function() {
  return gulp.src(config.path.js + "/*.js")
    .pipe(jshint())
    .pipe(jshint.reporter("jshint-stylish"));
});

// -----------------------------------------------------------------------------
// JS UGLIFY -- https://www.npmjs.com/package/gulp-uglify
// -----------------------------------------------------------------------------

gulp.task("uglify", "Compress your base.js code to a minified version", function() {
  return gulp.src([config.path.js + "/*.js","!" + config.path.js + "/*.min.js"])
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
// SASS -- https://www.npmjs.com/package/gulp-sass
// SASS GLOBBING -- https://www.npmjs.com/package/gulp-sass-glob
// -----------------------------------------------------------------------------

gulp.task("sass", "Compiles your SCSS files to CSS", function () {
  return gulp.src(config.path.scss)
    .pipe(sourcemaps.init())
    .pipe(sassGlob())
    .pipe(sass({
      includePaths: [
        require("node-bourbon").includePaths,
        require("node-neat").includePaths[1],
        require("node-normalize-scss").includePaths,
        config.path.bower + config.path.fontAwesome
      ],
      importer: jsonImporter,
      outputStyle: config.sass.style
    }))
    .on("error", function (err) {
      gutil.log(gutil.colors.black.bgRed(" SASS ERROR", gutil.colors.red.bgBlack(" " + (err.message.split("  ")[2]))));
      gutil.log(gutil.colors.black.bgRed(" FILE:", gutil.colors.red.bgBlack(" " + (err.message.split("\n")[0]))));
      gutil.log(gutil.colors.black.bgRed(" LINE:", gutil.colors.red.bgBlack(" " + err.line)));
      gutil.log(gutil.colors.black.bgRed(" COLUMN:", gutil.colors.red.bgBlack(" " + err.column)));
      return this.emit("end");
    })
    .pipe(prefix(config.autoprefixer))
    .pipe(mincss())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(config.path.css))
    .pipe(browserSync.stream());
});

// -----------------------------------------------------------------------------
// SCSS LINT -- https://www.npmjs.com/package/gulp-scss-lint
// -----------------------------------------------------------------------------

gulp.task("scss-lint", "Scans your SCSS files for errors", function() {
  gulp.src(config.path.scss)
    .pipe(scsslint());
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

gulp.task("watch", "Watches your SASS files", function() {
  gulp.watch(config.path.scss, ["sass"]);
});

// -----------------------------------------------------------------------------
// DEFAULT TASK
// -----------------------------------------------------------------------------

gulp.task("default", [
  "help",
  "sass",
  "scss-lint",
  "jshint",
  "watch"
]);
