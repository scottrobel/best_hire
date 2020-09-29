Stripe.api_key = Rails.application.credentials.stripe[:test][:secret_key]
StripeEvent.signing_secret = Rails.application.credentials.stripe[:test][:signing_key]
StripeEvent.configure do |events|
  events.subscribe 'payment_intent.' do |event|
    purchase = Purchase.find_by(payment_intent_id: event.data.object.id)
    purchase.paid = true
    purchase.update_user_credits
    purchase.save!
  end
end