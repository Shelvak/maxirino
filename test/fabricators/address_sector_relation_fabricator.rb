Fabricator(:address_sector_relation) do
  address_id { 0 }
  sector_id { 0 }
  percentage { 0 }
  detail { Faker::Lorem.sentence }
end
