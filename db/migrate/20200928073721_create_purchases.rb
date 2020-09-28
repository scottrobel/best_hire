class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :plan_type
      t.belongs_to :user, foreign_key: true
      t.text :checkout_session_id

      t.timestamps
    end
  end
end
