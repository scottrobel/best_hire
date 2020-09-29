class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.belongs_to :job, foreign_key: true

      t.timestamps
    end
  end
end
