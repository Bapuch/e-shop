class Order < ApplicationRecord
  belongs_to :user

  validates :label, presence: true, inclusion: { in: %w(item date address shipping_fee total_price),
    message: "%{value} is not a valid label" }
end
