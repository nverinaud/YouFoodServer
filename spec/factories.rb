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

  factory :menu do
    sequence(:name) { |n| "Menu #{n}" }
    sequence(:description) { |n| "Menu #{n} description" }
    default true
  end
end

