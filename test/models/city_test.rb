require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def setup
    @city = Fabricate(:city)
  end

  test 'create' do
    assert_difference ['City.count', 'PaperTrail::Version.count'] do
      City.create! Fabricate.attributes_for(:city)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'City.count' do
        @city.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @city.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('City.count', -1) { @city.destroy }
    end
  end

  test 'validates blank attributes' do
    @city.attr = ''

    assert @city.invalid?
    assert_equal 1, @city.errors.size
    assert_equal_messages @city, :attr, :blank
  end

  test 'validates unique attributes' do
    new_city = Fabricate(:city)
    @city.attr = new_city.attr

    assert @city.invalid?
    assert_equal 1, @city.errors.size
    assert_equal_messages @city, :attr, :taken
  end
end
