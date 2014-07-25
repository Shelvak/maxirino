require 'test_helper'

class InvestigationPersonRelationTest < ActiveSupport::TestCase
  def setup
    @investigation_person_relation = Fabricate(:investigation_person_relation)
  end

  test 'create' do
    assert_difference ['InvestigationPersonRelation.count', 'PaperTrail::Version.count'] do
      InvestigationPersonRelation.create! Fabricate.attributes_for(:investigation_person_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'InvestigationPersonRelation.count' do
        @investigation_person_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @investigation_person_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('InvestigationPersonRelation.count', -1) { @investigation_person_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @investigation_person_relation.attr = ''

    assert @investigation_person_relation.invalid?
    assert_equal 1, @investigation_person_relation.errors.size
    assert_equal_messages @investigation_person_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_investigation_person_relation = Fabricate(:investigation_person_relation)
    @investigation_person_relation.attr = new_investigation_person_relation.attr

    assert @investigation_person_relation.invalid?
    assert_equal 1, @investigation_person_relation.errors.size
    assert_equal_messages @investigation_person_relation, :attr, :taken
  end
end
