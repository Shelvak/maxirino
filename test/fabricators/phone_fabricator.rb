Fabricator(:phone) do
  person_id { Fabricate(:person).id }
  number    { Faker::PhoneNumber.phone_number }
  details   { Faker::Lorem.sentence }
end
