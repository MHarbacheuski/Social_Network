# frozen_string_literal: true

RailsAdmin.config do |config|
  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == Rails.application.credentials.user && password == Rails.application.credentials.password
    end
  end


  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

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
