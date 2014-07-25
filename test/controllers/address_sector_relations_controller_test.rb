require 'test_helper'

class AddressSectorRelationsControllerTest < ActionController::TestCase

  setup do
    @address_sector_relation = Fabricate(:address_sector_relation)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:address_sector_relations)
    assert_select '#unexpected_error', false
    assert_template "address_sector_relations/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:address_sector_relation)
    assert_select '#unexpected_error', false
    assert_template "address_sector_relations/new"
  end

  test "should create address_sector_relation" do
    assert_difference('AddressSectorRelation.count') do
      post :create, address_sector_relation: Fabricate.attributes_for(:address_sector_relation)
    end

    assert_redirected_to address_sector_relation_url(assigns(:address_sector_relation))
  end

  test "should show address_sector_relation" do
    get :show, id: @address_sector_relation
    assert_response :success
    assert_not_nil assigns(:address_sector_relation)
    assert_select '#unexpected_error', false
    assert_template "address_sector_relations/show"
  end

  test "should get edit" do
    get :edit, id: @address_sector_relation
    assert_response :success
    assert_not_nil assigns(:address_sector_relation)
    assert_select '#unexpected_error', false
    assert_template "address_sector_relations/edit"
  end

  test "should update address_sector_relation" do
    put :update, id: @address_sector_relation, 
      address_sector_relation: Fabricate.attributes_for(:address_sector_relation, attr: 'value')
    assert_redirected_to address_sector_relation_url(assigns(:address_sector_relation))
  end

  test "should destroy address_sector_relation" do
    assert_difference('AddressSectorRelation.count', -1) do
      delete :destroy, id: @address_sector_relation
    end

    assert_redirected_to address_sector_relations_path
  end
end
