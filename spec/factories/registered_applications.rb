FactoryGirl.define do
  factory :registered_application do
    sequence(:name) { |n| "MyApp-#{n}" }
    sequence(:url) { |n| "http://myapp-#{n}.com" }
    user
  end
end
