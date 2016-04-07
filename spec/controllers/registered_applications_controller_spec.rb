require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_app) { create(:registered_application, user: my_user) }

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template("index")
    end

    it "assigns [my_app] to @registered_applications" do
      get :index
      expect(assigns(:registered_applications)).to eq(my_app)
    end
  end

  # describe "GET #show" do
  #   it "renders the show template" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #     expect(response).to render_template("show")
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "renders the new template" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #     expect(response).to render_template("new")
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "renders the edit template" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #     expect(response).to render_template("edit")
  #   end
  # end

end
