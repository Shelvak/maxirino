Fabricator(:investigation_status) do
  name { Faker::Name.name[0..29] }
end
