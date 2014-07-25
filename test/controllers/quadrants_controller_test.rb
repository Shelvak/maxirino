require 'test_helper'

class QuadrantsControllerTest < ActionController::TestCase

  setup do
    @quadrant = Fabricate(:quadrant)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quadrants)
    assert_select '#unexpected_error', false
    assert_template "quadrants/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:quadrant)
    assert_select '#unexpected_error', false
    assert_template "quadrants/new"
  end

  test "should create quadrant" do
    assert_difference('Quadrant.count') do
      post :create, quadrant: Fabricate.attributes_for(:quadrant)
    end

    assert_redirected_to quadrant_url(assigns(:quadrant))
  end

  test "should show quadrant" do
    get :show, id: @quadrant
    assert_response :success
    assert_not_nil assigns(:quadrant)
    assert_select '#unexpected_error', false
    assert_template "quadrants/show"
  end

  test "should get edit" do
    get :edit, id: @quadrant
    assert_response :success
    assert_not_nil assigns(:quadrant)
    assert_select '#unexpected_error', false
    assert_template "quadrants/edit"
  end

  test "should update quadrant" do
    put :update, id: @quadrant, 
      quadrant: Fabricate.attributes_for(:quadrant, attr: 'value')
    assert_redirected_to quadrant_url(assigns(:quadrant))
  end

  test "should destroy quadrant" do
    assert_difference('Quadrant.count', -1) do
      delete :destroy, id: @quadrant
    end

    assert_redirected_to quadrants_path
  end
end
