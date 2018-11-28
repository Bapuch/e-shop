module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

   def current_cart
    @current_cart ||= Cart. if !User.find_by(is_logged: true).nil?
  end
end
