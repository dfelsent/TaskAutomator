# -*- encoding : utf-8 -*-
require 'test_helper'

class DoilistsControllerTest < ActionController::TestCase
  setup do
    @doilist = doilists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doilists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doilist" do
    assert_difference('Doilist.count') do
      post :create, doilist: @doilist.attributes
    end

    assert_redirected_to doilist_path(assigns(:doilist))
  end

  test "should show doilist" do
    get :show, id: @doilist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doilist
    assert_response :success
  end

  test "should update doilist" do
    put :update, id: @doilist, doilist: @doilist.attributes
    assert_redirected_to doilist_path(assigns(:doilist))
  end

  test "should destroy doilist" do
    assert_difference('Doilist.count', -1) do
      delete :destroy, id: @doilist
    end

    assert_redirected_to doilists_path
  end
end
