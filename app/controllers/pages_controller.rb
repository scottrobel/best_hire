class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :admin_dashboard]
  before_action :require_admin!, only: [:admin_dashboard]
  def home
  end

  def dashboard
    @jobs = Job.all
    @applications = JobApplication.all \
      .joins('INNER JOIN jobs ON jobs.id = job_applications.id') \
      .where('jobs.user_id = ?', current_user.id)
  end

  def admin_dashboard
    @jobs = Job.all
  end

  private

  def require_admin!
    if !current_user.admin_user?
      flash[:notice] = "That Page is for admins"
      redirect_to root_path
    end
  end
end
