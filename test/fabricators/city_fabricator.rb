Fabricator(:city) do
  name { Faker::Name.name }
  province_id { 0 }
end
