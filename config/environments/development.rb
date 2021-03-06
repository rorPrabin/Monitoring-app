MonitorApp::Application.configure do

  config.exceptions_app = self.routes
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true
  config.action_controller.asset_host = "http://localhost:3000"

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Ensure you have defined default url options in your environments files as per devise.
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

   ActionMailer::Base.delivery_method = :smtp
  # ActionMailer setup
  ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "anythingworks",
    :user_name            => "senorita10018@gmail.com",
    :password             => "11111121",
    :authentication       => "plain",
    :enable_starttls_auto => true
  }
 

end
