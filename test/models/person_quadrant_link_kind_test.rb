require 'test_helper'

class PersonQuadrantLinkKindTest < ActiveSupport::TestCase
  def setup
    @person_quadrant_link_kind = Fabricate(:person_quadrant_link_kind)
  end

  test 'create' do
    assert_difference ['PersonQuadrantLinkKind.count', 'PaperTrail::Version.count'] do
      PersonQuadrantLinkKind.create! Fabricate.attributes_for(:person_quadrant_link_kind)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'PersonQuadrantLinkKind.count' do
        @person_quadrant_link_kind.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @person_quadrant_link_kind.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('PersonQuadrantLinkKind.count', -1) { @person_quadrant_link_kind.destroy }
    end
  end

  test 'validates blank attributes' do
    @person_quadrant_link_kind.attr = ''

    assert @person_quadrant_link_kind.invalid?
    assert_equal 1, @person_quadrant_link_kind.errors.size
    assert_equal_messages @person_quadrant_link_kind, :attr, :blank
  end

  test 'validates unique attributes' do
    new_person_quadrant_link_kind = Fabricate(:person_quadrant_link_kind)
    @person_quadrant_link_kind.attr = new_person_quadrant_link_kind.attr

    assert @person_quadrant_link_kind.invalid?
    assert_equal 1, @person_quadrant_link_kind.errors.size
    assert_equal_messages @person_quadrant_link_kind, :attr, :taken
  end
end
