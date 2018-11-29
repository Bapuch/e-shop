class UserMailer < ApplicationMailer
    before_action :authenticate_user!
    helper :application 
    include Devise::Controllers::UrlHelpers
    
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
            subject: "Commande prise en compte Merci de votre fidelite"
            )
        rescue ActiveRecord::RecordNotFound 
            render 'public/404.html', status: :not_found
    
    end
end
