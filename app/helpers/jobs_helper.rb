module JobsHelper
  private

  def require_user_has_credits
    user = current_user
    if !((user.basic_post_credits &. positive?) || (user.plus_post_credits &. positive?) || (user.pro_post_credits &. positive?))
      flash[:alert] = "You need to purchace job post credits before posting a job"
      redirect_to root_path
    end    
  end
end
