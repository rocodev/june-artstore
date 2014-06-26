Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
  #config.action_mailer.delivery_method = :letter_opener #see mail in local

  #config.action_mailer.smtp_settings = {
  #  :port           => 587,
  #  :address        => 'smtp.mailgun.org',
  #  :user_name      => 'postmaster@sandbox12ecdeaf8f3b4b9d87f7964abfb9bd7b.mailgun.org',
  #  :password       => '0m8dms6pz8r4',
  #  :domain         => 'sandbox12ecdeaf8f3b4b9d87f7964abfb9bd7b.mailgun.org',
  #  :authentication => :plain,
  #}

  config.action_mailer.smtp_settings = {
    :port           => 587,
    :address        => 'smtp.mailgun.org',
    :user_name      => 'postmaster@app26286730.mailgun.org',
    :password       => '5yh9-f9r8ku7',
    :domain         => 'app26286730.mailgun.org',
    :authentication => :plain,
  }
  
  config.action_mailer.delivery_method = :smtp

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
