require 'test_helper'

class PersonAddressTest < ActiveSupport::TestCase
  def setup
    @person_address = Fabricate(:person_address)
  end

  test 'create' do
    assert_difference ['PersonAddress.count', 'PaperTrail::Version.count'] do
      PersonAddress.create! Fabricate.attributes_for(:person_address)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'PersonAddress.count' do
        @person_address.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @person_address.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('PersonAddress.count', -1) { @person_address.destroy }
    end
  end

  test 'validates blank attributes' do
    @person_address.attr = ''

    assert @person_address.invalid?
    assert_equal 1, @person_address.errors.size
    assert_equal_messages @person_address, :attr, :blank
  end

  test 'validates unique attributes' do
    new_person_address = Fabricate(:person_address)
    @person_address.attr = new_person_address.attr

    assert @person_address.invalid?
    assert_equal 1, @person_address.errors.size
    assert_equal_messages @person_address, :attr, :taken
  end
end
