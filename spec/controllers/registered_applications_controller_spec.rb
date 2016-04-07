require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_app) { create(:registered_application, user: my_user) }

  context "guest user" do
    describe "GET #index (or pretty much anything else)" do
      it "redirects to sign in if not signed in" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
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

    describe "GET #edit" do
      it "renders the edit template" do
        get :edit, { id: my_app.id }
        expect(response).to have_http_status(:success)
        expect(response).to render_template("edit")
      end
    end

    describe "PUT #update" do
      # it "updates regapp with expected attributes" do
      #   new_name = "New Name 100"
      #   new_url = "http://new.url"
      #   put :update, id: my_app.id, registered_application: { name: new_name, url: new_url }
      #   updated_app = assigns(:registered_application)
      #   expect(updated_app.id).to eq my_app.id
      #   expect(updated_app.name).to eq my_app.name
      #   expect(updated_app.url).to eq my_app.url
      # end
      #
      # it "redirects to the updated app info" do
      #   new_name = "New Name 200"
      #   new_url = "http://new2.url"
      #   put :update, id: my_app.id, post: { name: new_name, url: new_url }
      #   expect(response).to redirect_to my_app
      # end
    end

    describe "DELETE #destroy" do
      it "deletes the regapp" do
        delete :destroy, { id: my_app.id }
        count = RegisteredApplication.where({id: my_app.id}).size
        expect(count).to eq 0
      end

      it "redirects to apps index" do
        delete :destroy, { id: my_app.id }
        expect(response).to redirect_to registered_applications_path
      end
    end
  end
end
