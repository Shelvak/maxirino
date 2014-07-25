require 'test_helper'

class ConceptualizationPersonRelationTest < ActiveSupport::TestCase
  def setup
    @conceptualization_person_relation = Fabricate(:conceptualization_person_relation)
  end

  test 'create' do
    assert_difference ['ConceptualizationPersonRelation.count', 'PaperTrail::Version.count'] do
      ConceptualizationPersonRelation.create! Fabricate.attributes_for(:conceptualization_person_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'ConceptualizationPersonRelation.count' do
        @conceptualization_person_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @conceptualization_person_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('ConceptualizationPersonRelation.count', -1) { @conceptualization_person_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @conceptualization_person_relation.attr = ''

    assert @conceptualization_person_relation.invalid?
    assert_equal 1, @conceptualization_person_relation.errors.size
    assert_equal_messages @conceptualization_person_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_conceptualization_person_relation = Fabricate(:conceptualization_person_relation)
    @conceptualization_person_relation.attr = new_conceptualization_person_relation.attr

    assert @conceptualization_person_relation.invalid?
    assert_equal 1, @conceptualization_person_relation.errors.size
    assert_equal_messages @conceptualization_person_relation, :attr, :taken
  end
end
