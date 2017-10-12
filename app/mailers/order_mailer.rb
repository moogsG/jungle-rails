class OrderMailer < ApplicationMailer
  default from: 'norepy@jungle.com'

 def order_email(order, user)
   @user = user
   @subject = "Order: #{order.id}"
   @order = order
   mail(to: @user.email, subject: @subject)
 end
end
