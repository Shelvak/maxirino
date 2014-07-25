require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  def setup
    @phone = Fabricate(:phone)
  end

  test 'create' do
    assert_difference ['Phone.count', 'PaperTrail::Version.count'] do
      Phone.create! Fabricate.attributes_for(:phone)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Phone.count' do
        @phone.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @phone.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Phone.count', -1) { @phone.destroy }
    end
  end

  test 'validates blank attributes' do
    @phone.attr = ''

    assert @phone.invalid?
    assert_equal 1, @phone.errors.size
    assert_equal_messages @phone, :attr, :blank
  end

  test 'validates unique attributes' do
    new_phone = Fabricate(:phone)
    @phone.attr = new_phone.attr

    assert @phone.invalid?
    assert_equal 1, @phone.errors.size
    assert_equal_messages @phone, :attr, :taken
  end
end
