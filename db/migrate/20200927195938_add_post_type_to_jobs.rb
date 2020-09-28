class AddPostTypeToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :post_type, :integer
  end
end
