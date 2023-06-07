require "test_helper"

class PodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pod = pods(:one)
  end

  test "should get index" do
    get pods_url
    assert_response :success
  end

  test "should get new" do
    get new_pod_url
    assert_response :success
  end

  test "should create pod" do
    assert_difference("Pod.count") do
      post pods_url, params: { pod: { brand: @pod.brand, description: @pod.description, flavor: @pod.flavor, url_image: @pod.url_image } }
    end

    assert_redirected_to pod_url(Pod.last)
  end

  test "should show pod" do
    get pod_url(@pod)
    assert_response :success
  end

  test "should get edit" do
    get edit_pod_url(@pod)
    assert_response :success
  end

  test "should update pod" do
    patch pod_url(@pod), params: { pod: { brand: @pod.brand, description: @pod.description, flavor: @pod.flavor, url_image: @pod.url_image } }
    assert_redirected_to pod_url(@pod)
  end

  test "should destroy pod" do
    assert_difference("Pod.count", -1) do
      delete pod_url(@pod)
    end

    assert_redirected_to pods_url
  end
end
