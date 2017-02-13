class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def new
    @companies = Company.all
    @job = Job.new
  end

  def create
    @job = Job.new(params.require(:job).permit(:title,
      :location,:category,:company_id,:description,:featured))

    if @job.valid?
      @job.save
      redirect_to @job
    else
      @companies = Company.all
      render 'new'
    end

  end

end
