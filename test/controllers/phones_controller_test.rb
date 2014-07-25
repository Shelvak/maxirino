require 'test_helper'

class PhonesControllerTest < ActionController::TestCase

  setup do
    @phone = Fabricate(:phone)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phones)
    assert_select '#unexpected_error', false
    assert_template "phones/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:phone)
    assert_select '#unexpected_error', false
    assert_template "phones/new"
  end

  test "should create phone" do
    assert_difference('Phone.count') do
      post :create, phone: Fabricate.attributes_for(:phone)
    end

    assert_redirected_to phone_url(assigns(:phone))
  end

  test "should show phone" do
    get :show, id: @phone
    assert_response :success
    assert_not_nil assigns(:phone)
    assert_select '#unexpected_error', false
    assert_template "phones/show"
  end

  test "should get edit" do
    get :edit, id: @phone
    assert_response :success
    assert_not_nil assigns(:phone)
    assert_select '#unexpected_error', false
    assert_template "phones/edit"
  end

  test "should update phone" do
    put :update, id: @phone, 
      phone: Fabricate.attributes_for(:phone, attr: 'value')
    assert_redirected_to phone_url(assigns(:phone))
  end

  test "should destroy phone" do
    assert_difference('Phone.count', -1) do
      delete :destroy, id: @phone
    end

    assert_redirected_to phones_path
  end
end
