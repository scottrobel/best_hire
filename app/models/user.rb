class User < ApplicationRecord
#== Associations
  has_many :jobs
  has_many :purchases
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
end
