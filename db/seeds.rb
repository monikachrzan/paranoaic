# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create 5 users
# Each user has 5 conspiracies

#### USERS
User.delete_all
puts "Deleted all"
puts "Creating..."
5.times do
  name = Faker::Name.first_name
    user = User.create!(
    user_name: name,
    email: "#{name}@email.com",
    password: '123456')
      5.times do
        Conspiracy.create!(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph(sentence_count: 10),
        user: user,
        posted_on: Date.today - rand(1..5)
        )
      end
end
puts "done"


#### Conspiracies
