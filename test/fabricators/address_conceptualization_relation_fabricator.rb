Fabricator(:address_conceptualization_relation) do
  address_id            { Fabricate(:address) }
  conceptualization_id  { Fabricate(:conceptualization) }
end
