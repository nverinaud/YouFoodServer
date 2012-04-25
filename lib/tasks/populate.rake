namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_categories
    make_products
  end


  def make_users
    Cooker.create(name: "Cooker", email: "cooker@youfood.com", password: "password")
    RestaurantManager.create(name: "Restaurant Manager", email: "restaurant.manager@youfood.com", password: "password")
    Director.create(name: "Director", email: "director@youfood.com", password: "password")
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
