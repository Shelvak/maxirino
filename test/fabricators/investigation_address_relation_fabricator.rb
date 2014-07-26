Fabricator(:investigation_address_relation) do
  address_id        { Fabricate(:address).id }
  investigation_id  { Fabricate(:investigation).id }
end
