require 'test_helper'

class LeadersControllerTest < ActionController::TestCase

  setup do
    @leader = Fabricate(:leader)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaders)
    assert_select '#unexpected_error', false
    assert_template "leaders/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:leader)
    assert_select '#unexpected_error', false
    assert_template "leaders/new"
  end

  test "should create leader" do
    assert_difference('Leader.count') do
      post :create, leader: Fabricate.attributes_for(:leader)
    end

    assert_redirected_to leader_url(assigns(:leader))
  end

  test "should show leader" do
    get :show, id: @leader
    assert_response :success
    assert_not_nil assigns(:leader)
    assert_select '#unexpected_error', false
    assert_template "leaders/show"
  end

  test "should get edit" do
    get :edit, id: @leader
    assert_response :success
    assert_not_nil assigns(:leader)
    assert_select '#unexpected_error', false
    assert_template "leaders/edit"
  end

  test "should update leader" do
    put :update, id: @leader, 
      leader: Fabricate.attributes_for(:leader, attr: 'value')
    assert_redirected_to leader_url(assigns(:leader))
  end

  test "should destroy leader" do
    assert_difference('Leader.count', -1) do
      delete :destroy, id: @leader
    end

    assert_redirected_to leaders_path
  end
end
