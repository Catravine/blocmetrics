require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:my_user) { create(:user) }
  let(:my_regapp) { create(:registered_application, user: my_user) }
  let(:my_event1) { create(:event, registered_application: my_regapp) }

end
