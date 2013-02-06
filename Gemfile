source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'bootstrap-sass', '2.1'
gem 'pg', '0.12.2'
gem 'bcrypt-ruby', '3.0.1' #state-of-the-art encryption for password-digest
gem 'faker', '1.0.1' #create sample users
gem 'will_paginate', '3.0.3' #paginate users
gem 'bootstrap-will_paginate', '0.0.6' #bootstrap pagination styles

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
	gem 'rspec-rails', '2.11.0'
	gem 'guard-rspec', '1.2.1'
	gem 'guard-spork', :github => 'guard/guard-spork'
	gem 'spork', '0.9.2'
end

group :development do
	gem 'annotate', '2.5.0' #used to annotate Models 'bundle exec annotate'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

group :test do
	gem 'capybara', '1.1.2'
	gem 'rb-fsevent', '0.9.1', :require => false
	gem 'growl', '1.0.3'
	gem 'factory_girl_rails', '4.1.0' #definte user objects and insert them in db
end

