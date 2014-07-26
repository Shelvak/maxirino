Fabricator(:identification) do
  number                  { Faker::Lorem.sentence }
  person_id               { Fabricate(:person).id }
  identification_type_id  { Fabricate(:identification_type).id }
end
