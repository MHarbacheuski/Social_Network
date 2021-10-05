# frozen_string_literal: true

RailsAdmin.config do |config|
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == Rails.application.credentials.user && password == Rails.application.credentials.password
    end
  end

  config.actions do
    dashboard
    index
    new
    export
    history_index
    bulk_delete
    show
    edit
    delete
    history_show
    show_in_app
    impersonate
  end
end
