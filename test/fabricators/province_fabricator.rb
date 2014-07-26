Fabricator(:province) do
  name       { Faker::Name.name }
  country_id { Fabricate(:country).id }
end
