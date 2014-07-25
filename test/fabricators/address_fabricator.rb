Fabricator(:address) do
  address_type_id { 0 }
  number { Faker::Lorem.sentence }
  between { Faker::Lorem.sentence }
  street { Faker::Lorem.sentence }
  notes { Faker::Lorem.paragraph }
end
