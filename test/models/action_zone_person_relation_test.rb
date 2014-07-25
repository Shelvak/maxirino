require 'test_helper'

class ActionZonePersonRelationTest < ActiveSupport::TestCase
  def setup
    @action_zone_person_relation = Fabricate(:action_zone_person_relation)
  end

  test 'create' do
    assert_difference ['ActionZonePersonRelation.count', 'PaperTrail::Version.count'] do
      ActionZonePersonRelation.create! Fabricate.attributes_for(:action_zone_person_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'ActionZonePersonRelation.count' do
        @action_zone_person_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @action_zone_person_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('ActionZonePersonRelation.count', -1) { @action_zone_person_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @action_zone_person_relation.attr = ''

    assert @action_zone_person_relation.invalid?
    assert_equal 1, @action_zone_person_relation.errors.size
    assert_equal_messages @action_zone_person_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_action_zone_person_relation = Fabricate(:action_zone_person_relation)
    @action_zone_person_relation.attr = new_action_zone_person_relation.attr

    assert @action_zone_person_relation.invalid?
    assert_equal 1, @action_zone_person_relation.errors.size
    assert_equal_messages @action_zone_person_relation, :attr, :taken
  end
end
