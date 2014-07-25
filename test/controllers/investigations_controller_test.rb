require 'test_helper'

class InvestigationsControllerTest < ActionController::TestCase

  setup do
    @investigation = Fabricate(:investigation)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investigations)
    assert_select '#unexpected_error', false
    assert_template "investigations/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:investigation)
    assert_select '#unexpected_error', false
    assert_template "investigations/new"
  end

  test "should create investigation" do
    assert_difference('Investigation.count') do
      post :create, investigation: Fabricate.attributes_for(:investigation)
    end

    assert_redirected_to investigation_url(assigns(:investigation))
  end

  test "should show investigation" do
    get :show, id: @investigation
    assert_response :success
    assert_not_nil assigns(:investigation)
    assert_select '#unexpected_error', false
    assert_template "investigations/show"
  end

  test "should get edit" do
    get :edit, id: @investigation
    assert_response :success
    assert_not_nil assigns(:investigation)
    assert_select '#unexpected_error', false
    assert_template "investigations/edit"
  end

  test "should update investigation" do
    put :update, id: @investigation, 
      investigation: Fabricate.attributes_for(:investigation, attr: 'value')
    assert_redirected_to investigation_url(assigns(:investigation))
  end

  test "should destroy investigation" do
    assert_difference('Investigation.count', -1) do
      delete :destroy, id: @investigation
    end

    assert_redirected_to investigations_path
  end
end
