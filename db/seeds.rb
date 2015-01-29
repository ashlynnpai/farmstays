# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Farm.create(name: "Coffee Country Farm", address: "Arabica Road, Ethiopia", description: "Visit our beautiful coffee farm in the Abaya Highlands. We are close to national parks and wildlife. We offer five bedrooms for guests and free samples of our coffee.  Photo by Rod Waddington, CC by SA 2.0.", email: "coffee@example.com", phone: "0000", website: "coffeecountry.example.com", price: 30, photo: "coffee.jpg", region_id: 1)

Farm.create(name: "Pepper Paradise Farm", address: "Chile Corner, New Mexico, USA", description: "We turn the heat on your vacation. We offer three ensuite rooms for guests.  You can also come just to pick your own chili peppers and eat at our restaurant, where we serve the hottest burritos in the region. Gluten free and vegetarian options available. Photo by Christopher Holden, CC by SA 2.0.", email: "peppers@example.com", phone: "0000", website: "pepperparadise.example", price: 60, photo: "pepper.jpg", region_id: 2)

Farm.create(name: "Llama Land Farm", address: "Llama Valley, Peru", description: "We offer a llama farm full of friendly llamas to pet.  We also have a store where we sell crafts.  We don't offer accommodation but we can recommend some guesthouses nearby. Photo by Thomas Quine, CC by 2.0.", email: "llamas@example.com", phone: "0000", website: "llamaland.example", price: 30, photo: "llama.jpg", region_id: 3)

Farm.create(name: "Horse Heaven Farm", address: "Horse Silk Road, Turkmenistan", description: "Our horses are simply the best. Come and see the world's finest horses. We don't offer accommodation but we can recommend some guesthouses nearby. Photo by David Stanley, CC by 2.0.", email: "horse@example.com", phone: "0000", website: "horseheaven.example", price: 30, photo: "horse.jpg", region_id: 4)

Farm.create(name: "Reindeer Riders Farm", address: "Reindeer Road, Mongolia", description: "You can visit and ride our reindeer. We offer simple accommodation in teepees. The price is per teepee per night. We can assist you in building a fire in your teepee. Photo by Ling Vien Thai, CC by ND 2.0.", email: "reindeer@example.com", phone: "0000", website: "reindeerriders.example", price: 20, photo: "reindeer.jpg", region_id: 5)

Farm.create(name: "Pony Paradise Farm", address: "Ponies Path, Snæfellsjökull, Iceland", description: "Ride our pretty ponies in a scenic environment. Our hotel offers twenty ensuite rooms.  A full breakfast with three kinds of fish is included.  Photo by messicanbeer, CC by. 2.0.", email: "pony@example.com", phone: "0000", website: "prettypony.example", price: 100, photo: "pony.jpg", region_id: 6)


Farm.create(name: "Ancient Vineyards", address: "Old Vine Road, Armenia", description: "We have been making wine for 6000 years in the shadow of Mt Ararat. Our guesthouse offers three rooms. Photo by Maks Karochkin, CC by 2.0.", email: "wine@example.com", phone: "0000", website: "ancientvineyards.example", price: 50, photo: "wine.jpg", region_id: 7)

Farm.create(name: "Fertile Nile Farm", address: "Nile Road, Egypt", description: "We grow dates and vegetables. Our farm is thirty minutes from Giza and we offer five rooms. We can offer transportation to the Pyramids for a low price. Photo by Carol Walker, CC by 2.0.", email: "nile@example.com", phone: "0000", website: "fertilenile.example", price: 30, photo: "date.jpg", region_id: 8)

Farm.create(name: "Sheep Shelter Farm", address: "Old Sheep Road, New Zealand", description: "We have lots of sheep here. Our inn offers ten ensuite rooms.  Breakfast is included. Photo by Greg Bailey, CC by 2.0.", email: "sheep@example.com", phone: "0000", website: "sheepshelter.example", price: 80, photo: "sheep.jpg", region_id: 9)


Region.create(name: "Africa-Sub Saharan")
Region.create(name: "America-North")
Region.create(name: "America-Central/South")
Region.create(name: "Asia-Central")
Region.create(name: "Asia-East/SE")
Region.create(name: "Europe-North")
Region.create(name: "Europe-South")
Region.create(name: "Middle East/North Africa")
Region.create(name: "Pacific, Aus/NZ")

