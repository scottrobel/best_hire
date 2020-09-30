class AddPhoneNumberToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :phone_number, :string
  end
end
