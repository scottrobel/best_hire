class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
  end

  def dashboard
    @jobs = Job.all
  end
end
