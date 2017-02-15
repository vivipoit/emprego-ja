class JobsController < ApplicationController

  before_action :job_find, only: [:show, :edit, :update]

  def new
    @categories = Category.all
    @companies = Company.all
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      @companies = Company.all
      @categories = Category.all
      render 'new'
    end

  end

  def show
  end

  def edit
    @companies = Company.all
    @categories = Category.all
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      @companies = Company.all
      @categories = Category.all
      render 'edit'
    end
  end

  def job_params
    params.require(:job).permit(:title,
      :location,:category_id,:company_id,:description,:featured)
  end

  def job_find
    @job = Job.find(params[:id])
  end

end
