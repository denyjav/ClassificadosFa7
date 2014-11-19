require 'test_helper'

class ClassificadosControllerTest < ActionController::TestCase
  test "should get do" do
    get :do
    assert_response :success
  end

  test "should get Cangaço" do
    get :Cangaço
    assert_response :success
  end

end
