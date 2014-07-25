require 'test_helper'

class PhysicalFeaturesControllerTest < ActionController::TestCase

  setup do
    @physical_feature = Fabricate(:physical_feature)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_features)
    assert_select '#unexpected_error', false
    assert_template "physical_features/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:physical_feature)
    assert_select '#unexpected_error', false
    assert_template "physical_features/new"
  end

  test "should create physical_feature" do
    assert_difference('PhysicalFeature.count') do
      post :create, physical_feature: Fabricate.attributes_for(:physical_feature)
    end

    assert_redirected_to physical_feature_url(assigns(:physical_feature))
  end

  test "should show physical_feature" do
    get :show, id: @physical_feature
    assert_response :success
    assert_not_nil assigns(:physical_feature)
    assert_select '#unexpected_error', false
    assert_template "physical_features/show"
  end

  test "should get edit" do
    get :edit, id: @physical_feature
    assert_response :success
    assert_not_nil assigns(:physical_feature)
    assert_select '#unexpected_error', false
    assert_template "physical_features/edit"
  end

  test "should update physical_feature" do
    put :update, id: @physical_feature, 
      physical_feature: Fabricate.attributes_for(:physical_feature, attr: 'value')
    assert_redirected_to physical_feature_url(assigns(:physical_feature))
  end

  test "should destroy physical_feature" do
    assert_difference('PhysicalFeature.count', -1) do
      delete :destroy, id: @physical_feature
    end

    assert_redirected_to physical_features_path
  end
end
