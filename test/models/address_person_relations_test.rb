require 'test_helper'

class AddressPersonRelationsTest < ActiveSupport::TestCase
  def setup
    @address_person_relation = Fabricate(:address_person_relation)
  end

  test 'create' do
    assert_difference ['AddressPersonRelations.count', 'PaperTrail::Version.count'] do
      AddressPersonRelations.create! Fabricate.attributes_for(:address_person_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'AddressPersonRelations.count' do
        @address_person_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @address_person_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('AddressPersonRelations.count', -1) { @address_person_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @address_person_relation.attr = ''

    assert @address_person_relation.invalid?
    assert_equal 1, @address_person_relation.errors.size
    assert_equal_messages @address_person_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_address_person_relation = Fabricate(:address_person_relation)
    @address_person_relation.attr = new_address_person_relation.attr

    assert @address_person_relation.invalid?
    assert_equal 1, @address_person_relation.errors.size
    assert_equal_messages @address_person_relation, :attr, :taken
  end
end
