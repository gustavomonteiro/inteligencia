class PostosController < ApplicationController
  # GET /postos
  # GET /postos.json
  def index
    @postos = Posto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @postos }
    end
  end

  # GET /postos/1
  # GET /postos/1.json
  def show
    @posto = Posto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @posto }
    end
  end

  # GET /postos/new
  # GET /postos/new.json
  def new
    @posto = Posto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @posto }
    end
  end

  # GET /postos/1/edit
  def edit
    @posto = Posto.find(params[:id])
  end

  # POST /postos
  # POST /postos.json
  def create
    @posto = Posto.new(params[:posto])

    respond_to do |format|
      if @posto.save
        format.html { redirect_to @posto, notice: 'Posto was successfully created.' }
        format.json { render json: @posto, status: :created, location: @posto }
      else
        format.html { render action: "new" }
        format.json { render json: @posto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /postos/1
  # PUT /postos/1.json
  def update
    @posto = Posto.find(params[:id])

    respond_to do |format|
      if @posto.update_attributes(params[:posto])
        format.html { redirect_to @posto, notice: 'Posto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @posto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postos/1
  # DELETE /postos/1.json
  def destroy
    @posto = Posto.find(params[:id])
    @posto.destroy

    respond_to do |format|
      format.html { redirect_to postos_url }
      format.json { head :no_content }
    end
  end
end
