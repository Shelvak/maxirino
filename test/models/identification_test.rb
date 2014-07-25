require 'test_helper'

class IdentificationTest < ActiveSupport::TestCase
  def setup
    @identification = Fabricate(:identification)
  end

  test 'create' do
    assert_difference ['Identification.count', 'PaperTrail::Version.count'] do
      Identification.create! Fabricate.attributes_for(:identification)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Identification.count' do
        @identification.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @identification.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Identification.count', -1) { @identification.destroy }
    end
  end

  test 'validates blank attributes' do
    @identification.attr = ''

    assert @identification.invalid?
    assert_equal 1, @identification.errors.size
    assert_equal_messages @identification, :attr, :blank
  end

  test 'validates unique attributes' do
    new_identification = Fabricate(:identification)
    @identification.attr = new_identification.attr

    assert @identification.invalid?
    assert_equal 1, @identification.errors.size
    assert_equal_messages @identification, :attr, :taken
  end
end
