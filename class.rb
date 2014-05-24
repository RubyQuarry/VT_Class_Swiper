require 'rubygems'
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://hokiespa.vt.edu')

page = agent.page.link_with(:text => 'Login to HokieSpa >>>').click

form =  page.forms()[0]


form.username= 'ajn123'
form.password = 'ILuv@lex12'

page = agent.submit(form, form.buttons.first)


#Find registration and schedule page.
text_link =  page.links.map{|link| link.text.include?"Not Now"}
page = agent.page.link_with(:text =>  "\n      Not Now\n    ").click if text_link.include? true
page = agent.page.link_with(:text =>  "Hokie Spa").click if text_link.include? true
page = agent.page.link_with(:text => "Registration and Schedule").click


#parse all valid terms
terms = agent.page.search('tr > td.delabel > p > b').reject{|term| term.to_s !~ /\d{4}/}

#get all drop add links
drop_add = page.links.select{|link| link.text == "Drop/Add" }
drop_add.uniq!{|link| link.href }
pp drop_add