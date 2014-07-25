Fabricator(:person_address) do
  person_id { 0 }
  address_id { 0 }
  country_id { 0 }
  province_id { 0 }
  city_id { 0 }
  district_id { 0 }
  street_name { Faker::Name.name }
  street_number { Faker::Lorem.sentence }
end
