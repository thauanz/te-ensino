# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
AppEad::Application.initialize!

Time::DATE_FORMATS[:sign] = "%d/%m/%Y - %H:%M"
