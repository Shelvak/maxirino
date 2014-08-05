module InvestigationsHelper

  def investigation_status_select(form)
    collection = InvestigationStatus.all.map { |s| [s.name, s.id] }

    form.input :status_id, collection: collection, prompt: false
  end

  def investigation_category_select(form)
    collection = InvestigationCategory.all.map { |s| [s.name, s.id] }

    form.input :category_id, collection: collection, prompt: false
  end
end
