# frozen_string_literal: true

RailsAdmin.config do |config|

  # == Devise ==
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == Rails.application.credentials.user && password == Rails.application.credentials.password
    end
  end

  config.actions do
    # root actions
    dashboard # mandatory
    # collection actions
    index # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app
    impersonate
  end
end
