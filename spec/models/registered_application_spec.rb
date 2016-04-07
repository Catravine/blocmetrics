require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do

  it { should belong_to(:user) }

  let(:my_user) { create(:user) }
  let(:my_app) { create(:registered_application, user: my_user) }

  describe "attributes" do
    it "responds to name" do
      expect(my_app).to respond_to(:name)
    end

    it "responds to url" do
      expect(my_app).to respond_to(:url)
    end
  end
end
