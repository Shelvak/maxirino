require 'test_helper'

class TownTest < ActiveSupport::TestCase
  def setup
    @town = Fabricate(:town)
  end

  test 'create' do
    assert_difference ['Town.count', 'PaperTrail::Version.count'] do
      Town.create! Fabricate.attributes_for(:town)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Town.count' do
        @town.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @town.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Town.count', -1) { @town.destroy }
    end
  end

  test 'validates blank attributes' do
    @town.attr = ''

    assert @town.invalid?
    assert_equal 1, @town.errors.size
    assert_equal_messages @town, :attr, :blank
  end

  test 'validates unique attributes' do
    new_town = Fabricate(:town)
    @town.attr = new_town.attr

    assert @town.invalid?
    assert_equal 1, @town.errors.size
    assert_equal_messages @town, :attr, :taken
  end
end
