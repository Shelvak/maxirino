require 'test_helper'

class LeaderPersonRelationTest < ActiveSupport::TestCase
  def setup
    @leader_person_relation = Fabricate(:leader_person_relation)
  end

  test 'create' do
    assert_difference ['LeaderPersonRelation.count', 'PaperTrail::Version.count'] do
      LeaderPersonRelation.create! Fabricate.attributes_for(:leader_person_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'LeaderPersonRelation.count' do
        @leader_person_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @leader_person_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('LeaderPersonRelation.count', -1) { @leader_person_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @leader_person_relation.attr = ''

    assert @leader_person_relation.invalid?
    assert_equal 1, @leader_person_relation.errors.size
    assert_equal_messages @leader_person_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_leader_person_relation = Fabricate(:leader_person_relation)
    @leader_person_relation.attr = new_leader_person_relation.attr

    assert @leader_person_relation.invalid?
    assert_equal 1, @leader_person_relation.errors.size
    assert_equal_messages @leader_person_relation, :attr, :taken
  end
end
