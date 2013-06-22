require 'test_helper'

class DoiComparisonsControllerTest < ActionController::TestCase
  setup do
    @doi_comparison = doi_comparisons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doi_comparisons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doi_comparison" do
    assert_difference('DoiComparison.count') do
      post :create, doi_comparison: { heather: @doi_comparison.heather, hwx: @doi_comparison.hwx }
    end

    assert_redirected_to doi_comparison_path(assigns(:doi_comparison))
  end

  test "should show doi_comparison" do
    get :show, id: @doi_comparison
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doi_comparison
    assert_response :success
  end

  test "should update doi_comparison" do
    put :update, id: @doi_comparison, doi_comparison: { heather: @doi_comparison.heather, hwx: @doi_comparison.hwx }
    assert_redirected_to doi_comparison_path(assigns(:doi_comparison))
  end

  test "should destroy doi_comparison" do
    assert_difference('DoiComparison.count', -1) do
      delete :destroy, id: @doi_comparison
    end

    assert_redirected_to doi_comparisons_path
  end
end
