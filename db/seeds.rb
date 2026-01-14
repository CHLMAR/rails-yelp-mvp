# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
restaurant_types = ["chinese", "italian", "japanese", "french", "belgian"]
# ratings = [1, 2, 3, 4, 5]
#
20.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.unique.name,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    category: restaurant_types.sample(),
    address: Faker::Address.full_address
  )
  restaurant.save!
end

# t.string "name"
#     t.string "address"
#     t.string "category"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "phone_number"
#   end
