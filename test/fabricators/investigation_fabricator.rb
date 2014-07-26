Fabricator(:investigation) do
  status_id     { Fabricate(:investigation_status).id }
  category_id   { Fabricate(:investigation_category).id }
  start_date    { Date.today }
  end_date      { Date.today }
  title         { Faker::Lorem.sentence }
  detail        { Faker::Lorem.paragraph }
end
