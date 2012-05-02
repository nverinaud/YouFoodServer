namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_categories
    make_products
    make_schedules
    make_menus
  end


  def make_users
    Cooker.create(name: "Cooker", email: "cooker@youfood.com", password: "password")
    RestaurantManager.create(name: "Restaurant Manager", email: "restaurant.manager@youfood.com", password: "password")
    Director.create(name: "Director", email: "director@youfood.com", password: "password")
  end

  def make_menus
    products = Product.all
    30.times do |n|
      name = Faker::Lorem.sentence(2)
      description = Faker::Lorem.paragraph
      default = (n%2 == 0)
      menu = Menu.new(name: name,
                      description: description,
                      default: default)
      menu.products = Array.new
      rand(15).times do |i|
        menu.products << products[rand(100)]
      end
      menu.schedules << Schedule.find(rand(52))
      menu.save!
    end
  end

  def make_schedules
    menus = Menu.all
    52.times do |n|
      week = n+1
      start_date = Date.new
      end_date = 1.week.from_now
      Schedule.create!(week: week, start_date: start_date, end_date: end_date)
    end
  end

  def make_categories
    5.times do |n|
      name = Faker::Name.first_name
      Category.create!(name: name)
    end
  end


  def make_products
    categories = Category.all
    100.times do |n|
      price = n+10
      name = Faker::Name.name
      abbreviation = name.downcase.slice(1..10)
      description = Faker::Lorem.paragraph
      permanent = n%3
      category = categories[n%5]
      product = Product.new(price: price,
                            name: name,
                            abbreviation: abbreviation,
                            description: description,
                            permanent: permanent,
                            category: category)
      product.photo_file_name = '/assets/empty-food-image.jpg'
      product.save!
    end
  end
end
