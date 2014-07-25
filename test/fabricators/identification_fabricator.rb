Fabricator(:identification) do
  number { Faker::Lorem.sentence }
  person_id { 0 }
  identification_type_id { 0 }
end
