class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_one :cart, dependent: :destroy
  before_create :build_default_cart

  private
  def build_default_cart
    # build default profile instance. Will use default params.
    # The foreign key to the owning User model is set automatically
    build_cart
    true
  end
end
