require 'test_helper'

class AddressesControllerTest < ActionController::TestCase

  setup do
    @address = Fabricate(:address)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
    assert_select '#unexpected_error', false
    assert_template "addresses/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:address)
    assert_select '#unexpected_error', false
    assert_template "addresses/new"
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: Fabricate.attributes_for(:address)
    end

    assert_redirected_to address_url(assigns(:address))
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
    assert_not_nil assigns(:address)
    assert_select '#unexpected_error', false
    assert_template "addresses/show"
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
    assert_not_nil assigns(:address)
    assert_select '#unexpected_error', false
    assert_template "addresses/edit"
  end

  test "should update address" do
    put :update, id: @address, 
      address: Fabricate.attributes_for(:address, attr: 'value')
    assert_redirected_to address_url(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
end
