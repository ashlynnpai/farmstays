Fabricator(:user) do
  email { Faker::Internet.email }
  password { Faker::Internet.password(7) }
  name { Faker::Name.name }
end

Fabricator(:farmer, from: :user) do
  farmer true
end