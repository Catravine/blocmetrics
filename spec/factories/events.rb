FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "event-#{n}" }
    registered_application
  end
end
