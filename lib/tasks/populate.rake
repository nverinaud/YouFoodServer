namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_products
  end


  def make_products
    100.times do |n|
      price = n+10
      name = Faker::Name.name
      abbreviation = name.downcase.slice(1..10)
      description = Faker::Lorem.paragraph
      permanent = n%3
      Product.create!(price: price, 
                      name: name,
                      abbreviation: abbreviation,
                      description: description,
                      permanent: permanent)
    end
  end

end