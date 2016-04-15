# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Note.destroy_all
Category.destroy_all

category = Category.create([ { name: 'Personal' }, { name: 'Family' }, { name: 'Work' }, { name: 'Noty' }, { name: 'Quotes' }])

if Note.all.count == 0
  500.times do |i|
    Note.create!(
      title: Faker::Hipster.sentence,
      body: Faker::Hipster.paragraph(2),
      category: category[rand(0..4)]
    )
  end
end