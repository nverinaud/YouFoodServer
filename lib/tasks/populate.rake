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
    52.times do |n|
      name = Faker::Lorem.sentence(2)
      description = Faker::Lorem.paragraph
      default = (n%2 == 0)
      menu = Menu.new(name: name,
                      description: description,
                      default: default)
      menu.products = Array.new
      menu.schedules = Array.new
      rand(15).times do |i|
        menu.products << products[rand(100)]
      end
      menu.schedules << Schedule.find(n+1)
      menu.save!
    end
  end

  def make_schedules
    menus = Menu.all
    year_first_sunday = Time.utc(Time.now.year, 1, 1, 0, 0)

    while year_first_sunday.wday != 0
      year_first_sunday += 1.day
    end

    52.times do |n|
      week = n+1
      start_date = january1+n.week
      end_date = start_date + 1.week
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
