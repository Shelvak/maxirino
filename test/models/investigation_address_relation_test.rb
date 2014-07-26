require 'test_helper'

class InvestigationAddressRelationTest < ActiveSupport::TestCase
  def setup
    @investigation_address_relation = Fabricate(:investigation_address_relation)
  end

  test 'create' do
    assert_difference 'InvestigationAddressRelation.count' do
      assert_difference 'PaperTrail::Version.count', 6 do
        InvestigationAddressRelation.create! Fabricate.attributes_for(:investigation_address_relation)
      end
    end
  end
end
