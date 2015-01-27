Fabricator(:farm) do
  name { Faker::Lorem.words(3).join("") }
  address { Faker::Address.street_address }
  description { Faker::Lorem.paragraph(3) }
  email { Faker::Internet.email }
  phone { Faker::PhoneNumber.phone_number }
  website { Faker::Internet.url }
  price { (20..120).to_a.sample }
  region_id { (1..9).to_a.sample }
end
  
