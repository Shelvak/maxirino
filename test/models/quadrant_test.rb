require 'test_helper'

class QuadrantTest < ActiveSupport::TestCase
  def setup
    @quadrant = Fabricate(:quadrant)
  end

  test 'create' do
    assert_difference ['Quadrant.count', 'PaperTrail::Version.count'] do
      Quadrant.create! Fabricate.attributes_for(:quadrant)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Quadrant.count' do
        @quadrant.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @quadrant.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Quadrant.count', -1) { @quadrant.destroy }
    end
  end

  test 'validates blank attributes' do
    @quadrant.attr = ''

    assert @quadrant.invalid?
    assert_equal 1, @quadrant.errors.size
    assert_equal_messages @quadrant, :attr, :blank
  end

  test 'validates unique attributes' do
    new_quadrant = Fabricate(:quadrant)
    @quadrant.attr = new_quadrant.attr

    assert @quadrant.invalid?
    assert_equal 1, @quadrant.errors.size
    assert_equal_messages @quadrant, :attr, :taken
  end
end
