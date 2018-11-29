class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_one :cart, dependent: :destroy
  before_create :build_default_cart

  # Return the total spent for user
  def get_total_price
    sum = 0
    self.orders.each do |order|
      sum += order.total_price
    end
    return sum
  end

  def is_admin?
    self.admin
  end

  private
  
  def send_welcome_email_to_user
    UserMailer.welcome_email(self).deliver_later
  end
  
  def build_default_cart
    # build default profile instance. Will use default params.
    # The foreign key to the owning User model is set automatically
    build_cart
    true
  end
end
