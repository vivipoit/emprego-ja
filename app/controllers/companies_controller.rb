class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params.require(:company)
      .permit(:name,:location,:mail,:phone))
    @company.save
    redirect_to @company
  end

  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(params.require(:company)
      .permit(:name,:location,:mail,:phone))
      redirect_to @company
    else
      render 'edit'
    end

  end

end
