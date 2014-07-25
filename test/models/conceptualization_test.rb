require 'test_helper'

class ConceptualizationTest < ActiveSupport::TestCase
  def setup
    @conceptualization = Fabricate(:conceptualization)
  end

  test 'create' do
    assert_difference ['Conceptualization.count', 'PaperTrail::Version.count'] do
      Conceptualization.create! Fabricate.attributes_for(:conceptualization)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Conceptualization.count' do
        @conceptualization.update!(attr: 'Updated')
      end
    end

    assert_equal 'Updated', @conceptualization.reload.attr
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Conceptualization.count', -1) { @conceptualization.destroy }
    end
  end

  test 'validates blank attributes' do
    @conceptualization.attr = ''

    assert @conceptualization.invalid?
    assert_equal 1, @conceptualization.errors.size
    assert_equal_messages @conceptualization, :attr, :blank
  end

  test 'validates unique attributes' do
    new_conceptualization = Fabricate(:conceptualization)
    @conceptualization.attr = new_conceptualization.attr

    assert @conceptualization.invalid?
    assert_equal 1, @conceptualization.errors.size
    assert_equal_messages @conceptualization, :attr, :taken
  end
end
