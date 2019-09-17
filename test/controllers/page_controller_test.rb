require 'test_helper'
require 'json'
class PageControllerTest < ActionDispatch::IntegrationTest

  setup do   
    Page.create(color: "red", ip_address: "127.0.0.4")
    Page.create(color: "red", ip_address: "127.0.0.5")
    Page.create(color: "red", ip_address: "127.0.0.6")
    Page.create(color: "blue", ip_address: "127.0.0.7")
  end

  test "should get index" do
    get page_index_url
    assert_response :success
  end

  test "should get blue page" do
    get page_index_url
    assert_response :success
    assert_equal(JSON.parse(response.body)["page_color"], "blue")
  end

  # test "should get blue page after 3" do
  #   get page_index_url
  #   get page_index_url
  #   get page_index_url
  #   assert_equal(JSON.parse(response.body)["page_color"], "blue")
  # end

  # test "should get blue page" do
  #   get page_index_url
  #   get page_index_url
  #   get page_index_url
  #   get page_index_url
  #   assert_response :success
  # end

end
