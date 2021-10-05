# frozen_string_literal: true

namespace :sample do
  desc 'TODO'
  task test: [:environment] do
    User.find_each do |user|
      UserMailer.with(user: user).new_user_email(user).deliver
    end
  end
end
