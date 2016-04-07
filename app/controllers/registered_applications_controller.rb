class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end

end
