require 'test_helper'

class PhysicalFeatureTest < ActiveSupport::TestCase
  def setup
    @physical_feature = Fabricate(:physical_feature)
  end

  test 'create' do
    assert_difference ['PhysicalFeature.count', 'PaperTrail::Version.count'] do
      PhysicalFeature.create! Fabricate.attributes_for(:physical_feature)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'PhysicalFeature.count' do
        @physical_feature.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @physical_feature.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('PhysicalFeature.count', -1) { @physical_feature.destroy }
    end
  end

  test 'validates blank attributes' do
    @physical_feature.attr = ''

    assert @physical_feature.invalid?
    assert_equal 1, @physical_feature.errors.size
    assert_equal_messages @physical_feature, :attr, :blank
  end

  test 'validates unique attributes' do
    new_physical_feature = Fabricate(:physical_feature)
    @physical_feature.attr = new_physical_feature.attr

    assert @physical_feature.invalid?
    assert_equal 1, @physical_feature.errors.size
    assert_equal_messages @physical_feature, :attr, :taken
  end
end
