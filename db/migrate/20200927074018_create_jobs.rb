class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.text :company_website_link
      t.text :description
      t.boolean :remote
      t.text :company_website_apply_link
      t.text :contact_email
      t.text :job_title
      t.text :company_name
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
