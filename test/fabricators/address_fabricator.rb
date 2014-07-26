Fabricator(:address) do
  address_type_id { Fabricate(:address_link_kind).id }
  number          { Faker::Name.name[0..100] }
  between         { Faker::Name.name[0..100] }
  street          { Faker::Name.name[0..100] }
  notes           { Faker::Lorem.paragraph }
end
