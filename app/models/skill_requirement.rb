class SkillRequirement
  include ActiveModel::Model
  attr_accessor :skill
  def initialize(params_hash)
    params_hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end