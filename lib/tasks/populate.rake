namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_users
  end


  def make_users
    Cooker.create(name: "Cooker", email: "cooker@youfood.com", password: "password")
    RestaurantManager.create(name: "Restaurant Manager", email: "restaurant.manager@youfood.com", password: "password")
    Director.create(name: "Director", email: "director@youfood.com", password: "password")
  end
end

