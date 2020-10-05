class User < ApplicationRecord
#== Associations
  has_many :jobs, dependent: :destroy
  has_many :job_applications, through: :jobs
  has_many :purchases, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#== Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#== enums
  enum user_type: [:regular_user, :admin_user]
#== Attribute Defaults
  attribute :basic_post_credits, :integer, default: 0
  attribute :plus_post_credits, :integer, default: 0
  attribute :pro_post_credits, :integer, default: 0
#== Callbacks
  before_create ->{ self.basic_post_credits = 5 }
end
