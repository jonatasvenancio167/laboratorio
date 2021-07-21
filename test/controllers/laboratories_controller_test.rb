require "test_helper"

class LaboratoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get laboratories_index_url
    assert_response :success
  end

  test "should get show" do
    get laboratories_show_url
    assert_response :success
  end

  test "should get create" do
    get laboratories_create_url
    assert_response :success
  end

  test "should get update" do
    get laboratories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get laboratories_destroy_url
    assert_response :success
  end
end
