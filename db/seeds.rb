require 'faker'

beer = Category.create!(name: "Beer")
prog_language = Category.create!(name: "Programming Languages")
animals = Category.create!(name: "Animals")
food = Category.create!(name: "Food")
hobby = Category.create!(name: "Hobby")
games = Category.create!(name: "Games")

4.times do
  Interest.create!(title: Faker::Beer.brand, category: beer)
  Interest.create!(title: Faker::ProgrammingLanguage.name, category: prog_language)
  Interest.create!(title: Faker::Creature::Animal.name, category: animals)
  Interest.create!(title: Faker::Food.fruits, category: food)
  Interest.create!(title: Faker::Hobby.activity, category: hobby)
  Interest.create!(title: Faker::Esport.game, category: games)
end

