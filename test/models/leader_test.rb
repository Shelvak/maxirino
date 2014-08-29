require 'test_helper'

class LeaderTest < ActiveSupport::TestCase
  def setup
    @leader = Fabricate(:leader)
  end

  test 'create' do
    assert_difference ['Leader.count', 'PaperTrail::Version.count'] do
      Leader.create! Fabricate.attributes_for(:leader)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Leader.count' do
        @leader.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @leader.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Leader.count', -1) { @leader.destroy }
    end
  end

  test 'validates blank attributes' do
    @leader.attr = ''

    assert @leader.invalid?
    assert_equal 1, @leader.errors.size
    assert_equal_messages @leader, :attr, :blank
  end

  test 'validates unique attributes' do
    new_leader = Fabricate(:leader)
    @leader.attr = new_leader.attr

    assert @leader.invalid?
    assert_equal 1, @leader.errors.size
    assert_equal_messages @leader, :attr, :taken
  end
end
