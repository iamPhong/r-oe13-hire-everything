source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

gem "rails", "~> 5.2.2"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "rspec-rails"
gem "rails-i18n"
gem "bootstrap-sass"
gem "jquery-rails"
gem "font-awesome-rails"
gem "devise"
gem "devise-i18n"
gem "carrierwave", "~> 1.3.1"
gem "mini_magick", "~> 4.7.0"
gem "config", "~> 1.7.1"
gem "cancancan"
gem "figaro"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "faker"
  gem "shoulda-matchers"
  gem "factory_bot_rails"
  gem "rails-controller-testing"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
