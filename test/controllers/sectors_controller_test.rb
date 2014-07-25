require 'test_helper'

class SectorsControllerTest < ActionController::TestCase

  setup do
    @sector = Fabricate(:sector)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sectors)
    assert_select '#unexpected_error', false
    assert_template "sectors/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:sector)
    assert_select '#unexpected_error', false
    assert_template "sectors/new"
  end

  test "should create sector" do
    assert_difference('Sector.count') do
      post :create, sector: Fabricate.attributes_for(:sector)
    end

    assert_redirected_to sector_url(assigns(:sector))
  end

  test "should show sector" do
    get :show, id: @sector
    assert_response :success
    assert_not_nil assigns(:sector)
    assert_select '#unexpected_error', false
    assert_template "sectors/show"
  end

  test "should get edit" do
    get :edit, id: @sector
    assert_response :success
    assert_not_nil assigns(:sector)
    assert_select '#unexpected_error', false
    assert_template "sectors/edit"
  end

  test "should update sector" do
    put :update, id: @sector, 
      sector: Fabricate.attributes_for(:sector, attr: 'value')
    assert_redirected_to sector_url(assigns(:sector))
  end

  test "should destroy sector" do
    assert_difference('Sector.count', -1) do
      delete :destroy, id: @sector
    end

    assert_redirected_to sectors_path
  end
end
