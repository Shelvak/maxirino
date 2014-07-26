Fabricator(:conceptualization_person_relation) do
  person_id             { Fabicate(:person).id }
  conceptualization_id  { Fabricate(:conceptualization).id }
end
