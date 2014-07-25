require 'test_helper'

class PersonPersonRelationTest < ActiveSupport::TestCase
  def setup
    @person_person_relation = Fabricate(:person_person_relation)
  end

  test 'create' do
    assert_difference ['PersonPersonRelation.count', 'PaperTrail::Version.count'] do
      PersonPersonRelation.create! Fabricate.attributes_for(:person_person_relation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'PersonPersonRelation.count' do
        @person_person_relation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @person_person_relation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('PersonPersonRelation.count', -1) { @person_person_relation.destroy }
    end
  end

  test 'validates blank attributes' do
    @person_person_relation.attr = ''

    assert @person_person_relation.invalid?
    assert_equal 1, @person_person_relation.errors.size
    assert_equal_messages @person_person_relation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_person_person_relation = Fabricate(:person_person_relation)
    @person_person_relation.attr = new_person_person_relation.attr

    assert @person_person_relation.invalid?
    assert_equal 1, @person_person_relation.errors.size
    assert_equal_messages @person_person_relation, :attr, :taken
  end
end
