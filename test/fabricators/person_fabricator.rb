Fabricator(:person) do |p|
  p.first_name  { Faker::Name.name[0..99] }
  p.last_name   { Faker::Name.name[0..59] }
  p.birthday    { Date.today }
  p.father      { Faker::Lorem.sentence[0..59] }
  p.mother      { Faker::Lorem.sentence[0..59] }
  p.notes       { Faker::Lorem.paragraph }
  p.sex         { [true, false].sample }
  p.alias       { Faker::Lorem.sentence[0..99] }
end
