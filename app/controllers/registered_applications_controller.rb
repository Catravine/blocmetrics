class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(regapp_params)
    @registered_application.user = current_user
    if @registered_application.save
      flash[:notice] = "App '#{@registered_application.name}' was saved."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error registering this app.  Please try again."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(regapp_params)

    if @registered_application.save
      flash[:notice] = "Application '#{@registered_application.name}' was updated."
      redirect_to @registered_application
    else
      flash.now[:alert] = "Error updating this app. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the app."
      render :show
    end
  end

  private

  def regapp_params
    params.require(:registered_application).permit(:name, :url)
  end

end
