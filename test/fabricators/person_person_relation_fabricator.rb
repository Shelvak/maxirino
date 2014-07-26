Fabricator(:person_person_relation) do
  person_1_id     { Fabricate(:person).id }
  person_2_id     { Fabricate(:person).id }
  link_kind_id    { Fabricate(:people_relation_kind).id }
  since_date      { Date.today }
  until_date      { Date.today }
end
