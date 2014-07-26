Fabricator(:attach) do
  file              { Faker::Lorem.sentence }
  title             { Faker::Lorem.sentence }
  attach_type_id    { Fabricate(:attach_type).id }
  person_id         { Fabricate(:person).id }
end
