class RegisteredApplicationsController < ApplicationController
  def new
    @regapp = RegisteredApplication.new
  end

  def create
    @regapp = RegisteredApplication.new(regapp_params)
    @regapp.user = current_user

    if @regapp.save
      redirect_to @regapp, notice: "You successfully registered \"#{@regapp.name}\"."
    else
      flash.now[:alert] = "There was an error registering \"#{@regapp.name}\". Please try again."
      render :new
    end
  end

  def index
    @regapps = RegisteredApplication.all
  end

  def show
    @regapp = RegisteredApplication.find(params[:id])
  end

  def edit
    @regapp = RegisteredApplication.find(params[:id])
  end

  def update
    @regapp = RegisteredApplication.find(params[:id])
    @regapp.assign_attributes(regapp_params)

    if @regapp.save
      flash[:notice] = "\"#{@regapp.name}\" was updated successfully."
      redirect_to @regapp
    else
      flash.now[:alert] = "There was an error updating \"#{@regapp.name}\". Please try again."
      render :edit
    end
  end

  def destroy
    @regapp = RegisteredApplication.find(params[:id])
    if @regapp.destroy
      flash[:notice] = "\"#{@regapp.name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting \"#{@regapp.name}\". Try again?"
      render :show
    end
  end

  private

  def regapp_params
    params.require(:registered_application).permit(:name, :url)
  end
end
