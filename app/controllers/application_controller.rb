class ApplicationController < ActionController::Base
  protect_from_forgery

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    
    if current_user
      puts 1
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        puts 1.2
        logging_in
        # reload guest_user to prevent caching problems before destruction
        puts "***** wwil now delete guest user with id: #{}"
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      puts 1.3
      current_user
    else
      puts 1.0
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    puts 10.1
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    
  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user if with_retry
    puts 10.2
    puts @cached_guest_user
    puts @cached_guest_user.id
    puts 10.21
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    puts 2
    guest = guest_user
    puts "guest : #{guest}"
    puts "guest cart : #{guest.cart} --- with id: #{}"
    puts "test : #{guest.nil? || guest.cart.nil?}"
    puts "cached : #{@cached_guest_user} --------- any cart ?:  #{@cached_guest_user.cart} --------- with id::  #{@cached_guest_user.cart}"
    unless guest.nil? || guest.cart.nil?
    # update the cart to get the current_user.id
    puts 2.1
    guest_cart = guest.cart
    puts guest_cart
    guest_cart.user_id = current_user.id
    guest_cart.save!
    current_user.cart = guest_cart
    current_user.save!
    puts "*** guest cart user id:"
    puts guest_cart.user_id
    end
  end

  def create_guest_user
    puts 5
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    # build_cart
    u = User.new(:email => "guest_#{Time.now.to_i}#{rand(100)}@example.com") #:name => "guest",
    puts u
    puts "***** guest created ***"
    u.build_cart
    u.save!(:validate => false)
      puts u.id
      puts u.cart
      puts u.cart.id
    session[:guest_user_id] = u.id
    u
  end

  def create
    puts 3
    super
    puts current_or_guest_user
    current_or_guest_user
  end
end
