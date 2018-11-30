class UserMailer < ApplicationMailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  def signup_confirmation
      mail(to: 'hoang_christine@yahoo.fr', subject: 'Sign Up Confirmation')  
  end

  def order_confirmation(user)
    @user = user
    @order = @user.orders.last
    mail(to: @user.email, subject: 'Order Confirmation')
   end

    def order_confirmation_admin
        mail(to: 'admin@robotshop.com', subject: 'New order') 
    end

end