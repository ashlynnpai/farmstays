# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Farm.create(name: "Coffee Country Farm", address: "Arabica Road, Ethiopia", description: "Enjoy fresh coffee here.", email: "coffee@fake.com", phone: "0000", website: "coffeecountry.fake", region_id: 1)

Farm.create(name: "Pepper Paradise Farm", address: "Chile Corner, New Mexico, USA", description: "We turn the heat on your vacation.", email: "peppers@fake.com", phone: "0000", website: "pepperparadise.fake", region_id: 2)

Farm.create(name: "Llama Land Farm", address: "Llama Valley, Peru", description: "Our llamas are friendly.", email: "llamas@fake.com", phone: "0000", website: "llamaland.fake", region_id: 3)

Farm.create(name: "Horse Heaven Farm", address: "Horse Silk Road, Turkmenistan", description: "Our horses rock.", email: "horse@fake.com", phone: "0000", website: "horseheaven.fake", region_id: 4)

Farm.create(name: "Reindeer Riders Farm", address: "Reindeer Road, Mongolia", description: "Come ride our reindeer.", email: "reindeer@fake.com", phone: "0000", website: "reindeerriders.fake", region_id: 5)

Farm.create(name: "Pony Paradise Farm", address: "Ponies Path, Snæfellsjökull, Iceland", description: "Our ponies are pretty.", email: "pony@fake.com", phone: "0000", website: "prettypony.fake", region_id: 6)


Farm.create(name: "Ancient Vineyards Farm", address: "Old Vine Road, Armenia", description: "Making wine for 6000 years.", email: "wine@fake.com", phone: "0000", website: "ancientvineyards.fake", region_id: 7)

Farm.create(name: "Dates & More Farm", address: "Nile Road, Egypt", description: "Make a date with our dates.", email: "date@fake.com", phone: "0000", website: "datesnmore.fake", region_id: 8)

Farm.create(name: "Sheep Shelter Farm", address: "Old Sheep Road, New Zealand", description: "We have lots of sheep here.", email: "sheep@fake.com", phone: "0000", website: "sheepshelter.fake", region_id: 9)

user1 = User.create(name: "Happy Hippo", password: "password1", email: "user1@email.com")

user2 = User.create(name: "Smiley Small", password: "password2", email: "user2@email.com")


Region.create(name: "Africa-Sub Saharan")
Region.create(name: "America-North")
Region.create(name: "America-Central/South")
Region.create(name: "Asia-Central")
Region.create(name: "Asia-East/SE")
Region.create(name: "Europe-North")
Region.create(name: "Europe-South")
Region.create(name: "Middle East/North Africa")
Region.create(name: "Pacific, Aus/NZ")

