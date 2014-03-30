describe "The Login Page", ->
  before ->
    casper.start 'http://wp.l/wp-admin/'

  it 'displays the login form', ->
    casper.then ->
      '#user_login'.should.be.inDOM
