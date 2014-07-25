Fabricator(:phone) do
  person_id { 0 }
  phone { Faker::Lorem.sentence }
  details { Faker::Lorem.sentence }
end
