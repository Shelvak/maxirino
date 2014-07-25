require 'test_helper'

class InvestigationStatusTest < ActiveSupport::TestCase
  def setup
    @investigation_status = Fabricate(:investigation_status)
  end

  test 'create' do
    assert_difference ['InvestigationStatus.count', 'PaperTrail::Version.count'] do
      InvestigationStatus.create! Fabricate.attributes_for(:investigation_status)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'InvestigationStatus.count' do
        @investigation_status.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @investigation_status.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('InvestigationStatus.count', -1) { @investigation_status.destroy }
    end
  end

  test 'validates blank attributes' do
    @investigation_status.attr = ''

    assert @investigation_status.invalid?
    assert_equal 1, @investigation_status.errors.size
    assert_equal_messages @investigation_status, :attr, :blank
  end

  test 'validates unique attributes' do
    new_investigation_status = Fabricate(:investigation_status)
    @investigation_status.attr = new_investigation_status.attr

    assert @investigation_status.invalid?
    assert_equal 1, @investigation_status.errors.size
    assert_equal_messages @investigation_status, :attr, :taken
  end
end
