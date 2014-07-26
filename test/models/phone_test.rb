require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  def setup
    @phone = Fabricate(:phone)
  end

  test 'create' do
    assert_difference 'Phone.count' do
      assert_difference  'PaperTrail::Version.count', 2 do
        Phone.create! Fabricate.attributes_for(:phone)
      end
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Phone.count' do
        @phone.update!(number: 'Updated')
      end
    end

    assert_equal 'Updated', @phone.reload.number
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Phone.count', -1) { @phone.destroy }
    end
  end

  test 'validates blank numbeributes' do
    @phone.number = ''

    assert @phone.invalid?
    assert_equal 1, @phone.errors.size
    assert_equal_messages @phone, :number, :blank
  end

  test 'validates unique numbeributes' do
    new_phone = Fabricate(:phone, person_id: @phone.person_id)
    @phone.number = new_phone.number

    assert @phone.invalid?
    assert_equal 1, @phone.errors.size
    assert_equal_messages @phone, :number, :taken
  end
end
