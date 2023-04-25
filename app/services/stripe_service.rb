class StripeService
  def initialize
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end

  def find_or_create_customer(customer)
    stripe_customer = if customer.stripe_customer_id.present? 
                        Stripe::Customer.retrieve(customer.stripe_customer_id)
                      else 
                        Stripe::Customer.create(name: customer.name, email: customer.email, phone: customer.phone)
                      end
    customer.update(stripe_customer_id: stripe_customer.id) unless customer.stripe_customer_id.present?
    stripe_customer
  end
end
