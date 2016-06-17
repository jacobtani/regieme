ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"
require "minitest/rails/capybara"
require 'simplecov' if ENV["COV"]

SimpleCov.start do
  add_filter 'test/'
  add_filter 'config/'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
end if ENV["COV"]

if ENV['SQL'] then ActiveRecord::Base.logger = Logger.new(STDOUT) if defined? ActiveRecord::Base end

#add devise test helpers
class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include Capybara::DSL
  include Capybara::Assertions

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

  def json_response
    @json_response ||= JSON.parse(response.body)
  end
end