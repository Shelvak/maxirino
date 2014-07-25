require 'test_helper'

class TownsControllerTest < ActionController::TestCase

  setup do
    @town = Fabricate(:town)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:towns)
    assert_select '#unexpected_error', false
    assert_template "towns/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:town)
    assert_select '#unexpected_error', false
    assert_template "towns/new"
  end

  test "should create town" do
    assert_difference('Town.count') do
      post :create, town: Fabricate.attributes_for(:town)
    end

    assert_redirected_to town_url(assigns(:town))
  end

  test "should show town" do
    get :show, id: @town
    assert_response :success
    assert_not_nil assigns(:town)
    assert_select '#unexpected_error', false
    assert_template "towns/show"
  end

  test "should get edit" do
    get :edit, id: @town
    assert_response :success
    assert_not_nil assigns(:town)
    assert_select '#unexpected_error', false
    assert_template "towns/edit"
  end

  test "should update town" do
    put :update, id: @town, 
      town: Fabricate.attributes_for(:town, attr: 'value')
    assert_redirected_to town_url(assigns(:town))
  end

  test "should destroy town" do
    assert_difference('Town.count', -1) do
      delete :destroy, id: @town
    end

    assert_redirected_to towns_path
  end
end
