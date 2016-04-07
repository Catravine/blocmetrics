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

  private

  def regapp_params
    params.require(:registered_application).permit(:name, :url)
  end

end
