source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
#gem 'railties', '~> 4.2', '>= 4.2.6'
#gem 'railties', '~> 5.0.0.beta2'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheetscccccccccccccccccccccccccccccccccccccccccccccccccccccdfddds
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimesdd
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
 gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'haml-rails'

gem 'devise', github: "plataformatec/devise"

gem 'omniauth-facebook' 

#Flexbox rb


gem 'flexbox_rb'

gem "best_in_place", "~> 3.0.1"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


#perperclip subir archivos

gem "paperclip" ,"~> 5.0.0beta1"

#remotipart to submit images by AYAX
gem "remotipart", github:"urielhdz/remotipart"

#AASM para state machines
gem "aasm"

#Activemodel serializers xml 
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'

#Draper para nuestros decoradores
gem "draper", github:"audionerd/draper",branch:"rails5"

#wilpaginate para paginacion
gem "will_paginate"

#sidekiq para los trabajos en el background
gem 'sidekiq'
#sinatra
gem 'sinatra', github: "sinatra/sinatra", require: nil


group :development, :test do
  gem 'shoulda-matchers' #metodos de ayuda especificos
  gem 'rspec-rails' #framework de pruebas
  gem "factory_girl_rails" #nos permite crear objetos de la BD para pruebas

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
 
end

group :development do
	
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
