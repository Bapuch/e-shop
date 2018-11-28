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
                'html/bower_components/jquery/dist/jquery.min.js',
                'html/bootstrap/dist/js/bootstrap.min.js',
                'html/js/jquery.easing.min.js',
                'html/bower_components/wow/dist/wow.min.js',
                'html/js/jquery.preloader.min.js',
                'html/bower_components/magnific-popup/dist/jquery.magnific-popup.min.js',
                'html/bower_components/jquery-knob/dist/jquery.knob.min.js',
                'html/bower_components/owl.carousel/dist/owl.carousel.min.js',
                'html/bower_components/jarallax/dist/jarallax.min.js',
                'html/bower_components/jarallax/dist/jarallax-video.min.js',
                'html/js/smooth-scroll.min.js'
            ])
            .pipe(concat('plugins.js'))
            .pipe(gulp.dest('html/js/plugins/'));
});

gulp.task('concatCss', function () {
    return gulp.src([
        'html/bower_components/font-awesome/css/font-awesome.min.css',
        'html/css/animate.css',
        'html/bower_components/magnific-popup/dist/magnific-popup.css',
        'html/bower_components/owl.carousel/dist/assets/owl.carousel.min.css',
        'html/bower_components/owl.carousel/dist/assets/owl.theme.default.min.css',
        'html/et-line-font/style.css',
        'html/bootstrap/dist/css/bootstrap.min.css'
    ])
            .pipe(concatCss("plugins/plugins.css"))
            .pipe(gulp.dest('html/css/'));
});