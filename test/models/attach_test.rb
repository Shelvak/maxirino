require 'test_helper'

class AttachTest < ActiveSupport::TestCase
  def setup
    @attach = Fabricate(:attach)
  end

  test 'create' do
    assert_difference ['Attach.count', 'PaperTrail::Version.count'] do
      Attach.create! Fabricate.attributes_for(:attach)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Attach.count' do
        @attach.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @attach.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Attach.count', -1) { @attach.destroy }
    end
  end

  test 'validates blank attributes' do
    @attach.attr = ''

    assert @attach.invalid?
    assert_equal 1, @attach.errors.size
    assert_equal_messages @attach, :attr, :blank
  end

  test 'validates unique attributes' do
    new_attach = Fabricate(:attach)
    @attach.attr = new_attach.attr

    assert @attach.invalid?
    assert_equal 1, @attach.errors.size
    assert_equal_messages @attach, :attr, :taken
  end
end
