require 'test_helper'

class GasStationsControllerTest < ActionController::TestCase
  setup do
    @gas_station = gas_stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gas_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gas_station" do
    assert_difference('GasStation.count') do
      post :create, gas_station: { bairro: @gas_station.bairro, distribuidora: @gas_station.distribuidora, endereco: @gas_station.endereco, nome: @gas_station.nome }
    end

    assert_redirected_to gas_station_path(assigns(:gas_station))
  end

  test "should show gas_station" do
    get :show, id: @gas_station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gas_station
    assert_response :success
  end

  test "should update gas_station" do
    put :update, id: @gas_station, gas_station: { bairro: @gas_station.bairro, distribuidora: @gas_station.distribuidora, endereco: @gas_station.endereco, nome: @gas_station.nome }
    assert_redirected_to gas_station_path(assigns(:gas_station))
  end

  test "should destroy gas_station" do
    assert_difference('GasStation.count', -1) do
      delete :destroy, id: @gas_station
    end

    assert_redirected_to gas_stations_path
  end
end
