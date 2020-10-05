class CreateSkillExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_experiences do |t|
      t.belongs_to :job_application, foreign_key: true
      t.belongs_to :skill, foreign_key: true
      t.integer :experience

      t.timestamps
    end
  end
end
