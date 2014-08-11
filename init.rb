require 'rubygems'
require 'watir'
require 'watir-webdriver'

def login(b)
  puts 'User name: '
  b.text_field(:id => 'username').set gets.strip
  puts 'Password: '
  b.text_field(:id => 'password').set gets.strip

  b.button(:name => 'submit').click
end

classes = ['86233']

b = Watir::Browser.new



b.goto 'https://banweb.banner.vt.edu/ssb/prod/twbkwbis.P_WWWLogin'
b.link(:text => 'Login to HokieSpa >>>').click

login(b)

if b.text.include? 'Account Recovery Action Required'
  b.link(:text => 'Not Now').click
end

b.link(:text => 'Hokie Spa').click

b.link(:text => 'Registration and Schedule').click

b.link(:text => 'Drop/Add').click

puts "attempting to add class"

begin
  classes.each_with_index do |name, index|
    b.text_field(:id => "crn_id#{index + 1}").set name
  end

  b.button(:value => 'Submit Changes').click
end while b.text.include? 'Registration Errors'


puts "Class added successfully"