$:.unshift File.expand_path('../lib/', File.dirname(__FILE__))
require 'rspec'
require 'pry'

Dir[File.dirname(__FILE__) + "/matchers/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.color = true
end
