require 'test_helper'

class InvestigationStatusesControllerTest < ActionController::TestCase

  setup do
    @investigation_status = Fabricate(:investigation_status)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investigation_statuses)
    assert_select '#unexpected_error', false
    assert_template "investigation_statuses/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:investigation_status)
    assert_select '#unexpected_error', false
    assert_template "investigation_statuses/new"
  end

  test "should create investigation_status" do
    assert_difference('InvestigationStatus.count') do
      post :create, investigation_status: Fabricate.attributes_for(:investigation_status)
    end

    assert_redirected_to investigation_status_url(assigns(:investigation_status))
  end

  test "should show investigation_status" do
    get :show, id: @investigation_status
    assert_response :success
    assert_not_nil assigns(:investigation_status)
    assert_select '#unexpected_error', false
    assert_template "investigation_statuses/show"
  end

  test "should get edit" do
    get :edit, id: @investigation_status
    assert_response :success
    assert_not_nil assigns(:investigation_status)
    assert_select '#unexpected_error', false
    assert_template "investigation_statuses/edit"
  end

  test "should update investigation_status" do
    put :update, id: @investigation_status, 
      investigation_status: Fabricate.attributes_for(:investigation_status, attr: 'value')
    assert_redirected_to investigation_status_url(assigns(:investigation_status))
  end

  test "should destroy investigation_status" do
    assert_difference('InvestigationStatus.count', -1) do
      delete :destroy, id: @investigation_status
    end

    assert_redirected_to investigation_statuses_path
  end
end
