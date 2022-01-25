#Basic Gems used on each project

gem 'hirb'
gem 'better_errors'                      => group: :development
gem 'bind_of_caller'                     => group: :development

#----
gem 'annotate'                           => group: :development
rails g annotate:install

#----
gem 'hotwire-livereload'                 => group: :development
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
config.action_mailer.default_url_options  = { host: 'localhost', port: 3000 }

## create Homepage

# apps/views/layouts/application.html.erb

#<p class="notice"><%= notice %></p>
#<p class="alert"><%= alert %></p>

rails g devise:views

#----
gem 'letter-opener'                      => group: :development

#config/environments/development.rb
config.action_mailer.delivery_method      = :letter_opener
config.action_mailer.perform_deliveries   = true

#----
gem 'rspec-rails'                        => group: :test
rails g rspec:install

#.rspec
--color
--format document

#config/application.rb
config.generators do |g|
  g.test_framework :rspec,
    fixtures: false,
    view_specs: false,
    helper_specs: false,
    routing_specs: false,
    controller_specs: false
end

#----
gem 'factory_bot_rails'                  => group: :development, :test

# config/application.rb
config.generators do |g|
  g.factory_bot suffix: "factory"

end

#If using with RSpec add configuration to spec/support/factory_bot.rb and
#require that file in rails_helper.rb
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end



# REMINDER
# brew services start redis
