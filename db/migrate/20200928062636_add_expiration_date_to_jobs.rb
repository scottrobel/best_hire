class AddExpirationDateToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :expiration_date, :datetime
  end
end
