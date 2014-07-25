Fabricator(:investigation) do
  investigation_status_id { 0 }
  category_id { 0 }
  start_date { Date.today }
  end_date { Date.today }
  title { Faker::Lorem.sentence }
  detail { Faker::Lorem.paragraph }
end
