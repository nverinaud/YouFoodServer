FactoryGirl.define do
  factory :director do
    name "Director"
    email "director@youfood.com"
    password "password"
  end

  factory :restaurant_manager do
    name "Restaurant Manager"
    email "restaurant.manager@youfood.com"
    password "password"
  end

  factory :cooker do
    name "Cooker"
    email "cooker@youfood.com"
    password "password"
  end
end

