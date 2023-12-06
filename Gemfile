source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "dartsass-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

gem "bulma-rails", "~> 0.9.4"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "web-console"
end

gem 'faraday'
gem 'chartkick'
gem 'graphlient'

group :development, :staging do
  gem "pry-rails"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

gem "devise", "~> 4.9"
