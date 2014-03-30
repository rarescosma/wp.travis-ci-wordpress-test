describe "The Login Page", ->
  before ->
    casper.start 'http://wp.l/wp-admin/'

  it 'displays the login form', ->
    casper.then ->
      '#user_login'.should.be.inDOM

  it 'redirects to dashboard on successful login', ->
    casper.fill '#loginform', {
      log: 'admin',
      pwd: 'p'
    }

    casper.click '#wp-submit'

    casper.then ->
      (/Dashboard/).should.matchTitle