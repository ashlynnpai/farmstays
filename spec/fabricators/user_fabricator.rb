Fabricator(:user) do
  email { Faker::Internet.email }
  password "password"
  password_confirmation "password"
  name { Faker::Name.name }
end

Fabricator(:farmer, from: :user) do
  farmer true
end

Fabricator(:admin, from: :user) do
  admin true
  farmer false
end