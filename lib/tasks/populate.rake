namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_users
<<<<<<< Updated upstream
    make_menus
=======
<<<<<<< Updated upstream
=======
    make_menus
    make_schedules
>>>>>>> Stashed changes
>>>>>>> Stashed changes
  end


  def make_users
    Cooker.create(name: "Cooker", email: "cooker@youfood.com", password: "password")
    RestaurantManager.create(name: "Restaurant Manager", email: "restaurant.manager@youfood.com", password: "password")
    Director.create(name: "Director", email: "director@youfood.com", password: "password")
  end
<<<<<<< Updated upstream


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
=======
<<<<<<< Updated upstream
=======

  def make_menus
    db_schedules = Schedule.all
    30.times do |n|
      name = Faker::Lorem.sentence(2)
      description = Faker::Lorem.paragraph
      default = (n%2 == 0)
      Menu.create!(name: name,
                   description: description,
                   default: default)
    end
  end

  def make_schedules
    menus = Menu.all
    100.times do |n|
      week = (n%52)+1
      start_date = Date.new
      end_date = 1.week.from_now
      menu = menus[n%30]
      schedule = Schedule.new(week: week, start_date: start_date, end_date: end_date)
      schedule.menu = menu
      schedule.save
    end
  end
>>>>>>> Stashed changes
>>>>>>> Stashed changes
end

