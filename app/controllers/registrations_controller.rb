class RegistrationsController < Devise::RegistrationsController
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  def create
    super
      if @user.persisted?
        #persisted? => to verify that the user was actually persisted to the database
        UserMailer.signup_confirmation.deliver_now
      end
  end



end