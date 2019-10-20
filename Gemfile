# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'rspec', '~> 3.0'

gem 'google-cloud-pubsub'

gem 'dotenv'

gem 'rubocop', require: false

gem 'colorize'

group :development do
  gem 'pry', '~> 0.12.2'
end

group :test, :development do
  gem 'faker'
end
