require 'test_helper'

class PersonAddressesControllerTest < ActionController::TestCase

  setup do
    @person_address = Fabricate(:person_address)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_addresses)
    assert_select '#unexpected_error', false
    assert_template "person_addresses/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:person_address)
    assert_select '#unexpected_error', false
    assert_template "person_addresses/new"
  end

  test "should create person_address" do
    assert_difference('PersonAddress.count') do
      post :create, person_address: Fabricate.attributes_for(:person_address)
    end

    assert_redirected_to person_address_url(assigns(:person_address))
  end

  test "should show person_address" do
    get :show, id: @person_address
    assert_response :success
    assert_not_nil assigns(:person_address)
    assert_select '#unexpected_error', false
    assert_template "person_addresses/show"
  end

  test "should get edit" do
    get :edit, id: @person_address
    assert_response :success
    assert_not_nil assigns(:person_address)
    assert_select '#unexpected_error', false
    assert_template "person_addresses/edit"
  end

  test "should update person_address" do
    put :update, id: @person_address, 
      person_address: Fabricate.attributes_for(:person_address, attr: 'value')
    assert_redirected_to person_address_url(assigns(:person_address))
  end

  test "should destroy person_address" do
    assert_difference('PersonAddress.count', -1) do
      delete :destroy, id: @person_address
    end

    assert_redirected_to person_addresses_path
  end
end
