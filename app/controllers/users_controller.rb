class UsersController < ApplicationController
  def show
    @user = current_user
  end

  # Return the total spent for a given user
  def get_total_price(user)
    sum = 0
    user.orders.each do |order|
      sum += order.total_price
    end
    return sum

  end
end
