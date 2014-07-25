Fabricator(:person_person_relation) do
  person_1_id { 0 }
  person_2_id { 0 }
  link_type_id { 0 }
  since_date { Date.today }
  until_date { Date.today }
end
