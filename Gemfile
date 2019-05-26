# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'rspec'
  gem 'rspec-benchmark'
end

group :development, :test do
  gem 'pry'
end
