source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'simplecov', require: false, group: :test

gem 'rubocop', require: false
gem 'rubocop-performance', require: false

group :pry do
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  # table output
  gem 'hirb'
  # git integration
  gem 'pry-git'
  # on-the-fly syntax highlighting
  gem 'coolline'
  gem 'awesome_print'
end

# Specify your gem's dependencies in jsonb_attr_accessor.gemspec
gemspec
