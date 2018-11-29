class Order < ApplicationRecord
  belongs_to :user

  validates :label, presence: true, inclusion: { in: %w(item address shipping_fee),
    message: "%{value} is not a valid label" }
end
