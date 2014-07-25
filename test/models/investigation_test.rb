require 'test_helper'

class InvestigationTest < ActiveSupport::TestCase
  def setup
    @investigation = Fabricate(:investigation)
  end

  test 'create' do
    assert_difference ['Investigation.count', 'PaperTrail::Version.count'] do
      Investigation.create! Fabricate.attributes_for(:investigation)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Investigation.count' do
        @investigation.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @investigation.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Investigation.count', -1) { @investigation.destroy }
    end
  end

  test 'validates blank attributes' do
    @investigation.attr = ''

    assert @investigation.invalid?
    assert_equal 1, @investigation.errors.size
    assert_equal_messages @investigation, :attr, :blank
  end

  test 'validates unique attributes' do
    new_investigation = Fabricate(:investigation)
    @investigation.attr = new_investigation.attr

    assert @investigation.invalid?
    assert_equal 1, @investigation.errors.size
    assert_equal_messages @investigation, :attr, :taken
  end
end
