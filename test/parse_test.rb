require 'test-unit'
require_relative 'main'


class ParseTest < Test::Unit::TestCase
  attr_reader :parser

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @parser = DropAddNavigator.new
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_navigator
  end
end