Fabricator(:address_sector_relation) do
  address_id    { Fabricate(:address).id }
  sector_id     { Fabricate(:sector).id }
  percentage    { rand * 100 }
  detail        { Faker::Lorem.sentence }
end
