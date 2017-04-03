source 'https://rubygems.org'

gem 'spree', github: 'spree/spree', branch: '3-2-stable'
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: 'master'

group :development do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'

  # All for Guard
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
end

gemspec
