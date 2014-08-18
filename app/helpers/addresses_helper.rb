module AddressesHelper
  def address_type_collection
    AddressLinkKind.all.map { |a| [a.name, a.id] }
  end
  def type_selector_for_address(form)
    form.input :address_type_id, collection: address_type_collection,
      prompt: false
  end
end
