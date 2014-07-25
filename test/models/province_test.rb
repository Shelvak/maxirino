require 'test_helper'

class ProvinceTest < ActiveSupport::TestCase
  def setup
    @province = Fabricate(:province)
  end

  test 'create' do
    assert_difference ['Province.count', 'PaperTrail::Version.count'] do
      Province.create! Fabricate.attributes_for(:province)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Province.count' do
        @province.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @province.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Province.count', -1) { @province.destroy }
    end
  end

  test 'validates blank attributes' do
    @province.attr = ''

    assert @province.invalid?
    assert_equal 1, @province.errors.size
    assert_equal_messages @province, :attr, :blank
  end

  test 'validates unique attributes' do
    new_province = Fabricate(:province)
    @province.attr = new_province.attr

    assert @province.invalid?
    assert_equal 1, @province.errors.size
    assert_equal_messages @province, :attr, :taken
  end
end
