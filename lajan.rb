#Basic Gems used on each project

gem 'hirb'
gem 'better_errors'  => group: :development
gem 'bind_of_caller' => group: :development

#----
gem 'annotate'       => group: :development
rails g annotate:install

#----
gem 'hotwire-livereload' => group: :development
rails livereload:install

# config/environments/development.rb
# Additional watch locations for Hotwire Reload
config.hotwire_livereload.listen_paths << Rails.root.join("app/assets/build")

#----
gem 'Smith_View_Tool'

#----
gem 'devise'
rails g devise:install
rails g devise #{model}

# config/environments/development.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

## create Homepage

# apps/views/layouts/application.html.erb

#<p class="notice"><%= notice %></p>
#<p class="alert"><%= alert %></p>

rails g devise:views

#----
gem 'factory_bot_rails' => group: :development



# REMINDER
# brew services start redis
