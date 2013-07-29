module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-growl');


  grunt.initConfig({

    jshint : {
      all: [
        'workspace/themes/active/js/main.js'
      ]
    },

    less: {
      dev: {
        files: {
          "workspace/themes/active/css/main.css": "workspace/themes/active/less/main.less"
        }
      },
      prod: {
        options: {
          yuicompress: true
        },
        files: {
          "workspace/themes/active/css/main.css": "workspace/themes/active/less/main.less"
        }
      }
    },

    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src : [
          'workspace/bootstrap/assets/js/jquery.js',
          'workspace/bootstrap/dist/js/bootstrap.min.js',
          'workspace/js/responsimage.js',
          'workspace/js/offcanvasmenu.js',
          'workspace/js/audio.js',
          'workspace/themes/active/js/main.js'],
        dest: 'workspace/themes/active/js/application.js'
      }
    },

    uglify: {
      options: {
        mangle: false
      },
      bootstrap: {
        files: {
          'workspace/themes/active/js/application.min.js': ['workspace/themes/active/js/application.js']
        }
      },
      jquery: {
        files: {
          'workspace/themes/active/js/jquery.min.js': ['workspace/bootstrap/assets/js/jquery.js']
        }
      }
    },

    watch: {
      cssdev: {
        files: '**/*.less',
        tasks: ['less:dev', 'growl:watch']
      },
      cssprod: {
        files: '<config:watch.cssdev.files>',
         tasks: ['less:prod', 'growl:watch']
      }
    },

    growl : {
      main : {
        title : 'Grunt.js',
        message : 'Grunt was run successfully!'
      },
      watch : {
        title : 'Grunt.js',
        message : 'Grunt is watching your files...'
      }
    }

});

// Main task
grunt.registerTask('cssdev', ['less:dev', 'growl:main']);
grunt.registerTask('cssprod', ['less:prod', 'growl:main']);
grunt.registerTask('jsprod', ['jshint', 'concat', 'uglify:bootstrap', 'uglify:jquery']);
grunt.registerTask('default', ['jshint', 'concat', 'uglify:bootstrap', 'uglify:jquery', 'less:prod', 'growl:main'])};
