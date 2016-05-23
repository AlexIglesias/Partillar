# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


categories = Category.create([{name: "Musica"}, {name: "Baile"}, {name: "Ropa"}, {name: "Etnografía"} ])
# location = Location.create(name: "Marin", latitude: "42.3898489", longitude: "-8.7102692")
# location1 = Location.create(name: "Ferrol", latitude: "43.4911362", longitude: "-8.2544002")

# content1 = Content.create([
#   {source: "Alex", title: "Prueba1", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true },
#   {source: "Mikel", title: "Prueba2", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true },
#   {source: "Victor", title: "Prueba3", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: false },
#   {source: "Rixie", title: "Prueba4", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true },
#   ])

content1 = Content.create({source: "Alex", title: "Prueba1", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true, category_id:1})
content2 = Content.create({source: "Mikel", title: "Prueba2", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true, category_id:2 })
content3 = Content.create({source: "Victor", title: "Prueba3", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: false, category_id:3 })
content4 = Content.create({source: "Rixie", title: "Prueba4", media_url: "https://goo.gl/YKErCJ", description: "Primera prueba de base de datos", curated: true, category_id:2})

paul, alia, leto = User.create([
  {name: 'Paul Atreides',  email: 'paul@arrakis.com', password: 'ironhack', password_confirmation: 'ironhack'},
  {name: 'Alia Atreides',  email: 'alia@arrakis.com',  password: 'ironhack', password_confirmation: 'ironhack'},
  {name: 'Leto Atreides', email: 'leto@arrakis.com',  password: 'ironhack', password_confirmation: 'ironhack'}
])





