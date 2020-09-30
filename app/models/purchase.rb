class Purchase < ApplicationRecord
#== Enums
  enum plan_type: ['basic', 'plus', 'pro']
#== Associations
  belongs_to :user

#== Money
  monetize :price_cents
#== callbacks
#== callback methods
#== Instance methods
  def update_user_credits
    attached_user = self.user
    current_credit_count = attached_user["#{self.plan_type}_post_credits"] || 0
    new_credit_count = current_credit_count + job_post_credits
    attached_user["#{self.plan_type}_post_credits"] = new_credit_count
    attached_user.save
  end

  def set_price
    self.price_cents = \
    case self.plan_type
    when 'basic'
      1000
    when 'plus'
      2000
    when 'pro'
      3000
    end
  end

  def create_checkout_session(success_url, cancel_url)
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [
        {
          name: "#{self.plan_type} Plan",
          amount: self.price_cents,
          currency: 'usd',
          quantity: 1,
          description: plan_description
        }
      ],
      success_url: success_url,
      cancel_url: cancel_url,
      mode: 'payment'
    })
    self.payment_intent_id = session.payment_intent
    self.checkout_session_id = session.id
    session
  end

  private
#== Private Methods
  def job_post_credits
    case self.plan_type
    when 'basic'
      1
    when 'plus'
      5
    when 'pro'
      20
    end
  end

  def plan_description
    case self.plan_type
    when 'basic'
      "You are purchasing one Job Post that will last 2 days"
    when 'plus'
      "You are purchasing five Job Post that will last 10 days each"
    when 'pro'
      "You are purchasing twenty Job Post that will last 30 days each"
    end
  end
end
