import gulp from 'gulp';
import sound from 'sounds';
import web from 'web';
import cg from 'cg';

const $ = gulpLoadPlugins();


gulp.task('core', () => {
  // Internet SKill/Presentation
  gulp.src('curriculum/creator/core/**')
  .pipe(gulp.dest('youre/future'));
});

gulp.task('image', () => {
  // Photoshop
  gulp.src('curriculum/creator/image/photoshop')
  .pipe(gulp.dest('youre/future'));
});


gulp.task('web+dtp', ['image','core'], () => {
  // HTML5/CSS3/JavaScript
  gulp.src('curriculum/creator/web_dtp/**')
  .pipe(gulp.dest('youre/future'));
});

gulp.task('dtm+pa', ['core'], () => {
  // DTM/Protools/Recording/Sound Creation
  gulp.src('curriculum/creator/sounds/**')
  .pipe(gulp.dest('youre/future'));
});

gulp.task('cg+vfx', ['core','image'], () => {
  // 3DCG/2D to 3D Convertion/VFX/Projection Mapping
  gulp.src('curriculum/creator/cg_vfx/**')
  .pipe(gulp.dest('youre/future'));
});

gulp.task('build', () => {
  alert("Prease Build Your Future!")
});
