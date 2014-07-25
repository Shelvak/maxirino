require 'test_helper'

class CountriesControllerTest < ActionController::TestCase

  setup do
    @country = Fabricate(:country)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
    assert_select '#unexpected_error', false
    assert_template "countries/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:country)
    assert_select '#unexpected_error', false
    assert_template "countries/new"
  end

  test "should create country" do
    assert_difference('Country.count') do
      post :create, country: Fabricate.attributes_for(:country)
    end

    assert_redirected_to country_url(assigns(:country))
  end

  test "should show country" do
    get :show, id: @country
    assert_response :success
    assert_not_nil assigns(:country)
    assert_select '#unexpected_error', false
    assert_template "countries/show"
  end

  test "should get edit" do
    get :edit, id: @country
    assert_response :success
    assert_not_nil assigns(:country)
    assert_select '#unexpected_error', false
    assert_template "countries/edit"
  end

  test "should update country" do
    put :update, id: @country, 
      country: Fabricate.attributes_for(:country, attr: 'value')
    assert_redirected_to country_url(assigns(:country))
  end

  test "should destroy country" do
    assert_difference('Country.count', -1) do
      delete :destroy, id: @country
    end

    assert_redirected_to countries_path
  end
end
