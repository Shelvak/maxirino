Fabricator(:leader_person_relation) do
  person_id           { Fabricate(:person).id }
  leader_id { Fabricate(:leader).id }
end
