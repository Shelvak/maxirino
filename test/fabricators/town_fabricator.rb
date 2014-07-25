Fabricator(:town) do
  name { Faker::Name.name }
  city_id { 0 }
end
