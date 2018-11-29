class UserMailer < ApplicationMailer

    def signup_confirmation
        mail(to: 'hoang_christine@yahoo.fr', subject: 'Sign Up Confirmation')  
    end

    def order_confirmation
        mail(to: 'hoang_christine@yahoo.fr', subject: 'Order Confirmation') 
    end 

end     