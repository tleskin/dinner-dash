# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#That Hankerin' for some quinoa crusted kale crowns, or prusciutto packed portobelo pockets? Then ride that fixie for some HipsterBytes and wash it down with a PBR.
### Do you have the Hipster Hunger?


User.create(name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password")
User.create(name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", username: "j3", password: "password")
User.create(name: "Jorge Talez", email: "demo+jorge@jumpstartlab.com", username: "novohispano", password: "password")
User.create(name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", username: "josh", password: "password", role: 1)


Category.create(name: "Small Plates", description: "Itty bitty, but not too small plates of delicousness. Try not to use these plates as your new guages.")
Category.create(name: "Medium Plates", description: "Sharable, if you can bring yourself to...")
Category.create(name: "Large Plates", description: "Ginormous plates that will fill your ")
Category.create(name: "Desert Plates")
Category.create(name: "Hipster Drinks")

Item.create(title: "Bearded Praws", description: "Panko crusted - Head On - Deep fried prawns.", price: 500)
Item.create(title: "Oil-Spill Calamari", description: "Served with spicy soy-sauce and squid ink -O- the day.", price: 700)
Item.create(title: "Egg-Plant Quinoa", description: "'Herb'- crusted eggplant, served with that special sauce", price: 1000)
Item.create(title: "Stuffed Beanie", description: "One large, hat-sized, portabelo mushroom stuffed with hipster hummus and local bison-calf-cheese", price: 1450)
Item.create(title: "Tatted Fingers", description: "Large, and in charge, plantains drizzled with that .", price: 2000)
Item.create(title: "Protester-Pie", description: "These beef wellington is so deliscious you will protest for more.", price: 8000)
Item.create(title: "Fixed Gear Fritters", description: "Not yo mammas fritters. Watch your mouth drop like she did when she saw your first tat.", price: 6000)
Item.create(title: "Skinny Jean Spagetti", description: "Spagetti squash lightly dressed with extra-extra-virgin olive oil and baby-back balsamic.", price: 550)
Item.create(title: "PRB", description: "Wet your whistle with this special prize", price: 3000)
Item.create(title: "Skeptic Steak", description: "You don't think you should... But you should. And will", price: 7000)
Item.create(title: "The Questionable Quiche", description: "Eggs probably from my backyard made with spinach, greens and other vetable shit that makes this quiche THE quiche.", price:10000)
Item.create(title: "Insta-Grahmcracker Crusted Vegan Bites", description: "Turnips crusted with sweet delicious ultra vegan grahmcrackers crumbs.", price:5000)
Item.create(title: "", description: "Grass-fed all soy free range Breadstick", price: 2300)
Item.create(title: "Vintage Venison Bites", description: "35 year old venison chuncked into ", price: 5000)
Item.create(title: "", description: "Local caught seeweed", price:2300)
Item.create(title: "Pierced Pancakes", description: "", price: 4400)
Item.create(title: "Played out Panini", description: "", price: 1500)
Item.create(title: "Mixed Tape Macarroni", description: "", price: 4400)
Item.create(title: "Plaid Parfait", description: "", price:9000)
Item.create(title: "Anti-Frack-Fries", description: "You think you were pissed with you heard the started a fracking stie in your old home town? Try running out of these fries.", price:5400)
Item.create(title: "Turnt-Up Tiramasu", description: "So creamy, it'll turnt you up.", price:1200)
Item.create(title: "Alternative Artichokes", description: "", price: 8000)
Item.create(title: "Grungy", description: "", price:5500)
Item.create(title: "", description: "", price:5400)
