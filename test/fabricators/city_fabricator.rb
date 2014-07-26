Fabricator(:city) do
  name          { Faker::Name.name }
  province_id   { Fabricate(:province).id }
end
