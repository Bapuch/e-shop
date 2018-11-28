class UserMailer < ApplicationMailer

    def welcome_email
        headers['X-MJ-CustomID'] = 'custom value'
        headers['X-MJ-EventPayload'] = 'custom payload'
    
        mail(
            from: "saphyr.team.thp@gmail.com", 
            to: current_user.email,
            subject: "Commande prise en compte Merci de votre fidelite"
            )
    end
end
UserMailer.welcome_email.deliver_now!