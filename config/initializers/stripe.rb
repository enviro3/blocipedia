# Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: 'pk_test_zmuopQePKmrgylFizMIjoujj', #ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: 'sk_test_HmtGXb8DwU9R2FCLH18SSQtL' #ENV['STRIPE_SECRET_KEY']
}

# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
