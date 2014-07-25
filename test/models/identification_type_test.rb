require 'test_helper'

class IdentificationTypeTest < ActiveSupport::TestCase
  def setup
    @identification_type = Fabricate(:identification_type)
  end

  test 'create' do
    assert_difference ['IdentificationType.count', 'PaperTrail::Version.count'] do
      IdentificationType.create! Fabricate.attributes_for(:identification_type)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'IdentificationType.count' do
        @identification_type.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @identification_type.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('IdentificationType.count', -1) { @identification_type.destroy }
    end
  end

  test 'validates blank attributes' do
    @identification_type.attr = ''

    assert @identification_type.invalid?
    assert_equal 1, @identification_type.errors.size
    assert_equal_messages @identification_type, :attr, :blank
  end

  test 'validates unique attributes' do
    new_identification_type = Fabricate(:identification_type)
    @identification_type.attr = new_identification_type.attr

    assert @identification_type.invalid?
    assert_equal 1, @identification_type.errors.size
    assert_equal_messages @identification_type, :attr, :taken
  end
end
