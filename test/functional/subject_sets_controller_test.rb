require 'test_helper'

class SubjectSetsControllerTest < ActionController::TestCase
  setup do
    @subject_set = subject_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subject_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject_set" do
    assert_difference('SubjectSet.count') do
      post :create, subject_set: { subject_codes: @subject_set.subject_codes }
    end

    assert_redirected_to subject_set_path(assigns(:subject_set))
  end

  test "should show subject_set" do
    get :show, id: @subject_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject_set
    assert_response :success
  end

  test "should update subject_set" do
    put :update, id: @subject_set, subject_set: { subject_codes: @subject_set.subject_codes }
    assert_redirected_to subject_set_path(assigns(:subject_set))
  end

  test "should destroy subject_set" do
    assert_difference('SubjectSet.count', -1) do
      delete :destroy, id: @subject_set
    end

    assert_redirected_to subject_sets_path
  end
end
