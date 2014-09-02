module AttachesHelper
  def attach_types_select_for_attaches(form)
    collection = AttachType.all.map { |at| [at.name, at.id] }

    form.input :attach_type_id, collection: collection, prompt: false, label: false
  end
end
