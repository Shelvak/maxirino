require 'test_helper'

class AddressLinkKindTest < ActiveSupport::TestCase
  def setup
    @address_link_kind = Fabricate(:address_link_kind)
  end

  test 'create' do
    assert_difference ['AddressLinkKind.count', 'PaperTrail::Version.count'] do
      AddressLinkKind.create! Fabricate.attributes_for(:address_link_kind)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'AddressLinkKind.count' do
        @address_link_kind.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @address_link_kind.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('AddressLinkKind.count', -1) { @address_link_kind.destroy }
    end
  end

  test 'validates blank attributes' do
    @address_link_kind.attr = ''

    assert @address_link_kind.invalid?
    assert_equal 1, @address_link_kind.errors.size
    assert_equal_messages @address_link_kind, :attr, :blank
  end

  test 'validates unique attributes' do
    new_address_link_kind = Fabricate(:address_link_kind)
    @address_link_kind.attr = new_address_link_kind.attr

    assert @address_link_kind.invalid?
    assert_equal 1, @address_link_kind.errors.size
    assert_equal_messages @address_link_kind, :attr, :taken
  end
end
