class AddPostCreditsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :basic_post_credits, :integer, default: 0
    add_column :users, :plus_post_credits, :integer, default: 0
    add_column :users, :pro_post_credits, :integer, default: 0
  end
end
