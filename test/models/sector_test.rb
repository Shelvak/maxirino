require 'test_helper'

class SectorTest < ActiveSupport::TestCase
  def setup
    @sector = Fabricate(:sector)
  end

  test 'create' do
    assert_difference ['Sector.count', 'PaperTrail::Version.count'] do
      Sector.create! Fabricate.attributes_for(:sector)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Sector.count' do
        @sector.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @sector.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Sector.count', -1) { @sector.destroy }
    end
  end

  test 'validates blank attributes' do
    @sector.attr = ''

    assert @sector.invalid?
    assert_equal 1, @sector.errors.size
    assert_equal_messages @sector, :attr, :blank
  end

  test 'validates unique attributes' do
    new_sector = Fabricate(:sector)
    @sector.attr = new_sector.attr

    assert @sector.invalid?
    assert_equal 1, @sector.errors.size
    assert_equal_messages @sector, :attr, :taken
  end
end
