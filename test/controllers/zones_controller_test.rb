require 'test_helper'

class ZonesControllerTest < ActionController::TestCase

  setup do
    @zone = Fabricate(:zone)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zones)
    assert_select '#unexpected_error', false
    assert_template "zones/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:zone)
    assert_select '#unexpected_error', false
    assert_template "zones/new"
  end

  test "should create zone" do
    assert_difference('Zone.count') do
      post :create, zone: Fabricate.attributes_for(:zone)
    end

    assert_redirected_to zone_url(assigns(:zone))
  end

  test "should show zone" do
    get :show, id: @zone
    assert_response :success
    assert_not_nil assigns(:zone)
    assert_select '#unexpected_error', false
    assert_template "zones/show"
  end

  test "should get edit" do
    get :edit, id: @zone
    assert_response :success
    assert_not_nil assigns(:zone)
    assert_select '#unexpected_error', false
    assert_template "zones/edit"
  end

  test "should update zone" do
    put :update, id: @zone, 
      zone: Fabricate.attributes_for(:zone, attr: 'value')
    assert_redirected_to zone_url(assigns(:zone))
  end

  test "should destroy zone" do
    assert_difference('Zone.count', -1) do
      delete :destroy, id: @zone
    end

    assert_redirected_to zones_path
  end
end
