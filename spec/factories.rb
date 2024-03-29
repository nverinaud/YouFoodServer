FactoryGirl.define do

  factory :director do
    name Faker::Name.name
    email Faker::Internet.email
    password "password"
  end

  factory :restaurant_manager do
    name Faker::Name.name
    email Faker::Internet.email
    password "password"
  end

  factory :cooker do
    name Faker::Name.name
    email Faker::Internet.email
    password "password"
    restaurant
  end

  factory :waiter do
    name Faker::Name.name
    email Faker::Internet.email
    password "password"
    restaurant
  end

  factory :schedule do
    week "10"
  end

  factory :menu do
    sequence(:name) { |n| "Menu #{n}" }
    sequence(:description) { |n| "Menu #{n} description" }
    schedules {
      Array(1).sample.times.map do
        Factory.create(:schedule)
      end
    }
    products {
      Array(1).sample.times.map do
        Factory.create(:product)
      end
    }
    default true
  end


  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end


  factory :product do
    sequence(:price) { |n| n+10 }
    sequence(:name) { |n| "Product #{n}" }
    sequence(:abbreviation) { |n| "prod#{n}" }
    description "Hum I like it !"
    photo_file_name "http://localhost:3000/assets/images/food-image.jpg"
    sequence(:permanent) { |n| n%2 == 0 }
    category
  end

  factory :restaurant do
    sequence(:name) { |n| "Restaurant #{n}" }
    city "Lorem"
    phone "(+33)0.00.00.00.00"
    address "0, Ipsum Street"
    restaurant_manager
  end

  factory :zone do
    sequence(:name) { "Zone #{n}" }
    restaurant
  end

  factory :table do
    name Faker::Name.name
    forks_nb rand(10)
  end
end

