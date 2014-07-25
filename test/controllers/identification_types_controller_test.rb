require 'test_helper'

class IdentificationTypesControllerTest < ActionController::TestCase

  setup do
    @identification_type = Fabricate(:identification_type)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identification_types)
    assert_select '#unexpected_error', false
    assert_template "identification_types/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:identification_type)
    assert_select '#unexpected_error', false
    assert_template "identification_types/new"
  end

  test "should create identification_type" do
    assert_difference('IdentificationType.count') do
      post :create, identification_type: Fabricate.attributes_for(:identification_type)
    end

    assert_redirected_to identification_type_url(assigns(:identification_type))
  end

  test "should show identification_type" do
    get :show, id: @identification_type
    assert_response :success
    assert_not_nil assigns(:identification_type)
    assert_select '#unexpected_error', false
    assert_template "identification_types/show"
  end

  test "should get edit" do
    get :edit, id: @identification_type
    assert_response :success
    assert_not_nil assigns(:identification_type)
    assert_select '#unexpected_error', false
    assert_template "identification_types/edit"
  end

  test "should update identification_type" do
    put :update, id: @identification_type, 
      identification_type: Fabricate.attributes_for(:identification_type, attr: 'value')
    assert_redirected_to identification_type_url(assigns(:identification_type))
  end

  test "should destroy identification_type" do
    assert_difference('IdentificationType.count', -1) do
      delete :destroy, id: @identification_type
    end

    assert_redirected_to identification_types_path
  end
end
