require 'test_helper'

class MunicipiosControllerTest < ActionController::TestCase
  setup do
    @municipio = municipios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:municipios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create municipio" do
    assert_difference('Municipio.count') do
      post :create, municipio: { consumidor_desvio_padrao: @municipio.consumidor_desvio_padrao, consumidor_preco_maximo: @municipio.consumidor_preco_maximo, consumidor_preco_medio: @municipio.consumidor_preco_medio, consumidor_preco_minimo: @municipio.consumidor_preco_minimo, distribuidor_desvio_padrao: @municipio.distribuidor_desvio_padrao, distribuidor_margem_media: @municipio.distribuidor_margem_media, distribuidor_preco_maximo: @municipio.distribuidor_preco_maximo, distribuidor_preco_medio: @municipio.distribuidor_preco_medio, distribuidor_preco_minimo: @municipio.distribuidor_preco_minimo, postos_pesquisados: @municipio.postos_pesquisados }
    end

    assert_redirected_to municipio_path(assigns(:municipio))
  end

  test "should show municipio" do
    get :show, id: @municipio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @municipio
    assert_response :success
  end

  test "should update municipio" do
    put :update, id: @municipio, municipio: { consumidor_desvio_padrao: @municipio.consumidor_desvio_padrao, consumidor_preco_maximo: @municipio.consumidor_preco_maximo, consumidor_preco_medio: @municipio.consumidor_preco_medio, consumidor_preco_minimo: @municipio.consumidor_preco_minimo, distribuidor_desvio_padrao: @municipio.distribuidor_desvio_padrao, distribuidor_margem_media: @municipio.distribuidor_margem_media, distribuidor_preco_maximo: @municipio.distribuidor_preco_maximo, distribuidor_preco_medio: @municipio.distribuidor_preco_medio, distribuidor_preco_minimo: @municipio.distribuidor_preco_minimo, postos_pesquisados: @municipio.postos_pesquisados }
    assert_redirected_to municipio_path(assigns(:municipio))
  end

  test "should destroy municipio" do
    assert_difference('Municipio.count', -1) do
      delete :destroy, id: @municipio
    end

    assert_redirected_to municipios_path
  end
end
