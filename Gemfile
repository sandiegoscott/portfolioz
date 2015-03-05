source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem 'active_type'
gem 'bootstrap-sass'
gem 'devise'
gem 'haml'
gem 'mysql2'
gem 'pundit'

group :development, :test do
  gem 'awesome_print', :require => 'ap'
  gem 'byebug'  # Ruby 2 debugger
  gem 'web-console', '~> 2.0'
  gem 'haml-rails'
  gem 'spring'
end

group :development do
  gem 'better_errors'
  gem 'erb2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  # uncomment for Rspec
  # gem 'spring-commands-rspec'
end

group :development, :test do
  # uncomment to use Rspec
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  # uncomment to use Minitest
  # gem 'minitest-rails'
  # gem 'fabrication'
end

# http://girders.org/blog/2014/02/06/setup-rails-41-spring-rspec-and-guard/
group :development, :test do
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
end

group :test do
  # uncomment as needed
  gem 'faker'
  # uncomment for Rspec
  # gem 'capybara'
  gem 'database_cleaner'
  # gem 'launchy'
  # gem 'selenium-webdriver'
end

group :production do
  # gem 'pg'
  # gem 'rails_12factor'
end
