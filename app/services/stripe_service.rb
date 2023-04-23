class StripeService
  def initialize
    Stripe.api_key = ENV.fetch('STRIPE_SECRET_KEY')
  end
end
