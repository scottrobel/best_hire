class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :admin_dashboard]
  before_action :require_admin!, only: [:admin_dashboard]
  def home
  end

  def dashboard
    @jobs = current_user.jobs
    @applications = current_user.job_applications
  end

  def admin_dashboard
    @jobs = Job.all
    @monthly_earnings = Purchase.new(price_cents: Purchase
      .where("created_at > ?", 30.days.ago)
      .where(paid: true)
      .sum('purchases.price_cents'))
      .price
      .format
    @yearly_earnings = Purchase.new(price_cents: Purchase
      .where("created_at > ?", 365.days.ago)
      .where(paid: true)
      .sum('purchases.price_cents'))
      .price
      .format
    @purchase_count = Purchase
      .where(paid: true)
      .count
    @job_count = Job
      .count
    @purchases = Purchase
      .where(paid: true)
  end

  private

  def require_admin!
    if !current_user.admin_user?
      flash[:notice] = "That Page is for admins"
      redirect_to root_path
    end
  end
end
