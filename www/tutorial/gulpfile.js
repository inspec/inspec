var gulp = require('gulp'),
    debug = require('gulp-debug'),
    webpack = require('gulp-webpack'),
    coffee = require('gulp-coffee'),
    gutil = require('gulp-util'),
    gif = require('gulp-if'),
    gcopy = require('gulp-copy'),
    useref = require('gulp-useref'),
    gulpif = require('gulp-if'),
    uglify = require('gulp-uglify'),
    minifyCss = require('gulp-clean-css');

gulp.task('webpack', function() {
  return gulp.src('app/main.ts')
    .pipe(webpack( require('./config/webpack.config.js') ))
    .pipe(gulp.dest('dist/'));
})

gulp.task('copy', function(){
  gulp.src([
      '*.png',
      'app/**/*.{css,html,json}',
      'app/responses/**/*',
      'tutorial_files/**',
    ])
    .pipe(gcopy('dist/'));
  gulp.src(
    'assets/font-awesome/{css,font}/*')
    .pipe(gcopy('dist/', { prefix: 2 }));
})

gulp.task('build', ['webpack', 'copy'], function(){
  return gulp.src('index.html')
    .pipe(useref())
    .pipe(debug({ title: 'Uglify scripts' }))
    .pipe(gulpif('*.js', uglify()))
    .pipe(debug({ title: 'Squash css' }))
    .pipe(gulpif('*.css', minifyCss()))
    .pipe(gulp.dest('dist'));
})
