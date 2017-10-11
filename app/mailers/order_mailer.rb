class OrderMailer < ApplicationMailer
  default from: 'norepy@jungle.com'

 def order_email(user)
   @user = user
   mail(to: @user.email, subject: @order.id)
 end
end
