# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
parent1 = Category.create(name: "All", parent_id: nil)
	Category.create(name: "Animals", parent_id: parent1.id)
	Category.create(name: "Places", parent_id: parent1.id)
	Category.create(name: "Things", parent_id: parent1.id)
parent2 =	Category.create(name: "People", parent_id: parent1.id)
Category.create(name: "Friends", parent_id: parent2.id)
	Category.create(name: "Family", parent_id: parent2.id)

