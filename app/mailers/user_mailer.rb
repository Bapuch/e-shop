class UserMailer < ApplicationMailer
    before_action :authenticate_user!
    helper :application 
    include Devise::Controllers::UrlHelpers


    def signup_confirmation(user)
        @user = user
        headers['X-MJ-CustomID'] = 'custom value'
        headers['X-MJ-EventPayload'] = 'custom payload'
        mail to: @user.email, subject: "Sign Up Confirmation"
      end
      
      
    def welcome_email
        @user = User.new
        headers['X-MJ-CustomID'] = 'custom value'
        headers['X-MJ-EventPayload'] = 'custom payload'
        puts 'PPPPPPPPPPPPPPPPPPPPP'
        puts params
        puts 'PPPPPPPPPPPPPPPPPPPPP'
        mail(
            from: "saphyr.team.thp@gmail.com", 
            to: @user.email,
            subject: "Thanks for your subscription - See you fella "
            )
        rescue ActiveRecord::RecordNotFound 
            render 'public/404.html', status: :not_found
    end

    def order_confirmation(user, order)
        @user = user
        @order = order
        mail(to: user.email, subject: 'Order has been received')
    end
end
