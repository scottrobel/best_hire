class JobApplication < ApplicationRecord
  belongs_to :job
  has_many :skill_experiences, dependent: :destroy
  accepts_nested_attributes_for :skill_experiences
  has_many :skills, through: :skill_experiences
  has_one_attached :resume
end
