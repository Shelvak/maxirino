require 'test_helper'

class AttachDetailTest < ActiveSupport::TestCase
  def setup
    @attach_detail = Fabricate(:attach_detail)
  end

  test 'create' do
    assert_difference ['AttachDetail.count', 'PaperTrail::Version.count'] do
      AttachDetail.create! Fabricate.attributes_for(:attach_detail)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'AttachDetail.count' do
        @attach_detail.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @attach_detail.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('AttachDetail.count', -1) { @attach_detail.destroy }
    end
  end

  test 'validates blank attributes' do
    @attach_detail.attr = ''

    assert @attach_detail.invalid?
    assert_equal 1, @attach_detail.errors.size
    assert_equal_messages @attach_detail, :attr, :blank
  end

  test 'validates unique attributes' do
    new_attach_detail = Fabricate(:attach_detail)
    @attach_detail.attr = new_attach_detail.attr

    assert @attach_detail.invalid?
    assert_equal 1, @attach_detail.errors.size
    assert_equal_messages @attach_detail, :attr, :taken
  end
end
