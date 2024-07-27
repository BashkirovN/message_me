# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = [
  { username: "Evgeny", password: "password", password_confirmation: "password" },
  { username: "Tronald Dump", password: "password", password_confirmation: "password" },
  { username: "Bilbo Baggins", password: "password", password_confirmation: "password" },
  { username: "Ravshan", password: "password", password_confirmation: "password" },
  { username: "Go-Go-Girl", password: "password", password_confirmation: "password" }
]

users.each do |user|
  created_user = User.create(user)
  puts "Created user: #{created_user.username}, ID: #{created_user.id}" if created_user.persisted?
end

messages = [
  { body: "Hello everyone", user: User.find_by(username: "Evgeny") },
  { body: "Hey new guy", user: User.find_by(username: "Go-Go-Girl") },
  { body: "Welcome!", user: User.find_by(username: "Ravshan") },
  { body: "How u doing ya all?", user: User.find_by(username: "Evgeny") },
  { body: "I'm chillin like a villain", user: User.find_by(username: "Tronald Dump") },
  { body: "Oh boy!", user: User.find_by(username: "Bilbo Baggins") }
]

messages.each do |message|
  created_message = Message.create(message)
  puts "Created message: #{created_message.body}, User ID: #{created_message.user_id}" if created_message.persisted?
end

