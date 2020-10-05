class SkillExperience < ApplicationRecord
  belongs_to :job_application
  belongs_to :skill
end
