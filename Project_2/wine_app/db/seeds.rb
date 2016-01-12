# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(name: "charlie", email: "charlie@charlie.com", password: "12345", password_confirmation: "12345")
u2 = User.create!(name: "rhoda", email: "rhoda@rhoda.com", password: "12345", password_confirmation: "12345")

w1 = Wine.create!(producer: "Domaine Alain Michelot", name: "Nuits St Georges Vielles Vignes", vintage: 2010, alcohol: 13.5, region: "Burgundy", country: "France", grape: "Pinot Noir", window: 2017)
w2 = Wine.create!(producer: "Domaine Gachot-Monot", name: "Nuits St Georges", vintage: 2009, alcohol: 13, region: "Burgundy", country: "France", grape: "Pinot Noir", window: 2017)
w3 = Wine.create!(producer: "Domaine Pierre Gaillard", name: "Cote-Rotie", vintage: 2010, alcohol: 13.5, region: "Rhone", country: "France", grape: "Syrah", window: 2017)

b1 = Bottle.create!(wine_id: w1.id, user_id: u1.id, vendor: "producer", price: 25)
b2 = Bottle.create!(wine_id: w1.id, user_id: u2.id, vendor: "producer", price: 25)
b3 = Bottle.create!(wine_id: w3.id, user_id: u1.id, vendor: "producer", price: 30)
b4 = Bottle.create!(wine_id: w2.id, user_id: u2.id, vendor: "producer", price: 30)

n1 = Note.create!(bottle_id: b1.id, appearance: "clear", nose: "apples", palate: "pears", conclusion: "Yummy", rating: 8, maturity: "Can drink now, but will improve")
n2 = Note.create!(bottle_id: b2.id, appearance: "clear", nose: "cherries", palate: "plums", conclusion: "Delicous", rating: 7, maturity: "Ready")
n3 = Note.create!(bottle_id: b3.id, appearance: "clear", nose: "blackcurrant", palate: "strawberry", conclusion: "Horrible", rating: 1, maturity: "Too young")
n4 = Note.create!(bottle_id: b1.id, appearance: "clear", nose: "bananas", palate: "pineapples", conclusion: "Yuck", rating: 0, maturity: "Past its best")
n5 = Note.create!(bottle_id: b4.id, appearance: "clear", nose: "avocado", palate: "mould", conclusion: "disgusting", rating: 3, maturity: "Will improve")
