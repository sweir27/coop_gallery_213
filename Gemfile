source 'https://rubygems.org'
ruby '2.7.7'

gem 'rails', '5.2.2'
gem 'sprockets'
gem 'bcrypt-ruby'
gem 'faker'
gem "paperclip"
gem "cancan"
gem 'pg'
gem 'kaminari'
gem 'mini_magick'

gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jbuilder'
gem 'factory_girl_rails'
gem 'aws-sdk', require: false
gem 'nokogiri', '>= 1.10.4'
gem 'rubyzip', '>= 1.2.2'
gem 'psych', '< 4' # Because of incompatible psych 4 changes and rails version https://bugs.ruby-lang.org/issues/17866

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-byebug'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
end

group :doc do
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor'
end