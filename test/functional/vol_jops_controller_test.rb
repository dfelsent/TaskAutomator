require 'test_helper'

class VolJopsControllerTest < ActionController::TestCase
  setup do
    @vol_jop = vol_jops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vol_jops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vol_jop" do
    assert_difference('VolJop.count') do
      post :create, vol_jop: { issue: @vol_jop.issue, volume: @vol_jop.volume }
    end

    assert_redirected_to vol_jop_path(assigns(:vol_jop))
  end

  test "should show vol_jop" do
    get :show, id: @vol_jop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vol_jop
    assert_response :success
  end

  test "should update vol_jop" do
    put :update, id: @vol_jop, vol_jop: { issue: @vol_jop.issue, volume: @vol_jop.volume }
    assert_redirected_to vol_jop_path(assigns(:vol_jop))
  end

  test "should destroy vol_jop" do
    assert_difference('VolJop.count', -1) do
      delete :destroy, id: @vol_jop
    end

    assert_redirected_to vol_jops_path
  end
end
