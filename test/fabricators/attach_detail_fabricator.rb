Fabricator(:attach_detail) do
  from        { Faker::Lorem.sentence }
  details     { Faker::Lorem.paragraph }
  attach_id   { Fabricate(:attach).id }
end
