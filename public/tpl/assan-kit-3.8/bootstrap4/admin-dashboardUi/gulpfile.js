var gulp = require('gulp'); //default
var sass = require('gulp-sass');//sass complie
var concat = require('gulp-concat'); //compile js plugins into one file
var concatCss = require('gulp-concat-css');//compile css plugins into one file
var watch = require('gulp-watch'); //sass compile to css

gulp.task('sass', function () {
    return gulp.src('html/scss/**/*.scss')
            .pipe(sass().on('error', sass.logError))
            .pipe(gulp.dest('html/css/'));
});
gulp.task('watch', function () {
    gulp.watch('html/scss/**/*.scss', ['sass']);
});

gulp.task('concat', function () {
    return gulp.src(
            [
                'html/lib/jquery/dist/jquery.min.js',
                'html/lib/bootstrap/dist/js/bootstrap.bundle.min.js',
                'html/js/pace.min.js',
                'html/js/jquery.easing.min.js',
                'html/lib/metismenu/dist/metisMenu.min.js',
                'html/js/jquery.slimscroll.min.js'
            ])
            .pipe(concat('plugins.js'))
            .pipe(gulp.dest('html/js/plugins/'));
});

gulp.task('concatCss', function () {
    return gulp.src([
        'html/lib/metisMenu/dist/metisMenu.min.css',
        'html/lib/animate/animate.min.css'
    ])
            .pipe(concatCss("plugins/plugins.css"))
            .pipe(gulp.dest('html/css/'));
});