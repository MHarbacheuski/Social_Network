# frozen_string_literal: true

namespace :message do
  desc 'User notification of inactivity'
  task send_message: [:environment] do
    User.find_each do |user|
      UserMailer.with(user: user).new_user_email(user).deliver
    end
  end
end
