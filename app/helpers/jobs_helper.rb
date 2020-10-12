module JobsHelper
  private

  def require_user_has_credits
    user = current_user
    if !((user.basic_post_credits &. positive?) || (user.plus_post_credits &. positive?) || (user.pro_post_credits &. positive?))
      flash.now[:alert] = "You need to purchace job post credits before posting a job"
    end    
  end

  def require_own_post_or_admin
    user = current_user
    unless (user.id = @job.user_id || user.admin_user?)
      flash.now[:alert] = "You Can Only Edit Your Own Posts"
    end
  end
end
