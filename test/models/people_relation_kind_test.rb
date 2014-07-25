require 'test_helper'

class PeopleRelationKindTest < ActiveSupport::TestCase
  def setup
    @people_relation_kind = Fabricate(:people_relation_kind)
  end

  test 'create' do
    assert_difference ['PeopleRelationKind.count', 'PaperTrail::Version.count'] do
      PeopleRelationKind.create! Fabricate.attributes_for(:people_relation_kind)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'PeopleRelationKind.count' do
        @people_relation_kind.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @people_relation_kind.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('PeopleRelationKind.count', -1) { @people_relation_kind.destroy }
    end
  end

  test 'validates blank attributes' do
    @people_relation_kind.attr = ''

    assert @people_relation_kind.invalid?
    assert_equal 1, @people_relation_kind.errors.size
    assert_equal_messages @people_relation_kind, :attr, :blank
  end

  test 'validates unique attributes' do
    new_people_relation_kind = Fabricate(:people_relation_kind)
    @people_relation_kind.attr = new_people_relation_kind.attr

    assert @people_relation_kind.invalid?
    assert_equal 1, @people_relation_kind.errors.size
    assert_equal_messages @people_relation_kind, :attr, :taken
  end
end
