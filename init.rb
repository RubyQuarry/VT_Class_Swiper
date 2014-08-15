require 'rubygems'
require 'watir'
require 'watir-webdriver'
require_relative 'lib/parse'

classes = ['86233']

browser = Watir::Browser.new


login(browser)

if browser.text.include? 'Account Recovery Action Required'
  browser.link(:text => 'Not Now').click
end

navigation_links = ['Hokie Spa', 'Registration and Schedule', 'Drop/Add']

navigation_links.each do |link_text|
  browser.link(:text => link_text).click
end


puts "attempting to add class"

begin
  classes.each_with_index do |name, index|
    browser.text_field(:id => "crn_id#{index + 1}").set name
  end

  browser.button(:value => 'Submit Changes').click
end while browser.text.include? 'Registration Errors'


puts "Class added successfully"