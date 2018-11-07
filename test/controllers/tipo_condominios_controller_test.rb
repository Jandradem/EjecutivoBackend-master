require 'test_helper'

class TipoCondominiosControllerTest < ActionController::TestCase
  setup do
    @tipo_condominio = tipo_condominios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_condominios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_condominio" do
    assert_difference('TipoCondominio.count') do
      post :create, tipo_condominio: { estatusTipoCond: @tipo_condominio.estatusTipoCond, idTipoCond: @tipo_condominio.idTipoCond, nombreTipoCond: @tipo_condominio.nombreTipoCond }
    end

    assert_redirected_to tipo_condominio_path(assigns(:tipo_condominio))
  end

  test "should show tipo_condominio" do
    get :show, id: @tipo_condominio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_condominio
    assert_response :success
  end

  test "should update tipo_condominio" do
    patch :update, id: @tipo_condominio, tipo_condominio: { estatusTipoCond: @tipo_condominio.estatusTipoCond, idTipoCond: @tipo_condominio.idTipoCond, nombreTipoCond: @tipo_condominio.nombreTipoCond }
    assert_redirected_to tipo_condominio_path(assigns(:tipo_condominio))
  end

  test "should destroy tipo_condominio" do
    assert_difference('TipoCondominio.count', -1) do
      delete :destroy, id: @tipo_condominio
    end

    assert_redirected_to tipo_condominios_path
  end
end
