source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.1.8'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'descriptive_statistics', '~> 2.5.1', :require => 'descriptive_statistics/safe', :git => 'git://github.com/amandawraymond/descriptive_statistics', :branch => 'variance_to_sample_variance'

group :development, :test do
  gem 'rspec-rails', '3.1.0'
  gem 'pry'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.2.0'
  gem 'factory_girl_rails', '4.2.0'
end

group :production do
  gem "rails_12factor"
  gem "rails_stdout_logging"
  gem "rails_serve_static_assets"
end