require 'test_helper'

class ProvincesControllerTest < ActionController::TestCase

  setup do
    @province = Fabricate(:province)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provinces)
    assert_select '#unexpected_error', false
    assert_template "provinces/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:province)
    assert_select '#unexpected_error', false
    assert_template "provinces/new"
  end

  test "should create province" do
    assert_difference('Province.count') do
      post :create, province: Fabricate.attributes_for(:province)
    end

    assert_redirected_to province_url(assigns(:province))
  end

  test "should show province" do
    get :show, id: @province
    assert_response :success
    assert_not_nil assigns(:province)
    assert_select '#unexpected_error', false
    assert_template "provinces/show"
  end

  test "should get edit" do
    get :edit, id: @province
    assert_response :success
    assert_not_nil assigns(:province)
    assert_select '#unexpected_error', false
    assert_template "provinces/edit"
  end

  test "should update province" do
    put :update, id: @province, 
      province: Fabricate.attributes_for(:province, attr: 'value')
    assert_redirected_to province_url(assigns(:province))
  end

  test "should destroy province" do
    assert_difference('Province.count', -1) do
      delete :destroy, id: @province
    end

    assert_redirected_to provinces_path
  end
end
