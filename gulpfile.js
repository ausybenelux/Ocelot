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

// Sass
var sass = require("gulp-sass");
var prefix = require("gulp-autoprefixer");
var sourcemaps = require("gulp-sourcemaps");
var mincss = require("gulp-minify-css");
var scsslint = require('gulp-scss-lint');

// JS
var jshint = require("gulp-jshint");

// Load Ocelot configuration file
var config = require("./ocelot.config.json");

// -----------------------------------------------------------------------------
// JS HINT
// -----------------------------------------------------------------------------

gulp.task("jshint", "Scans your JS files for errors", function() {
  return gulp.src(config.path.js)
    .pipe(jshint())
    .pipe(jshint.reporter("jshint-stylish"));
});

// -----------------------------------------------------------------------------
// SASS
// -----------------------------------------------------------------------------

gulp.task("sass", "Compiling the shit out of it!", function () {
  return gulp.src(config.path.scss)
    .pipe(sourcemaps.init())
    .pipe(sass({
      includePaths: [
        require("node-bourbon").includePaths,
        require("node-neat").includePaths[1],
        require("node-normalize-scss").includePaths,
        config.path.bower + config.path.fontAwesome
      ],
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

gulp.task("scss-lint", "Scans your SCSS files for errors", function() {
  gulp.src(config.path.scss)
    .pipe(scsslint());
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

gulp.task("watch", "I'm watchng you're sass files!", function() {
  gulp.watch(config.path.scss, ["sass"]);
});

// -----------------------------------------------------------------------------
// DEFAULT TASK
// -----------------------------------------------------------------------------

gulp.task("default", ["help"]);
