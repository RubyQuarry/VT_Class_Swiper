require 'rubygems'
require 'mechanize'
require_relative 'parse'



class DropAddNavigator
  include NavigateHokieSpa

  attr_accessor :form,:page,:agent

  def initialize
    @agent = Mechanize.new

  end

  def page_and_agent
    {page: @page, agent: @agent}
  end

  def navigate_to_drop_add
    @form = hokie_spa_welcome_page(page_and_agent)
    @page = login(page_and_agent.merge({form: form}))
    @page = traverse_to_schedule(page_and_agent)
    terms_available(page_and_agent)
    drop_add_links(page_and_agent)
  end
end

a = DropAddNavigator.new
a.navigate_to_drop_add
