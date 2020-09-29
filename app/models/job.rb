class Job < ApplicationRecord
#== Associations
  belongs_to :user
  
#== Enums
  enum post_type: ['basic', 'plus', 'pro']
  
#== Attachments
  has_one_attached :company_logo
  
#== Validations
  validates :company_website_link, :description, :contact_email, :job_title, :company_name, :post_type,  presence: true
  
#== Callbacks
  after_create :update_user_credits
  before_save :set_expiration_date
  
#== Instance Methods
  def post_type_options
    post_options = [] 
    user = self.user
    basic_posts_remaining = user.basic_post_credits
    plus_posts_remaining = user.plus_post_credits
    pro_posts_remaining = user.pro_post_credits
    if basic_posts_remaining &. positive?
      post_options << ["Basic Post (Lasts 2 days)(#{basic_posts_remaining} remaining)", "basic"]
    end
    if plus_posts_remaining &. positive?
      post_options << ["Plus Posts (Lasts 10 days)(#{plus_posts_remaining} remaining)", "plus"]
    end
    if pro_posts_remaining &. positive?
      post_options << ["Pro Post (Lasts 30 days)(#{pro_posts_remaining} remaining)", "pro"]
    end
    post_options
  end
#== Call back methods
  def update_user_credits
    post_type = self.post_type
    user = self.user
    post_credits = user["#{post_type}_post_credits"]
    updated_post_credits = post_credits - 1
    user["#{post_type}_post_credits"] = updated_post_credits
    user.save
  end

  def set_expiration_date
    self.expiration_date = \
    case self.post_type
    when 'basic'
      2.days.from_now
    when 'plus'
      10.days.from_now
    when 'pro'
      30.days.from_now
    end
  end
#== Associations
  has_many :job_applications
end
