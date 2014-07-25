require 'test_helper'

class ActionZoneTest < ActiveSupport::TestCase
  def setup
    @action_zone = Fabricate(:action_zone)
  end

  test 'create' do
    assert_difference ['ActionZone.count', 'PaperTrail::Version.count'] do
      ActionZone.create! Fabricate.attributes_for(:action_zone)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'ActionZone.count' do
        @action_zone.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @action_zone.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('ActionZone.count', -1) { @action_zone.destroy }
    end
  end

  test 'validates blank attributes' do
    @action_zone.attr = ''

    assert @action_zone.invalid?
    assert_equal 1, @action_zone.errors.size
    assert_equal_messages @action_zone, :attr, :blank
  end

  test 'validates unique attributes' do
    new_action_zone = Fabricate(:action_zone)
    @action_zone.attr = new_action_zone.attr

    assert @action_zone.invalid?
    assert_equal 1, @action_zone.errors.size
    assert_equal_messages @action_zone, :attr, :taken
  end
end
