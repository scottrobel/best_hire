class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  before_action :require_job_exists, only: [:index]
  protect_from_forgery except: :index
  before_action :authenticate_user!, except: [:new, :create]
  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)
    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_application.job, notice: 'Job application was successfully sent.' }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @job_applications = @job.job_applications
    respond_to do |format|
      format.js { render 'job_applications/index'}
    end
  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json

  private
    def require_job_exists
      @job = Job.find_by(id: params[:job_id])
      if @job.nil?
        flash[:alert] = "That Job Does not exist"
        redirect_to dashboard_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      params.require(:job_application).permit(:first_name, :last_name, :email, :resume, :job_id, :phone_number, skill_experiences_attributes: [:experience, :skill_id])
    end
end
