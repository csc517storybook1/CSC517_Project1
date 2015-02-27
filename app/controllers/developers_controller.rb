class DevelopersController < ApplicationController

  def show
    @developer = Developer.find(params[:id])
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    respond_to do |format|
      if @developer.save
        #  UserMailer.welcome_email(@developer).deliver_now
        format.html { redirect_to admins_path, notice: 'Developer was created and an email was sent to registered developer.' }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    redirect_if_not_login
    developer = Developer.find(params[:id])
    redirect_if_not_same_user(developer) if !is_admin
  end

  def update
    respond_to do |format|
      if @developer.update(developer_params)
        if @isAdmin
          format.html { redirect_to admins_path, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @developer }
        else
          format.html { redirect_to @developer, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @developer }
        end
      else
        format.html { render :edit }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

end
