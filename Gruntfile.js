module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-notify');


  grunt.initConfig({

    jshint : {
      all: [
        'workspace/assets/js/main.js'
      ]
    },

    less: {
      dev: {
        files: {
          "workspace/assets/css/main.css": "workspace/assets/less/main.less"
        }
      },
      prod: {
        options: {
          yuicompress: true
        },
        files: {
          "workspace/assets/css/main.css": "workspace/assets/less/main.less"
        }
      }
    },

    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src : [
          'workspace/assets/bootstrap/assets/js/jquery.js',
          'workspace/assets/bootstrap/dist/js/bootstrap.min.js',
          'workspace/assets/js/responsimage.js',
          'workspace/assets/js/main.js'],
        dest: 'workspace/assets/js/application.js'
      }
    },

    uglify: {
      options: {
        mangle: false
      },
      bootstrap: {
        files: {
          'workspace/assets/js/application.min.js': ['workspace/assets/js/application.js']
        }
      }
    },

    watch: {
      cssdev: {
        files: '**/*.less',
        tasks: ['less:dev']
      },
      cssprod: {
        files: '<config:watch.cssdev.files>',
         tasks: ['less:prod']
      }
    }

});

// Main task
grunt.registerTask('cssdev', ['less:dev']);
grunt.registerTask('cssprod', ['less:prod']);
grunt.registerTask('jsprod', ['jshint', 'concat', 'uglify:bootstrap']);
grunt.registerTask('default', ['jshint', 'concat', 'uglify:bootstrap', 'less:prod'])};
