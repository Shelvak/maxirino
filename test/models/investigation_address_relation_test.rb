require 'test_helper'

class InvestigationAddressRelationTest < ActiveSupport::TestCase
  def setup
    @investigation_address_relation = Fabricate(:investigation_address_relation)
  end

  test 'create' do
    assert_difference ['InvestigationAddressRelation.count', 'PaperTrail::Version.count'] do
      InvestigationAddressRelation.create! Fabricate.attributes_for(:investigation_address_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'InvestigationAddressRelation.count' do
        @investigation_address_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @investigation_address_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('InvestigationAddressRelation.count', -1) { @investigation_address_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @investigation_address_relation.attr = ''

    assert @investigation_address_relation.invalid?
    assert_equal 1, @investigation_address_relation.errors.size
    assert_equal_messages @investigation_address_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_investigation_address_relation = Fabricate(:investigation_address_relation)
    @investigation_address_relation.attr = new_investigation_address_relation.attr

    assert @investigation_address_relation.invalid?
    assert_equal 1, @investigation_address_relation.errors.size
    assert_equal_messages @investigation_address_relation, :attr, :taken
  end
end
