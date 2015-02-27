class DevelopersController < ApplicationController
  def show
    @developer = Developer.find(params[:id])
  end
  def new
    @developer = Developer.new
  end
  def create
    @developer = Developer.new(developer_params])    # Not the final implementation!
    if @developer.save
      redirect_to @developer
      # Handle a successful save.
    else
      render 'new'
    end
  end
end
