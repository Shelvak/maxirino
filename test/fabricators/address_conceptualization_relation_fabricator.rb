Fabricator(:address_conceptualization_relation) do
  address_id            { Fabricate(:address).id }
  conceptualization_id  { Fabricate(:conceptualization).id }
end
