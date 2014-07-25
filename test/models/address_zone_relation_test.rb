require 'test_helper'

class AddressZoneRelationTest < ActiveSupport::TestCase
  def setup
    @address_zone_relation = Fabricate(:address_zone_relation)
  end

  test 'create' do
    assert_difference ['AddressZoneRelation.count', 'PaperTrail::Version.count'] do
      AddressZoneRelation.create! Fabricate.attributes_for(:address_zone_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'AddressZoneRelation.count' do
        @address_zone_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @address_zone_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('AddressZoneRelation.count', -1) { @address_zone_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @address_zone_relation.attr = ''

    assert @address_zone_relation.invalid?
    assert_equal 1, @address_zone_relation.errors.size
    assert_equal_messages @address_zone_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_address_zone_relation = Fabricate(:address_zone_relation)
    @address_zone_relation.attr = new_address_zone_relation.attr

    assert @address_zone_relation.invalid?
    assert_equal 1, @address_zone_relation.errors.size
    assert_equal_messages @address_zone_relation, :attr, :taken
  end
end
