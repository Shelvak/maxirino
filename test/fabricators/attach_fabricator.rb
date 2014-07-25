Fabricator(:attach) do
  attach_type_id { 0 }
  file { Faker::Lorem.sentence }
  title { Faker::Lorem.sentence }
  attach_detail_id { 0 }
  person_id { 0 }
end
