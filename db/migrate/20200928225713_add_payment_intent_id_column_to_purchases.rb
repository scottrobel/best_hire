class AddPaymentIntentIdColumnToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :payment_intent_id, :string
  end
end
