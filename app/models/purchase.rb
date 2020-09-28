class Purchase < ApplicationRecord
#== Enums
  enum post_type: ['basic', 'plus', 'pro']
#== Associations
  belongs_to :user
end
