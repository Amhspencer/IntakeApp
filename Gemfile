source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.16'
gem 'bcrypt-ruby', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'bootstrap-sass', '~>3.2.0'
gem 'autoprefixer-rails'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

#Sections copied from HW gemfile by Michael:
group :development,:test do  
  # ... other gems
  gem 'sqlite3'   # added by Peter, this is required to deploy on heroku
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'bcrypt', '3.1.7'
  gem 'rake' #Not copied, necessary for TravisCI
end

gem 'haml'













# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
