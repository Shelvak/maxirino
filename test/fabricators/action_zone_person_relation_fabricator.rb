Fabricator(:action_zone_person_relation) do
  person_id       { Fabricate(:person).id }
  action_zone_id  { Fabricate(:action_zone).id }
end
