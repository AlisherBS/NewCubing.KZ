require 'test_helper'

class ExternalResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @external_resource = external_resources(:one)
  end

  test "should get index" do
    get external_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_external_resource_url
    assert_response :success
  end

  test "should create external_resource" do
    assert_difference('ExternalResource.count') do
      post external_resources_url, params: { external_resource: { description: @external_resource.description, img: @external_resource.img, link: @external_resource.link, name: @external_resource.name } }
    end

    assert_redirected_to external_resource_url(ExternalResource.last)
  end

  test "should show external_resource" do
    get external_resource_url(@external_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_external_resource_url(@external_resource)
    assert_response :success
  end

  test "should update external_resource" do
    patch external_resource_url(@external_resource), params: { external_resource: { description: @external_resource.description, img: @external_resource.img, link: @external_resource.link, name: @external_resource.name } }
    assert_redirected_to external_resource_url(@external_resource)
  end

  test "should destroy external_resource" do
    assert_difference('ExternalResource.count', -1) do
      delete external_resource_url(@external_resource)
    end

    assert_redirected_to external_resources_url
  end
end
