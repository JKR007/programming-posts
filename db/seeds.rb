# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

100.times do
  Post.create(
    title: Faker::Lorem.unique.sentence(word_count: 8, supplemental: true),
    published_at: Time.now.in_time_zone('Asia/Tashkent')
  )
end
