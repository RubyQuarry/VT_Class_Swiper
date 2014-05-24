require 'rubygems'
require 'mechanize'
require_relative 'parse'

agent = Mechanize.new



form = hokie_spa_welcome({agent: agent})
page = login({form: form,agent: agent})
page =traverse_to_schedule(page_and_agent(page,agent))
terms_available(page_and_agent(page,agent))
drop_add_links({page: page})
