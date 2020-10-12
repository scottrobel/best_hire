class JobApplicationSearchController < ApplicationController
  def create
    respond_to do |format|
      format.js { render 'job_applications/index'}
    end
  end
end
