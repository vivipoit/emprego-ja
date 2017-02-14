class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def new
    @companies = Company.all
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      @companies = Company.all
      render 'new'
    end

  end

  def edit
    @companies = Company.all
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to @job
    else
      @companies = Company.all
      render 'edit'
    end
  end

  private
  def job_params
    params.require(:job).permit(:title,
      :location,:category,:company_id,:description,:featured)
  end

end
