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
        @action_zone.update!(name: 'Updated')
      end
    end

    assert_equal 'Updated', @action_zone.reload.name
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('ActionZone.count', -1) { @action_zone.destroy }
    end
  end

  test 'validates blank nameibutes' do
    @action_zone.name = ''

    assert @action_zone.invalid?
    assert_equal 1, @action_zone.errors.size
    assert_equal_messages @action_zone, :name, :blank
  end

  test 'validates unique nameibutes' do
    new_action_zone = Fabricate(:action_zone)
    @action_zone.name = new_action_zone.name

    assert @action_zone.invalid?
    assert_equal 1, @action_zone.errors.size
    assert_equal_messages @action_zone, :name, :taken
  end
end
