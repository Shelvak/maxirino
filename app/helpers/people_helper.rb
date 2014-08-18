module PeopleHelper
  def person_sex_input(form)
    collection = Person::SEX.map do |k, v|
      [I18n.t('view.people.sex.' + v), v]
    end

    form.input :sex, collection: collection, prompt: false
  end

  def identification_type_select_for_people(form)
    collection = IdentificationType.all.map { |type| [type.name, type.id] }

    form.input :identification_type_id, collection: collection, prompt: false,
      label: false
  end
end
