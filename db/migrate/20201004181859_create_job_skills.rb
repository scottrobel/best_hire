class CreateJobSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :job_skills do |t|
      t.belongs_to :job, foreign_key: true
      t.belongs_to :skill, foreign_key: true

      t.timestamps
    end
  end
end
