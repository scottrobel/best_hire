class JobApplicationSearch
  include ActiveModel::Model
  attr_accessor :skill_requirments, :job
  def initialize(params_hash)
    params_hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def set_skill_requirements
    self.skill_requirments = self.job.skills.map do |skill|
      SkillRequirement.new({skill: skill})
    end
  end
end