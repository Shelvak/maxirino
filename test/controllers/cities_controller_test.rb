require 'test_helper'

class CitiesControllerTest < ActionController::TestCase

  setup do
    @city = Fabricate(:city)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cities)
    assert_select '#unexpected_error', false
    assert_template "cities/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:city)
    assert_select '#unexpected_error', false
    assert_template "cities/new"
  end

  test "should create city" do
    assert_difference('City.count') do
      post :create, city: Fabricate.attributes_for(:city)
    end

    assert_redirected_to city_url(assigns(:city))
  end

  test "should show city" do
    get :show, id: @city
    assert_response :success
    assert_not_nil assigns(:city)
    assert_select '#unexpected_error', false
    assert_template "cities/show"
  end

  test "should get edit" do
    get :edit, id: @city
    assert_response :success
    assert_not_nil assigns(:city)
    assert_select '#unexpected_error', false
    assert_template "cities/edit"
  end

  test "should update city" do
    put :update, id: @city, 
      city: Fabricate.attributes_for(:city, attr: 'value')
    assert_redirected_to city_url(assigns(:city))
  end

  test "should destroy city" do
    assert_difference('City.count', -1) do
      delete :destroy, id: @city
    end

    assert_redirected_to cities_path
  end
end
