# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all
Review.destroy_all

100.times do
  Restaurant.create(
    name: Faker::Restaurant.name,

    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    address: Faker::Address.street_address,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
end

# add  review with a rate 0-5 and a comment for each restaurant
10.times do
  Restaurant.all.each do |restaurant|
    restaurant.reviews.create(
      content: Faker::Restaurant.review,
      rating: rand(0..5)
    )
  end
end
