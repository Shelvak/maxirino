require 'test_helper'

class InvestigationCategoryTest < ActiveSupport::TestCase
  def setup
    @investigation_category = Fabricate(:investigation_category)
  end

  test 'create' do
    assert_difference ['InvestigationCategory.count', 'PaperTrail::Version.count'] do
      InvestigationCategory.create! Fabricate.attributes_for(:investigation_category)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'InvestigationCategory.count' do
        @investigation_category.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @investigation_category.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('InvestigationCategory.count', -1) { @investigation_category.destroy }
    end
  end

  test 'validates blank attributes' do
    @investigation_category.attr = ''

    assert @investigation_category.invalid?
    assert_equal 1, @investigation_category.errors.size
    assert_equal_messages @investigation_category, :attr, :blank
  end

  test 'validates unique attributes' do
    new_investigation_category = Fabricate(:investigation_category)
    @investigation_category.attr = new_investigation_category.attr

    assert @investigation_category.invalid?
    assert_equal 1, @investigation_category.errors.size
    assert_equal_messages @investigation_category, :attr, :taken
  end
end
