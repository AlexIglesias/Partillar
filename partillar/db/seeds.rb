# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


categories = Category.create([{name: "Musica"}, {name: "Baile"}, {name: "Ropa"}, {name: "Etnografía"} ])

alex = User.create([
  {name: 'Alex Iglesias',  email: 'alex@partillar.com', password: '123456', password_confirmation: '123456'}
])

infocard1 = Infocard.create({source: "Alex", title: "Prueba1", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true, category_id:1})
infocard2 = Infocard.create({source: "Mikel", title: "Prueba2", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true, category_id:2 })
infocard3 = Infocard.create({source: "Victor", title: "Prueba3", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: false, category_id:3 })
infocard4 = Infocard.create({source: "Rixie", title: "Prueba4", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true, category_id:2})




