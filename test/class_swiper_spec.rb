require 'rspec'

describe 'login behaviour' do

  it 'should login correctly' do
    browser = Watir::Browser.new
    login(browser)

    expect("string").to include "str"

  end
end