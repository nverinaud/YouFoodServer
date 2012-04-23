namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_menus
  end


  def make_users
    Cooker.create(name: "Cooker", email: "cooker@youfood.com", password: "password")
    RestaurantManager.create(name: "Restaurant Manager", email: "restaurant.manager@youfood.com", password: "password")
    Director.create(name: "Director", email: "director@youfood.com", password: "password")
  end


  def make_menus
    100.times do |n|
      name = Faker::Name.name
      description = Faker::Lorem.paragraph
      default = (n%2 == 0)
      Menu.create!(name: name,
                      description: description,
                      default: default)
    end
  end
end

