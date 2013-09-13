require 'test_helper'

class PostosControllerTest < ActionController::TestCase
  setup do
    @posto = postos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posto" do
    assert_difference('Posto.count') do
      post :create, posto: { bairro: @posto.bairro, data_coleta: @posto.data_coleta, distribuidora: @posto.distribuidora, endereco: @posto.endereco, fornecedor: @posto.fornecedor, modalidade: @posto.modalidade, nome: @posto.nome, preco_compra: @posto.preco_compra, preco_venda: @posto.preco_venda }
    end

    assert_redirected_to posto_path(assigns(:posto))
  end

  test "should show posto" do
    get :show, id: @posto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posto
    assert_response :success
  end

  test "should update posto" do
    put :update, id: @posto, posto: { bairro: @posto.bairro, data_coleta: @posto.data_coleta, distribuidora: @posto.distribuidora, endereco: @posto.endereco, fornecedor: @posto.fornecedor, modalidade: @posto.modalidade, nome: @posto.nome, preco_compra: @posto.preco_compra, preco_venda: @posto.preco_venda }
    assert_redirected_to posto_path(assigns(:posto))
  end

  test "should destroy posto" do
    assert_difference('Posto.count', -1) do
      delete :destroy, id: @posto
    end

    assert_redirected_to postos_path
  end
end
