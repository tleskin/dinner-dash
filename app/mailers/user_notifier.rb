class UserNotifier < ApplicationMailer
  default from: "hipsterbites@gmail.com"

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: "Thanks for signing up for with Hipster Bytes")
  end

  def order_confirmation(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order has been received')
  end
end
