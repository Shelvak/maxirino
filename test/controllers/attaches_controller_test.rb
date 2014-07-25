require 'test_helper'

class AttachesControllerTest < ActionController::TestCase

  setup do
    @attach = Fabricate(:attach)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attaches)
    assert_select '#unexpected_error', false
    assert_template "attaches/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:attach)
    assert_select '#unexpected_error', false
    assert_template "attaches/new"
  end

  test "should create attach" do
    assert_difference('Attach.count') do
      post :create, attach: Fabricate.attributes_for(:attach)
    end

    assert_redirected_to attach_url(assigns(:attach))
  end

  test "should show attach" do
    get :show, id: @attach
    assert_response :success
    assert_not_nil assigns(:attach)
    assert_select '#unexpected_error', false
    assert_template "attaches/show"
  end

  test "should get edit" do
    get :edit, id: @attach
    assert_response :success
    assert_not_nil assigns(:attach)
    assert_select '#unexpected_error', false
    assert_template "attaches/edit"
  end

  test "should update attach" do
    put :update, id: @attach, 
      attach: Fabricate.attributes_for(:attach, attr: 'value')
    assert_redirected_to attach_url(assigns(:attach))
  end

  test "should destroy attach" do
    assert_difference('Attach.count', -1) do
      delete :destroy, id: @attach
    end

    assert_redirected_to attaches_path
  end
end
