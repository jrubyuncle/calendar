require 'test_helper'

class Admin::CalendersControllerTest < ActionController::TestCase
  setup do
    @admin_calender = admin_calenders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_calenders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_calender" do
    assert_difference('Admin::Calender.count') do
      post :create, admin_calender: { name: @admin_calender.name, public: @admin_calender.public, user_id: @admin_calender.user_id }
    end

    assert_redirected_to admin_calender_path(assigns(:admin_calender))
  end

  test "should show admin_calender" do
    get :show, id: @admin_calender
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_calender
    assert_response :success
  end

  test "should update admin_calender" do
    patch :update, id: @admin_calender, admin_calender: { name: @admin_calender.name, public: @admin_calender.public, user_id: @admin_calender.user_id }
    assert_redirected_to admin_calender_path(assigns(:admin_calender))
  end

  test "should destroy admin_calender" do
    assert_difference('Admin::Calender.count', -1) do
      delete :destroy, id: @admin_calender
    end

    assert_redirected_to admin_calenders_path
  end
end
