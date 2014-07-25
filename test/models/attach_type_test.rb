require 'test_helper'

class AttachTypeTest < ActiveSupport::TestCase
  def setup
    @attach_type = Fabricate(:attach_type)
  end

  test 'create' do
    assert_difference ['AttachType.count', 'PaperTrail::Version.count'] do
      AttachType.create! Fabricate.attributes_for(:attach_type)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'AttachType.count' do
        @attach_type.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @attach_type.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('AttachType.count', -1) { @attach_type.destroy }
    end
  end

  test 'validates blank attributes' do
    @attach_type.attr = ''

    assert @attach_type.invalid?
    assert_equal 1, @attach_type.errors.size
    assert_equal_messages @attach_type, :attr, :blank
  end

  test 'validates unique attributes' do
    new_attach_type = Fabricate(:attach_type)
    @attach_type.attr = new_attach_type.attr

    assert @attach_type.invalid?
    assert_equal 1, @attach_type.errors.size
    assert_equal_messages @attach_type, :attr, :taken
  end
end
