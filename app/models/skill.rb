class Skill < ApplicationRecord
#== Associations
  has_many :skill_experiences

#== Instance Methods
  def to_s
    self.name
  end
end
