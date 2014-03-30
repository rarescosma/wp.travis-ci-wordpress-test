module.exports = function(grunt) {

  // Load tasks
  grunt.loadNpmTasks('grunt-shell');
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
    clean: {
      test: ['test/*.js', 'test/**/*.js']
    },
    shell: {
      test: {
        options: { stdout: true, failOnError: true },
        command: function(module, sub, test) {
          return 'mocha-casperjs --casper-timeout=50000 test/*.coffee';
        }
      }
    }
  });

  // Dynamic alias
  grunt.registerTask('test', function() {
    var args = Array.prototype.slice.call(arguments);
    args.unshift(''); // for the first ':'

    grunt.task.run.apply(grunt.task, ['shell:test' + args.join(':')]);
  });

  grunt.registerTask('default', ['test']);
};
