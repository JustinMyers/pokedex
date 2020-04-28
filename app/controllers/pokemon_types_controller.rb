class PokemonTypesController < ApplicationController
  before_action :set_pokemon_type, only: [:show, :edit, :update, :destroy]

  # GET /pokemon_types
  # GET /pokemon_types.json
  def index
    @pokemon_types = PokemonType.all
  end

  # GET /pokemon_types/1
  # GET /pokemon_types/1.json
  def show
  end

  # GET /pokemon_types/new
  def new
    @pokemon_type = PokemonType.new
  end

  # GET /pokemon_types/1/edit
  def edit
  end

  # POST /pokemon_types
  # POST /pokemon_types.json
  def create
    @pokemon_type = PokemonType.new(pokemon_type_params)

    respond_to do |format|
      if @pokemon_type.save
        format.html { redirect_to @pokemon_type, notice: 'Pokemon type was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon_type }
      else
        format.html { render :new }
        format.json { render json: @pokemon_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemon_types/1
  # PATCH/PUT /pokemon_types/1.json
  def update
    respond_to do |format|
      if @pokemon_type.update(pokemon_type_params)
        format.html { redirect_to @pokemon_type, notice: 'Pokemon type was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon_type }
      else
        format.html { render :edit }
        format.json { render json: @pokemon_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemon_types/1
  # DELETE /pokemon_types/1.json
  def destroy
    @pokemon_type.destroy
    respond_to do |format|
      format.html { redirect_to pokemon_types_url, notice: 'Pokemon type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_type
      @pokemon_type = PokemonType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_type_params
      params.require(:pokemon_type).permit(:name)
    end
end
