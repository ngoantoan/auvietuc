module.exports = function (grunt) {
    'use strict';

    grunt.initConfig({

        watch: {
            sass: {
                files: ['scss/**.scss','js/**.js'],
                tasks: ['concat:scss', 'sass', 'cssmin:mycss', 'uglify:myjs'],
                options: {
                    spawn: false,
                },
            },
        },
        concat: {
            options: {

            },
            scss: {
                src: ['scss/**.scss'],
                dest: 'concat/main.concat.scss',
            },
            css: {
                src: ['css_libs/**.css'],
                dest: 'concat/main.concat.css',
            },
            js: {
                src: ['js_libs/**.js', '!js_raw/myJS.js'],
                dest: 'concat/main.concat.js',
            },
        },

        sass: {
            options: {
                sourceMap: true
            },
            dist: {
                files: {
                    'css/mycss.css': 'concat/main.concat.scss'
                }
            }
        },
        uglify: {
            options: {
                mangle: false,
                sourceMap: false,
                sourceMapIncludeSources: false,
            },
            mainjs: {
                files: {
                    'js/main.min.js': ['concat/main.concat.js']
                }
            },

            myjs: {
                files: {
                    'js/myjs.min.js': ['js/myjs.js']
                }
            }
        },
        cssmin: {
            options: {
                keepSpecialComments: 0
            },
            css: {
                files: [{
                    expand: true,
                    cwd: 'concat',
                    src: 'main.concat.css',
                    dest: 'css',
                    ext: '.min.css'
                }]
            },
            mycss: {
                files: [{
                    expand: true,
                    cwd: 'css',
                    src: 'mycss.css',
                    dest: 'css',
                    ext: '.min.css'
                }]
            }

        },
    });
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');


    grunt.registerTask('dev', ['concat:scss', 'sass', 'cssmin:mycss', 'uglify:myjs', 'watch']);
    grunt.registerTask('default', ['concat:scss', 'concat:css', 'concat:js', 'uglify', 'sass', 'cssmin']);
}
