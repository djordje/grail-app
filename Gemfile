# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'puma', '~> 3.11'
gem 'rack', '~> 2.0'
gem 'rack-cors', require: 'rack/cors'
gem 'rake', '~> 12.3'

gem 'grape', '~> 1.0'
gem 'grape-entity', '~> 0.7.1'
gem 'grape-swagger', '~> 0.28.0'
gem 'grape-swagger-entity', '~> 0.2.4'

gem 'activemodel', '~> 5.2'
gem 'activerecord', '~> 5.2'
gem 'activesupport', '~> 5.2'

gem 'bcrypt', '~> 3.1.7'
gem 'pg', '~> 1.0'

group :development do
  gem 'shotgun', '~> 0.9.2'
end

group :test do
  gem 'rspec', '~> 3.7'
  gem 'rspec-grape', '~> 0.0.4'
end

group :development, :test do
  gem 'dotenv', '~> 2.2', require: false
  gem 'factory_bot', '~> 4.8', require: false
  gem 'rubocop', '~> 0.55.0', require: false
end
