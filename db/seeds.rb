# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

abdu = User.create(first_name: 'Abdu', last_name: 'Muhamadjonov', email: 'abdu@example.com', password: 'password')

10.times do |number|
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  email = "#{first_name.downcase}.#{last_name.downcase}@example.com"

  user = User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: 'password'
  )
  number.odd? ? abdu.follow(user.id) : user.follow(abdu.id)
end

100.times do
  Post.create(
    title: Faker::Lorem.unique.sentence(word_count: 8, supplemental: true),
    published_at: Time.now.in_time_zone('Asia/Tashkent')
  )
end
