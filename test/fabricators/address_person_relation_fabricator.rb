Fabricator(:address_person_relation) do
  person_id             { Fabricate(:person).id }
  address_id            { Fabricate(:address).id }
  address_link_kind_id  { Fabricate(:address_link_kind).id }
end
