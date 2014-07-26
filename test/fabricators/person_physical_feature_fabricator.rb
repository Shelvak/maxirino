Fabricator(:person_physical_feature) do
  person_id           { Fabricate(:person).id }
  physical_feature_id { Fabricate(:physical_feature).id }
end
