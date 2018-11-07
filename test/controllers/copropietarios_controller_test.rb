require 'test_helper'

class CopropietariosControllerTest < ActionController::TestCase
  setup do
    @copropietario = copropietarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:copropietarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create copropietario" do
    assert_difference('Copropietario.count') do
      post :create, copropietario: {  }
    end

    assert_redirected_to copropietario_path(assigns(:copropietario))
  end

  test "should show copropietario" do
    get :show, id: @copropietario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @copropietario
    assert_response :success
  end

  test "should update copropietario" do
    patch :update, id: @copropietario, copropietario: {  }
    assert_redirected_to copropietario_path(assigns(:copropietario))
  end

  test "should destroy copropietario" do
    assert_difference('Copropietario.count', -1) do
      delete :destroy, id: @copropietario
    end

    assert_redirected_to copropietarios_path
  end
end
