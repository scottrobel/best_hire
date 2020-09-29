Stripe.api_key = ENV['stripe_production_secret_key']
StripeEvent.signing_secret = ENV['stripe_production_signing_secret']
StripeEvent.configure do |events|
  events.subscribe 'payment_intent.' do |event|
    purchase = Purchase.find_by(payment_intent_id: event.data.object.id)
    purchase.paid = true
    purchase.update_user_credits
    purchase.save!
  end
end