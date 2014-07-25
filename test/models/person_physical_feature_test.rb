require 'test_helper'

class PersonPhysicalFeatureTest < ActiveSupport::TestCase
  def setup
    @person_physical_feature = Fabricate(:person_physical_feature)
  end

  test 'create' do
    assert_difference ['PersonPhysicalFeature.count', 'PaperTrail::Version.count'] do
      PersonPhysicalFeature.create! Fabricate.attributes_for(:person_physical_feature)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'PersonPhysicalFeature.count' do
        @person_physical_feature.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @person_physical_feature.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('PersonPhysicalFeature.count', -1) { @person_physical_feature.destroy }
    end
  end

  test 'validates blank attributes' do
    @person_physical_feature.attr = ''

    assert @person_physical_feature.invalid?
    assert_equal 1, @person_physical_feature.errors.size
    assert_equal_messages @person_physical_feature, :attr, :blank
  end

  test 'validates unique attributes' do
    new_person_physical_feature = Fabricate(:person_physical_feature)
    @person_physical_feature.attr = new_person_physical_feature.attr

    assert @person_physical_feature.invalid?
    assert_equal 1, @person_physical_feature.errors.size
    assert_equal_messages @person_physical_feature, :attr, :taken
  end
end
