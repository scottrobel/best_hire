class JobApplication < ApplicationRecord
  belongs_to :job
  has_one_attached :resume
end