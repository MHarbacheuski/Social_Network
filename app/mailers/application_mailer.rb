# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.smtp[:user_name]
  layout 'mailer'
end
