require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  def setup
    @country = Fabricate(:country)
  end

  test 'create' do
    assert_difference ['Country.count', 'PaperTrail::Version.count'] do
      Country.create! Fabricate.attributes_for(:country)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Country.count' do
        @country.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @country.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Country.count', -1) { @country.destroy }
    end
  end

  test 'validates blank attributes' do
    @country.attr = ''

    assert @country.invalid?
    assert_equal 1, @country.errors.size
    assert_equal_messages @country, :attr, :blank
  end

  test 'validates unique attributes' do
    new_country = Fabricate(:country)
    @country.attr = new_country.attr

    assert @country.invalid?
    assert_equal 1, @country.errors.size
    assert_equal_messages @country, :attr, :taken
  end
end
