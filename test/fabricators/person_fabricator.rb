Fabricator(:person) do
  first_name { Faker::Name.name }
  last_name { Faker::Name.name }
  birthday { Date.today }
  father { Faker::Lorem.sentence }
  mother { Faker::Lorem.sentence }
  notes { Faker::Lorem.paragraph }
  record { Faker::Lorem.sentence }
  sex { boolean }
  alias { Faker::Lorem.sentence }
end
