require 'test_helper'

class ConceptualizationsControllerTest < ActionController::TestCase

  setup do
    @conceptualization = Fabricate(:conceptualization)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conceptualizations)
    assert_select '#unexpected_error', false
    assert_template "conceptualizations/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:conceptualization)
    assert_select '#unexpected_error', false
    assert_template "conceptualizations/new"
  end

  test "should create conceptualization" do
    assert_difference('Conceptualization.count') do
      post :create, conceptualization: Fabricate.attributes_for(:conceptualization)
    end

    assert_redirected_to conceptualization_url(assigns(:conceptualization))
  end

  test "should show conceptualization" do
    get :show, id: @conceptualization
    assert_response :success
    assert_not_nil assigns(:conceptualization)
    assert_select '#unexpected_error', false
    assert_template "conceptualizations/show"
  end

  test "should get edit" do
    get :edit, id: @conceptualization
    assert_response :success
    assert_not_nil assigns(:conceptualization)
    assert_select '#unexpected_error', false
    assert_template "conceptualizations/edit"
  end

  test "should update conceptualization" do
    put :update, id: @conceptualization, 
      conceptualization: Fabricate.attributes_for(:conceptualization, attr: 'value')
    assert_redirected_to conceptualization_url(assigns(:conceptualization))
  end

  test "should destroy conceptualization" do
    assert_difference('Conceptualization.count', -1) do
      delete :destroy, id: @conceptualization
    end

    assert_redirected_to conceptualizations_path
  end
end
