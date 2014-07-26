Fabricator(:town) do
  name      { Faker::Name.name }
  city_id   { Fabricate(:city).id }
end
