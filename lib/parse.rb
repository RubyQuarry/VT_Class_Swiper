

def login(browser)
  browser.goto 'https://banweb.banner.vt.edu/ssb/prod/twbkwbis.P_WWWLogin'
  browser.link(:text => 'Login to HokieSpa >>>').click

  puts 'User name: '
  browser.text_field(:id => 'username').set gets.strip
  puts 'Password: '
  browser.text_field(:id => 'password').set gets.strip

  browser.button(:name => 'submit').click
end
