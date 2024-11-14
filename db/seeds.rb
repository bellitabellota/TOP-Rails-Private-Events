# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
first_user = User.create(name: "John", email: "john@gmail.com", password: "johnjohn")
second_user = User.create(name: "Alice", email: "alice@gmail.com", password: "alicealice")
third_user = User.create(name: "Natalia", email: "natalia@gmail.com", password: "natalianatalia")
fourth_user = User.create(name: "Michael", email: "michael@gmail.com", password: "michaelmichael")

first_event = first_user.events.create(name: "Introduction to Robotics", date: "2023-01-28 09:40:00.000000000 +0000", location: "Madrid")
second_event = first_user.events.create(name: "Exciting news in the Rails universe", date: "2025-04-30 18:00:00.000000000 +0000", location: "Madrid")
third_event = second_user.events.create(name: "Find your way through the testing djungle", date: "2025-07-03 17:40:00.000000000 +0000", location: "Barcelona")
fourth_event = third_user.events.create(name: "JS Day", date: "2024-05-13 20:40:00.000000000 +0000", location: "Gran Canaria")
fifth_event = third_user.events.create(name: "Best practises for Rails developers", date: "2025-09-17 16:00:00.000000000 +0000", location: "Brussels")
sixth_event = fourth_user.events.create(name: "How to become comfortable with OOP", date: "2025-11-17 19:40:00.000000000 +0000", location: "London")

first_event.attendees << [ first_user, second_user, third_user ]
second_event.attendees << [ first_user, second_user ]
third_event.attendees << [ first_user, second_user, third_user, fourth_user ]
fourth_event.attendees << [ second_user, third_user, fourth_user ]
fifth_event.attendees << [ third_user, fourth_user ]
sixth_event.attendees << [ first_user, second_user, fourth_user ]
