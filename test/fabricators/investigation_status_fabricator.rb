Fabricator(:investigation_status) do
  name { Faker::Name.name[0..30] }
end
