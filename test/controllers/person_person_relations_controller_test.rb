require 'test_helper'

class PersonPersonRelationsControllerTest < ActionController::TestCase

  setup do
    @person_person_relation = Fabricate(:person_person_relation)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_person_relations)
    assert_select '#unexpected_error', false
    assert_template "person_person_relations/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:person_person_relation)
    assert_select '#unexpected_error', false
    assert_template "person_person_relations/new"
  end

  test "should create person_person_relation" do
    assert_difference('PersonPersonRelation.count') do
      post :create, person_person_relation: Fabricate.attributes_for(:person_person_relation)
    end

    assert_redirected_to person_person_relation_url(assigns(:person_person_relation))
  end

  test "should show person_person_relation" do
    get :show, id: @person_person_relation
    assert_response :success
    assert_not_nil assigns(:person_person_relation)
    assert_select '#unexpected_error', false
    assert_template "person_person_relations/show"
  end

  test "should get edit" do
    get :edit, id: @person_person_relation
    assert_response :success
    assert_not_nil assigns(:person_person_relation)
    assert_select '#unexpected_error', false
    assert_template "person_person_relations/edit"
  end

  test "should update person_person_relation" do
    put :update, id: @person_person_relation, 
      person_person_relation: Fabricate.attributes_for(:person_person_relation, attr: 'value')
    assert_redirected_to person_person_relation_url(assigns(:person_person_relation))
  end

  test "should destroy person_person_relation" do
    assert_difference('PersonPersonRelation.count', -1) do
      delete :destroy, id: @person_person_relation
    end

    assert_redirected_to person_person_relations_path
  end
end
