require 'test_helper'

class AddressSectorRelationTest < ActiveSupport::TestCase
  def setup
    @address_sector_relation = Fabricate(:address_sector_relation)
  end

  test 'create' do
    assert_difference ['AddressSectorRelation.count', 'PaperTrail::Version.count'] do
      AddressSectorRelation.create! Fabricate.attributes_for(:address_sector_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'AddressSectorRelation.count' do
        @address_sector_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @address_sector_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('AddressSectorRelation.count', -1) { @address_sector_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @address_sector_relation.attr = ''

    assert @address_sector_relation.invalid?
    assert_equal 1, @address_sector_relation.errors.size
    assert_equal_messages @address_sector_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_address_sector_relation = Fabricate(:address_sector_relation)
    @address_sector_relation.attr = new_address_sector_relation.attr

    assert @address_sector_relation.invalid?
    assert_equal 1, @address_sector_relation.errors.size
    assert_equal_messages @address_sector_relation, :attr, :taken
  end
end
