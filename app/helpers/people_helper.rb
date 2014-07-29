module PeopleHelper
  def person_sex_input(form)
    collection = Person::SEX.map do |k, v|
      [I18n.t('people.sex.' + v), v]
    end

    form.input :sex, collection: collection, prompt: false
  end
end
