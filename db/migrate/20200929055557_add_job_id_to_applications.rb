class AddJobIdToApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :applications, :job, foreign_key: true
  end
end
