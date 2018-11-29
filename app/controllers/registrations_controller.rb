class RegistrationsController < Devise::RegistrationsController
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  def create
    super
    sendemail
    
  end

  def sendemail
      puts params
      puts current_user

    unless current_user.nil?
      puts current_user.email
      puts 'pppppppppppppppppppppppppppppppppppppp'
     UserMailer.new.welcome_email
    end 
  end
end