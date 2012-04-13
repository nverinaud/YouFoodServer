FactoryGirl.define do
  factory :director do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobarfoobar"
  end
end

