require 'test_helper'

class AttachDetailsControllerTest < ActionController::TestCase

  setup do
    @attach_detail = Fabricate(:attach_detail)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attach_details)
    assert_select '#unexpected_error', false
    assert_template "attach_details/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:attach_detail)
    assert_select '#unexpected_error', false
    assert_template "attach_details/new"
  end

  test "should create attach_detail" do
    assert_difference('AttachDetail.count') do
      post :create, attach_detail: Fabricate.attributes_for(:attach_detail)
    end

    assert_redirected_to attach_detail_url(assigns(:attach_detail))
  end

  test "should show attach_detail" do
    get :show, id: @attach_detail
    assert_response :success
    assert_not_nil assigns(:attach_detail)
    assert_select '#unexpected_error', false
    assert_template "attach_details/show"
  end

  test "should get edit" do
    get :edit, id: @attach_detail
    assert_response :success
    assert_not_nil assigns(:attach_detail)
    assert_select '#unexpected_error', false
    assert_template "attach_details/edit"
  end

  test "should update attach_detail" do
    put :update, id: @attach_detail, 
      attach_detail: Fabricate.attributes_for(:attach_detail, attr: 'value')
    assert_redirected_to attach_detail_url(assigns(:attach_detail))
  end

  test "should destroy attach_detail" do
    assert_difference('AttachDetail.count', -1) do
      delete :destroy, id: @attach_detail
    end

    assert_redirected_to attach_details_path
  end
end
