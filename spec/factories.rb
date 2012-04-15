FactoryGirl.define do
  factory :director do
    name "Director"
    email "director@youfoo.com"
    password "password"
  end

  factory :restaurant_manager do
    name "Restaurant Manager"
    email "restaurant.manager@youfoo.com"
    password "password"
  end
end

