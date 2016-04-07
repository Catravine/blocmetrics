require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { create(:user) }
  let(:specific_user_caroline) { create(:user, email: "caroline@example.com") }

  describe "nickname parameter" do
    it "defaultedly assigns the humanized email username to nickname" do
      expect(specific_user_caroline.nickname).to eq "Caroline"
    end
  end
end
