require 'test_helper'

class AttachTypesControllerTest < ActionController::TestCase

  setup do
    @attach_type = Fabricate(:attach_type)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attach_types)
    assert_select '#unexpected_error', false
    assert_template "attach_types/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:attach_type)
    assert_select '#unexpected_error', false
    assert_template "attach_types/new"
  end

  test "should create attach_type" do
    assert_difference('AttachType.count') do
      post :create, attach_type: Fabricate.attributes_for(:attach_type)
    end

    assert_redirected_to attach_type_url(assigns(:attach_type))
  end

  test "should show attach_type" do
    get :show, id: @attach_type
    assert_response :success
    assert_not_nil assigns(:attach_type)
    assert_select '#unexpected_error', false
    assert_template "attach_types/show"
  end

  test "should get edit" do
    get :edit, id: @attach_type
    assert_response :success
    assert_not_nil assigns(:attach_type)
    assert_select '#unexpected_error', false
    assert_template "attach_types/edit"
  end

  test "should update attach_type" do
    put :update, id: @attach_type, 
      attach_type: Fabricate.attributes_for(:attach_type, attr: 'value')
    assert_redirected_to attach_type_url(assigns(:attach_type))
  end

  test "should destroy attach_type" do
    assert_difference('AttachType.count', -1) do
      delete :destroy, id: @attach_type
    end

    assert_redirected_to attach_types_path
  end
end
