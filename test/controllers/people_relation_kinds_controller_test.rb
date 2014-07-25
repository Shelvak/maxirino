require 'test_helper'

class PeopleRelationKindsControllerTest < ActionController::TestCase

  setup do
    @people_relation_kind = Fabricate(:people_relation_kind)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people_relation_kinds)
    assert_select '#unexpected_error', false
    assert_template "people_relation_kinds/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:people_relation_kind)
    assert_select '#unexpected_error', false
    assert_template "people_relation_kinds/new"
  end

  test "should create people_relation_kind" do
    assert_difference('PeopleRelationKind.count') do
      post :create, people_relation_kind: Fabricate.attributes_for(:people_relation_kind)
    end

    assert_redirected_to people_relation_kind_url(assigns(:people_relation_kind))
  end

  test "should show people_relation_kind" do
    get :show, id: @people_relation_kind
    assert_response :success
    assert_not_nil assigns(:people_relation_kind)
    assert_select '#unexpected_error', false
    assert_template "people_relation_kinds/show"
  end

  test "should get edit" do
    get :edit, id: @people_relation_kind
    assert_response :success
    assert_not_nil assigns(:people_relation_kind)
    assert_select '#unexpected_error', false
    assert_template "people_relation_kinds/edit"
  end

  test "should update people_relation_kind" do
    put :update, id: @people_relation_kind, 
      people_relation_kind: Fabricate.attributes_for(:people_relation_kind, attr: 'value')
    assert_redirected_to people_relation_kind_url(assigns(:people_relation_kind))
  end

  test "should destroy people_relation_kind" do
    assert_difference('PeopleRelationKind.count', -1) do
      delete :destroy, id: @people_relation_kind
    end

    assert_redirected_to people_relation_kinds_path
  end
end
