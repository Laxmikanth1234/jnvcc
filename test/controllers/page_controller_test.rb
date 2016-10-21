require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page_home_url
    assert_response :success
  end

  test "should get mypage" do
    get page_mypage_url
    assert_response :success
  end

  test "should get members" do
    get page_members_url
    assert_response :success
  end

  test "should get activities" do
    get page_activities_url
    assert_response :success
  end

  test "should get events" do
    get page_events_url
    assert_response :success
  end

  test "should get batches" do
    get page_batches_url
    assert_response :success
  end

  test "should get contact" do
    get page_contact_url
    assert_response :success
  end

end
