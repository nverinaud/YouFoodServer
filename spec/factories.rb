FactoryGirl.define do

  factory :director do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobarfoobar"
  end


  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end


  factory :product do
  	sequence(:price) { |n| n+10 }
  	sequence(:name) { |n| "Product #{n}" }
  	sequence(:abbreviation) { |n| "prod#{n}" }
  	description "Hum I like it !"
  	photoURL "http://localhost:3000/assets/images/food-image.jpg"
  	sequence(:permanent) { |n| n%2 == 0 }
    category
  end

end

