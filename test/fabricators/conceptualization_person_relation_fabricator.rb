Fabricator(:conceptualization_person_relation) do
  person_id             { Fabricate(:person).id }
  conceptualization_id  { Fabricate(:conceptualization).id }
end
