class UserMailer < ApplicationMailer
  def new_user_email(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: 'Where did you go?')
  end
end
