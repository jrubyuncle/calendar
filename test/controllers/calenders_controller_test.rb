require 'test_helper'

class CalendersControllerTest < ActionController::TestCase
  setup do
    @calender = calenders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calenders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calender" do
    assert_difference('Calender.count') do
      post :create, calender: { name: @calender.name, public: @calender.public, user_id: @calender.user_id }
    end

    assert_redirected_to calender_path(assigns(:calender))
  end

  test "should show calender" do
    get :show, id: @calender
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calender
    assert_response :success
  end

  test "should update calender" do
    patch :update, id: @calender, calender: { name: @calender.name, public: @calender.public, user_id: @calender.user_id }
    assert_redirected_to calender_path(assigns(:calender))
  end

  test "should destroy calender" do
    assert_difference('Calender.count', -1) do
      delete :destroy, id: @calender
    end

    assert_redirected_to calenders_path
  end
end
