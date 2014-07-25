require 'test_helper'

class InvestigationCategoriesControllerTest < ActionController::TestCase

  setup do
    @investigation_category = Fabricate(:investigation_category)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investigation_categories)
    assert_select '#unexpected_error', false
    assert_template "investigation_categories/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:investigation_category)
    assert_select '#unexpected_error', false
    assert_template "investigation_categories/new"
  end

  test "should create investigation_category" do
    assert_difference('InvestigationCategory.count') do
      post :create, investigation_category: Fabricate.attributes_for(:investigation_category)
    end

    assert_redirected_to investigation_category_url(assigns(:investigation_category))
  end

  test "should show investigation_category" do
    get :show, id: @investigation_category
    assert_response :success
    assert_not_nil assigns(:investigation_category)
    assert_select '#unexpected_error', false
    assert_template "investigation_categories/show"
  end

  test "should get edit" do
    get :edit, id: @investigation_category
    assert_response :success
    assert_not_nil assigns(:investigation_category)
    assert_select '#unexpected_error', false
    assert_template "investigation_categories/edit"
  end

  test "should update investigation_category" do
    put :update, id: @investigation_category, 
      investigation_category: Fabricate.attributes_for(:investigation_category, attr: 'value')
    assert_redirected_to investigation_category_url(assigns(:investigation_category))
  end

  test "should destroy investigation_category" do
    assert_difference('InvestigationCategory.count', -1) do
      delete :destroy, id: @investigation_category
    end

    assert_redirected_to investigation_categories_path
  end
end
