Fabricator(:investigation_person_relation) do
  investigation_id  { Fabricate(:investigation).id }
  person_id         { Fabricate(:person).id }
end
