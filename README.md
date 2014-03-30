travis-ci-wordpress-test
========================

Test your WordPress plug-ins and themes using Travis CI and node.js.

### Framework
The acceptance tests are run through PhantomJS, via the casper driver. Mocha provides the test DSL, and chai provides human readable assertions. Of course, all tests can be written in CoffeeScript.

The result is that your tests will read almost like natural English phrases. Check out [the sample test file](https://github.com/rarescosma/travis-ci-wordpress-test/blob/master/wp/test/login.coffee) and see for yourself.


[![Build Status](https://travis-ci.org/rarescosma/travis-ci-wordpress-test.svg?branch=master)](https://travis-ci.org/rarescosma/travis-ci-wordpress-test)