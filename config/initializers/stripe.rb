if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_ZgJwgOKHu6Yzj5DbZKkOtRPi',
    secret_key: 'sk_test_sXWfwCn0adtbZkQCF3a4wgev'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]