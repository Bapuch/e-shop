

Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.stripe[:api_key],
    :secret_key      => Rails.application.credentials.stripe[:secret_key]
  }
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
  
  