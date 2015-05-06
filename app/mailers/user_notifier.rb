class UserNotifier < ApplicationMailer
  default from: "hipsterbites@gmail.com"

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: "Thanks for signing up for with Hipster Bytes")
  end
end
