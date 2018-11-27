var gulp = require('gulp'); //default
var sass = require('gulp-sass');//sass complie
var concat = require('gulp-concat'); //compile js plugins into one file
var concatCss = require('gulp-concat-css');//compile css plugins into one file
var watch = require('gulp-watch'); //sass compile to css

gulp.task('sass', function () {
    return gulp.src('app/assets/scss/**/*.scss')
            .pipe(sass().on('error', sass.logError))
            .pipe(gulp.dest('app/assets/dist/css/'));
});
gulp.task('watch', function () {
    gulp.watch('app/assets/scss/**/*.scss', ['sass']);
});

/*
 * JS FILES COMPILE USING GULP CONCAT
 * ALL COMMON PLUGINS USE INTO THE TEMPLATE
 */
gulp.task('concat', function (){
    return gulp.src(
            [
                'app/assets/plugins/jquery/dist/jquery.min.js',
                'app/assets/plugins/jquery-ui/jquery-ui.min.js',
                'app/assets/plugins/bootstrap/js/bootstrap.bundle.min.js',
                'app/assets/plugins/sticky/jquery.sticky.js',
                'app/assets/plugins/preloader/jquery.preloader.min.js',
                'app/assets/plugins/smooth-scroll/smooth-scroll.min.js',
                'app/assets/plugins/magnific-popup/dist/jquery.magnific-popup.min.js',
                'app/assets/plugins/owl.carousel/owl.carousel.min.js',
                'app/assets/plugins/jarallax/dist/jarallax.min.js',
                'app/assets/plugins/jarallax/dist/jarallax-video.min.js',
                'app/assets/plugins/scrollreveal/scrollreveal.min.js',
                'app/assets/plugins/theia-sidebar/ResizeSensor.min.js',
                'app/assets/plugins/theia-sidebar/theia-sticky-sidebar.min.js'
            ])
            .pipe(concat('plugins.js'))
            .pipe(gulp.dest('app/assets/dist/js/'));
});

/*
 * Css plugins FILES COMPILE USING GULP CONCATCSS
 * ALL COMMON PLUGINS USE INTO THE TEMPLATE
 * If you don't want to use these compiles
 * include separate plugins file Into top <head> tag
 * Like this
 * <link href="css/animate.css" rel="stylesheet">
 * <link href="lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
 * <link href="lib/swiper-carousel/css/swiper.min.css" rel="stylesheet">
 * <link href="lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
 * <link href="lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
 */
gulp.task('concatCss', function () {
    return gulp.src([
        'app/assets/plugins/jquery-ui/jquery-ui.min.css',
        'app/assets/plugins/magnific-popup/dist/magnific-popup.css',
        'app/assets/plugins/owl.carousel/assets/owl.carousel.min.css',
        'app/assets/plugins/owl.carousel/assets/owl.theme.default.min.css',
        'app/assets/plugins/bootstrap/css/bootstrap.min.css'
    ])
            .pipe(concatCss("plugins.css"))
            .pipe(gulp.dest('app/assets/dist/css/'));
});