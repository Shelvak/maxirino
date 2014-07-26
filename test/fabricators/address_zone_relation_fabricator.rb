Fabricator(:address_zone_relation) do
  address_id  { Fabricate(:address).id }
  zone_id     { Fabricate(:zone).id }
end
