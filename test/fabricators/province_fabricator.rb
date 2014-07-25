Fabricator(:province) do
  name { Faker::Name.name }
  country_id { 0 }
end
