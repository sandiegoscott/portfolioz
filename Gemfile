source 'https://rubygems.org'

ruby '2.2.0'

group :development do
  unless ENV['TEST_SUITE'] == 'minitest' || ENV['TEST_SUITE'] == 'rspec'
    puts "\nexport TEST_SUITE=rspec; bundle install\n\n  -- or --\n\nexport TEST_SUITE=minitest; bundle install\n\n"
    exit
  end
end

gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

#gem 'active_type'
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
end

group :development, :test do
  if ENV['TEST_SUITE'] == 'rspec'
    gem 'rspec-rails'
    gem 'factory_girl_rails'
  elsif ENV['TEST_SUITE'] == 'minitest'
    gem 'minitest-rails'
    gem 'fabrication'
  end
end

# http://girders.org/blog/2014/02/06/setup-rails-41-spring-rspec-and-guard/
group :development, :test do
  if ENV['TEST_SUITE'] == 'rspec'
    gem 'spring-commands-rspec'
    gem 'guard-rspec'
  end
  gem 'rb-fsevent' if `uname` =~ /Darwin/
end

group :test do
  # uncomment as needed
  gem 'faker'
  gem 'capybara' if ENV['TEST_SUITE'] == 'rspec'
  gem 'database_cleaner'
  # gem 'launchy'
  # gem 'selenium-webdriver'
end

group :production do
  # gem 'pg'
  # gem 'rails_12factor'
end
