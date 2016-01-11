# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(name: "charlie")
u2 = User.create!(name: "rhoda")

w1 = Wine.create!(producer: "Domaine Alain Michelot", name: "Nuits St Georges Vielles Vignes", vintage: 2010, region: "Burgundy", country: "France", grape: "Pinot Noir", maturity: "Can drink now, but will improve")
w2 = Wine.create!(producer: "Domaine Gachot-Monot", name: "Nuits St Georges", vintage: 2009, region: "Burgundy", country: "France", grape: "Pinot Noir", maturity: "Drink now")
w3 = Wine.create!(producer: "Domaine Pierre Gaillard", name: "Cote-Rotie", vintage: 2010, region: "Rhone", country: "France", grape: "Syrah", maturity: "Too young")

b1 = Bottle.create!(wine_id: w1.id, user_id: u1.id, vendor: "producer", price: 25)
b2 = Bottle.create!(wine_id: w1.id, user_id: u2.id, vendor: "producer", price: 25)
b3 = Bottle.create!(wine_id: w3.id, user_id: u1.id, vendor: "producer", price: 30)

n1 = Note.create!(bottle_id: b1.id, copy: "Yummy", rating: 8)
n1 = Note.create!(bottle_id: b2.id, copy: "Delicous", rating: 7)
n1 = Note.create!(bottle_id: b3.id, copy: "Horrible", rating: 1)
