require 'test_helper'

class ClassificadosControllerTest < ActionController::TestCase
  test "should get do" do
    get :do
    assert_response :success
  end

  test "should get Canga�o" do
    get :Canga�o
    assert_response :success
  end

end
