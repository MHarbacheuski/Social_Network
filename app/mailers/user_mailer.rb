class UserMailer < ApplicationMailer
  def new_user_email
    @subscriber = subscriber
    mail(to: 'mgorb71@gmail.com', subject: 'Where did you go?')
  end
end
