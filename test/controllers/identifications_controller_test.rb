require 'test_helper'

class IdentificationsControllerTest < ActionController::TestCase

  setup do
    @identification = Fabricate(:identification)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identifications)
    assert_select '#unexpected_error', false
    assert_template "identifications/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:identification)
    assert_select '#unexpected_error', false
    assert_template "identifications/new"
  end

  test "should create identification" do
    assert_difference('Identification.count') do
      post :create, identification: Fabricate.attributes_for(:identification)
    end

    assert_redirected_to identification_url(assigns(:identification))
  end

  test "should show identification" do
    get :show, id: @identification
    assert_response :success
    assert_not_nil assigns(:identification)
    assert_select '#unexpected_error', false
    assert_template "identifications/show"
  end

  test "should get edit" do
    get :edit, id: @identification
    assert_response :success
    assert_not_nil assigns(:identification)
    assert_select '#unexpected_error', false
    assert_template "identifications/edit"
  end

  test "should update identification" do
    put :update, id: @identification, 
      identification: Fabricate.attributes_for(:identification, attr: 'value')
    assert_redirected_to identification_url(assigns(:identification))
  end

  test "should destroy identification" do
    assert_difference('Identification.count', -1) do
      delete :destroy, id: @identification
    end

    assert_redirected_to identifications_path
  end
end
