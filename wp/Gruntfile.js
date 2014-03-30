// TODO - watcher/tdd
module.exports = function(grunt) {

  // Load tasks
  grunt.loadNpmTasks('grunt-shell');
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
    clean: {
      test: ['test/*.js', 'test/**/*.js']
    },
    // watch: {
    //   test: {
    //     options: { spawn: false },
    //     files: ['test/*.coffee', 'test/**/*.coffee'],
    //     tasks: ['clear', 'test']
    //   }
    // },
    shell: {
      test: {
        options: { stdout: true, failOnError: true },
        command: function(module, sub, test) {
          var wild = function(what) {
            if('undefined' === typeof what) {
              return '*';
            }
            return what;
          };

          command = 'mocha-casperjs --casper-timeout=50000 ';
          path = 'test/' + wild(module) + '/' + wild(sub) + '/' + wild(test) + '.coffee';

          return command + path;
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

  // grunt.registerTask('tdd', function(module, sub) {
  //   var tasks = ['clear', 'clean', 'test', 'watch:test'];
  //   grunt.option('force', true);
  //   grunt.task.run(tasks);
  // });
};
