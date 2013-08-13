# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end

def sign_up(name,email)
  visit "/users/sign_up"
  fill_in "Name", with: name
  fill_in "Email", with: email
  fill_in "Password", with: 'password'
  fill_in "Password confirmation", with: 'password'
  click_button 'Sign Up'
end

def sign_in(email)
  visit "/users/sign_in"
  fill_in "Email", with: email
  fill_in "Password", with: 'password'
  click_button 'Sign In'
end

def make_theme(name = nil, phrases = nil)
  name ||= "My First Theme"
  phrases ||= [0...16].map{|x| x.to_s }

  visit "/themes/new"
  fill_in 'Name', with: title
  phrases.each_with_index do |phrase,index|
    fill_in 'pf#{index}', with: phrase
  end
  click_button "Create Theme"
end

