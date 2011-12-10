# Load the rails application
require File.expand_path('../application', __FILE__)

# Load heroku environment vars from local file
heroku_env = Rails.root.join('config', 'heroku_env.rb')
load(heroku_env) if File.exists?(heroku_env)

# Initialize the rails application
Catalogs::Application.initialize!
