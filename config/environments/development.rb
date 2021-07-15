# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  ENV['GOOGLE_CLIENT_ID'] = '209716765770-2l5bumj7s635mts1bo2had8bfidpt29g.apps.googleusercontent.com'
  ENV['GOOGLE_CLIENT_SECRET'] = 'Dbz8ChNcdxz_igtHq_Xbx174'

  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.delivery_method = :smtp
  host = 'localhost:3000' # replace with your own url
  config.action_mailer.default_url_options = { host: host }

  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    user_name: 'mgorb71@gmail.com',
    password: 'ishdemcnnjdkwmxe',
    authentication: 'plain',
    enable_starttls_auto: true
  }
end
