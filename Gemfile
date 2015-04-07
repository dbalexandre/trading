source "https://rubygems.org"

ruby "2.2.1"

gem "rails", "4.2.1"

gem "jquery-rails"
gem "pg", "~> 0.18.1"
gem "rack-timeout", "~> 0.2.1"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

group :production do
  gem "rails_12factor"
  gem "unicorn", "~> 4.8.3"
end

group :development do
  gem "thin"
end

group :development, :test do
  gem "dotenv-rails", "~> 2.0.0"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.2.1"
  gem "web-console", "~> 2.0"
end
