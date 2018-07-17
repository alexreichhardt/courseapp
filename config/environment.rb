# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

config.after_initialize do
  Bullet.enable = true
  Bullet.rails_logger = true
end
