class UserMailer < ApplicationMailer

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
    end
end
