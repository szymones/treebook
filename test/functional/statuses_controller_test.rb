require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should be redirected when logged in" do
    get :new
    assert_response :redirect 
    assert_redirected_to new_user_session_path
  end

  test "should be logged in to post status" do 
    post :create, status: { content:"Hello testing"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should reder a new page when user logged in" do
    sign_in users(:janek)
    get :new
    assert_response :success
  end

  test "should create status only when logged in" do
    sign_in users (:janek)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status when logged in" do
    sign_in users (:janek)
    get :show, id: @status
    assert_response :success
  end

  test "should get edit status when logged in" do
    sign_in users (:janek)
    get :edit, id: @status
    assert_response :success
  end

  test "should update status only when logged in" do
    sign_in users (:janek)
    put :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
