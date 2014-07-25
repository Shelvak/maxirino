require 'test_helper'

class PersonQuadrantLinkKindsControllerTest < ActionController::TestCase

  setup do
    @person_quadrant_link_kind = Fabricate(:person_quadrant_link_kind)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_quadrant_link_kinds)
    assert_select '#unexpected_error', false
    assert_template "person_quadrant_link_kinds/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:person_quadrant_link_kind)
    assert_select '#unexpected_error', false
    assert_template "person_quadrant_link_kinds/new"
  end

  test "should create person_quadrant_link_kind" do
    assert_difference('PersonQuadrantLinkKind.count') do
      post :create, person_quadrant_link_kind: Fabricate.attributes_for(:person_quadrant_link_kind)
    end

    assert_redirected_to person_quadrant_link_kind_url(assigns(:person_quadrant_link_kind))
  end

  test "should show person_quadrant_link_kind" do
    get :show, id: @person_quadrant_link_kind
    assert_response :success
    assert_not_nil assigns(:person_quadrant_link_kind)
    assert_select '#unexpected_error', false
    assert_template "person_quadrant_link_kinds/show"
  end

  test "should get edit" do
    get :edit, id: @person_quadrant_link_kind
    assert_response :success
    assert_not_nil assigns(:person_quadrant_link_kind)
    assert_select '#unexpected_error', false
    assert_template "person_quadrant_link_kinds/edit"
  end

  test "should update person_quadrant_link_kind" do
    put :update, id: @person_quadrant_link_kind, 
      person_quadrant_link_kind: Fabricate.attributes_for(:person_quadrant_link_kind, attr: 'value')
    assert_redirected_to person_quadrant_link_kind_url(assigns(:person_quadrant_link_kind))
  end

  test "should destroy person_quadrant_link_kind" do
    assert_difference('PersonQuadrantLinkKind.count', -1) do
      delete :destroy, id: @person_quadrant_link_kind
    end

    assert_redirected_to person_quadrant_link_kinds_path
  end
end
