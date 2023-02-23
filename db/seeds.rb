# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "John Smith", user_name: "jsmith")

motorcycle1 = user1.motorcycles.create(name: "Harley Davidson Fat Boy", description: "A classic cruiser motorcycle", img_url: "https://example.com/harley.jpg", model_year: "2022", price: 19999.99, engine: "1868cc Milwaukee-Eight® 114", fuel_type: "Gasoline")

reservation1 = user1.reservations.create(city: "Los Angeles", start_date: Date.today, end_date: Date.today + 7.days, motorcycle: motorcycle1)
