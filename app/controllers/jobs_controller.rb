class JobsController < ApplicationController
#== Callbacks
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new]
  before_action :require_user_has_credits, only: [:create, :new]
  before_action :require_own_post_or_admin, only: [:edit, :update, :destroy]

#== Mixins
  include JobsHelper

#== Actions
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.where("jobs.expiration_date > ?", Time.now)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job_application = @job.job_applications.build
    skill_experiences = @job.skills.map(&:skill_experiences).map(&:build)
    @job_application.skill_experiences = skill_experiences
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.build
    respond_to do |format|
      format.js{ render 'jobs/new' }
      format.html{  }
    end
  end

  # GET /jobs/1/edit
  def edit
    respond_to do |format|
      format.js{ render 'jobs/edit' }
    end
  end

  # POST /jobs
  # POST /jobs.json
  def create
    respond_to do |format|
      @new_job = current_user.jobs.build(job_params)
      if !@new_job.company_logo.attached?
        flash.now[:alert] = "Please Attach a Company Logo"
      else
        if @new_job.save
          flash.now[:notice] = "Job Posted!"
        else
          flash.now[:alert] = @new_job.errors.full_messages.first
        end
      end
      format.js{  }
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to dashboard_path, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render 'pages/dashboard' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:skill_list, :location, :post_type, :company_logo, :company_website_link, :description, :remote, :company_website_apply_link, :contact_email, :job_title, :company_name)
    end
end
