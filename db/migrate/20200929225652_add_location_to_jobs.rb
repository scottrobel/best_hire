class AddLocationToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :location, :text
  end
end
