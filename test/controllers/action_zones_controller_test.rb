require 'test_helper'

class ActionZonesControllerTest < ActionController::TestCase

  setup do
    @action_zone = Fabricate(:action_zone)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_zones)
    assert_select '#unexpected_error', false
    assert_template "action_zones/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:action_zone)
    assert_select '#unexpected_error', false
    assert_template "action_zones/new"
  end

  test "should create action_zone" do
    assert_difference('ActionZone.count') do
      post :create, action_zone: Fabricate.attributes_for(:action_zone)
    end

    assert_redirected_to action_zone_url(assigns(:action_zone))
  end

  test "should show action_zone" do
    get :show, id: @action_zone
    assert_response :success
    assert_not_nil assigns(:action_zone)
    assert_select '#unexpected_error', false
    assert_template "action_zones/show"
  end

  test "should get edit" do
    get :edit, id: @action_zone
    assert_response :success
    assert_not_nil assigns(:action_zone)
    assert_select '#unexpected_error', false
    assert_template "action_zones/edit"
  end

  test "should update action_zone" do
    put :update, id: @action_zone, 
      action_zone: Fabricate.attributes_for(:action_zone, attr: 'value')
    assert_redirected_to action_zone_url(assigns(:action_zone))
  end

  test "should destroy action_zone" do
    assert_difference('ActionZone.count', -1) do
      delete :destroy, id: @action_zone
    end

    assert_redirected_to action_zones_path
  end
end
