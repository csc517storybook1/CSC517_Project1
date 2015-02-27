class DevelopersController < ApplicationController
  def show
    @developer = Developer.find(params[:id])
  end
  def new
    @developer = Developer.new
  end
end
