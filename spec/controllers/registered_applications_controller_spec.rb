require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_app) { create(:registered_application, user: my_user) }

  context "guest user" do
  end

  context "signed in user" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in my_user
    end

    describe "GET #index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

      it "assigns [my_app] to @registered_applications" do
        get :index
        expect(assigns(:registered_applications)).to eq([my_app])
      end
    end

    describe "GET #show" do
      it "assigns my_app to @registered_application" do
        get :show, { id: my_app.id }
        expect(assigns(:registered_application)).to eq(my_app)
      end
    end

    describe "GET #new" do
      it "renders the new template" do
        get :new
        expect(response).to have_http_status(:success)
        expect(response).to render_template("new")
      end

      it "increases the number of apps by 1" do
        expect{ create(:registered_application, user: my_user) }.to change(RegisteredApplication,:count).by(1)
      end

      it "redirects to the new app's page" do
        post :create, registered_application: {name: "name", url: "url", user: my_user}
        expect(response).to redirect_to RegisteredApplication.last
      end
    end

    # describe "GET #edit" do
    #   it "renders the edit template" do
    #     get :show
    #     expect(response).to have_http_status(:success)
    #     expect(response).to render_template("edit")
    #   end
    # end
  end
end
