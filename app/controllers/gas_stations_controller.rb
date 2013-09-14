class GasStationsController < ApplicationController
  # GET /gas_stations
  # GET /gas_stations.json
  def index
    # @gas_stations = GasStation.order('nome')
    
    @gas_stations = GasStation.search(params[:search])
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gas_stations }
    end
  end

  # GET /gas_stations/1
  # GET /gas_stations/1.json
  def show
    @gas_station = GasStation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gas_station }
    end
  end

  # GET /gas_stations/new
  # GET /gas_stations/new.json
  def new
    @gas_station = GasStation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gas_station }
    end
  end

  # GET /gas_stations/1/edit
  def edit
    @gas_station = GasStation.find(params[:id])
  end

  # POST /gas_stations
  # POST /gas_stations.json
  def create
    @gas_station = GasStation.new(params[:gas_station])

    respond_to do |format|
      if @gas_station.save
        format.html { redirect_to @gas_station, notice: 'Gas station was successfully created.' }
        format.json { render json: @gas_station, status: :created, location: @gas_station }
      else
        format.html { render action: "new" }
        format.json { render json: @gas_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gas_stations/1
  # PUT /gas_stations/1.json
  def update
    @gas_station = GasStation.find(params[:id])

    respond_to do |format|
      if @gas_station.update_attributes(params[:gas_station])
        format.html { redirect_to @gas_station, notice: 'Gas station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gas_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gas_stations/1
  # DELETE /gas_stations/1.json
  def destroy
    @gas_station = GasStation.find(params[:id])
    @gas_station.destroy

    respond_to do |format|
      format.html { redirect_to gas_stations_url }
      format.json { head :no_content }
    end
  end
end
