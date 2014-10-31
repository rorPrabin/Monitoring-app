source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use devise for the purpose of authentication
gem 'devise', '3.0.0'
gem 'cancan'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3', :group => :development

# Use postgresql as the database for Heroku
gem 'mysql2', '~> 0.3.14', :group => :production

## User mongoid for mertic
gem 'mongoid', github: 'mongoid/mongoid'

# gem 'groupdate'
gem "chartkick", :git => 'git://github.com/gkunwar/chartkick'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use bootstrap for theming
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails',
                              :branch => '3.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# A wrapper around ImageMagick's identify command.
gem 'imagemagick-identify', '~> 0.0.1'

# Use paperclip to upload image
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

# NewRelic
gem 'newrelic_rpm'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# job scheduler for Ruby (at, cron, in and every jobs).
gem "rufus-scheduler", "~> 2.0.24"

# # USING PUMA WEB SERVER BUILT FOR SPEED & CONCURRENCY
# gem "puma"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# gem 'protected_attributes'
gem 'pry-rails'

# for API
gem 'rabl'
# `oj` as the JSON parser
gem 'oj'

group :test do
	gem 'database_cleaner', '1.2.0'
	gem 'rspec-rails', '~> 3.0.0.beta'
	gem 'factory_girl_rails'
	gem "capybara", '2.2.0'
	gem 'selenium-webdriver', '2.39.0'
	gem 'shoulda-matchers'
end


group :development do
  gem 'zeus'
  gem 'spork-rails'
  gem 'guard'
end

# gem 'rhc', group: [:production]
## Gem for testing Performance
gem 'rails-perftest'
gem 'ruby-prof'

# simplecov for code coverage analysis
gem 'simplecov', :require => false, :group => :test

gem 'kaminari'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]