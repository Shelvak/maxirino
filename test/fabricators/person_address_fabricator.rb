Fabricator(:person_address) do
  person_id       { Fabricate(:person).id }
  city_id         { Fabricate(:city).id }
  province_id     { |attrs| City.find(attrs[:city_id]).province_id }
  country_id      { |attrs| Province.find(attrs[:province_id]).country_id }
  zone_id         { Fabricate(:zone).id }
  address_id      { Fabricate(:address).id }
  street_name     { Faker::Name.name }
  street_number   { Faker::Lorem.sentence }
end
