require 'test_helper'

class AddressConceptualizationRelationsTest < ActiveSupport::TestCase
  def setup
    @address_conceptualization_relation = Fabricate(:address_conceptualization_relation)
  end

  test 'create' do
    assert_difference ['AddressConceptualizationRelations.count', 'PaperTrail::Version.count'] do
      AddressConceptualizationRelations.create! Fabricate.attributes_for(:address_conceptualization_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'AddressConceptualizationRelations.count' do
        @address_conceptualization_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @address_conceptualization_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('AddressConceptualizationRelations.count', -1) { @address_conceptualization_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @address_conceptualization_relation.attr = ''

    assert @address_conceptualization_relation.invalid?
    assert_equal 1, @address_conceptualization_relation.errors.size
    assert_equal_messages @address_conceptualization_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_address_conceptualization_relation = Fabricate(:address_conceptualization_relation)
    @address_conceptualization_relation.attr = new_address_conceptualization_relation.attr

    assert @address_conceptualization_relation.invalid?
    assert_equal 1, @address_conceptualization_relation.errors.size
    assert_equal_messages @address_conceptualization_relation, :attr, :taken
  end
end
