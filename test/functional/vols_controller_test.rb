require 'test_helper'

class VolsControllerTest < ActionController::TestCase
  setup do
    @vol = vols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vol" do
    assert_difference('Vol.count') do
      post :create, vol: @vol.attributes
    end

    assert_redirected_to vol_path(assigns(:vol))
  end

  test "should show vol" do
    get :show, id: @vol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vol
    assert_response :success
  end

  test "should update vol" do
    put :update, id: @vol, vol: @vol.attributes
    assert_redirected_to vol_path(assigns(:vol))
  end

  test "should destroy vol" do
    assert_difference('Vol.count', -1) do
      delete :destroy, id: @vol
    end

    assert_redirected_to vols_path
  end
end
