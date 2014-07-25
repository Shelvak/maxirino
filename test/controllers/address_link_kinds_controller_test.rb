require 'test_helper'

class AddressLinkKindsControllerTest < ActionController::TestCase

  setup do
    @address_link_kind = Fabricate(:address_link_kind)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_link_kinds)
    assert_select '#unexpected_error', false
    assert_template "address_link_kinds/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:address_link_kind)
    assert_select '#unexpected_error', false
    assert_template "address_link_kinds/new"
  end

  test "should create address_link_kind" do
    assert_difference('AddressLinkKind.count') do
      post :create, address_link_kind: Fabricate.attributes_for(:address_link_kind)
    end

    assert_redirected_to address_link_kind_url(assigns(:address_link_kind))
  end

  test "should show address_link_kind" do
    get :show, id: @address_link_kind
    assert_response :success
    assert_not_nil assigns(:address_link_kind)
    assert_select '#unexpected_error', false
    assert_template "address_link_kinds/show"
  end

  test "should get edit" do
    get :edit, id: @address_link_kind
    assert_response :success
    assert_not_nil assigns(:address_link_kind)
    assert_select '#unexpected_error', false
    assert_template "address_link_kinds/edit"
  end

  test "should update address_link_kind" do
    put :update, id: @address_link_kind, 
      address_link_kind: Fabricate.attributes_for(:address_link_kind, attr: 'value')
    assert_redirected_to address_link_kind_url(assigns(:address_link_kind))
  end

  test "should destroy address_link_kind" do
    assert_difference('AddressLinkKind.count', -1) do
      delete :destroy, id: @address_link_kind
    end

    assert_redirected_to address_link_kinds_path
  end
end
