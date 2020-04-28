class MatchupsController < ApplicationController
  before_action :set_matchup, only: [:show, :edit, :update, :destroy]

  # GET /matchups
  # GET /matchups.json
  def index
		@matchups = Matchup.all
  end

  # GET /matchups/1
  # GET /matchups/1.json
  def show
  end

  # GET /matchups/new
  def new
    @matchup = Matchup.new
  end

  # GET /matchups/1/edit
  def edit
  end

  # POST /matchups
  # POST /matchups.json
  def create
    @matchup = Matchup.new(matchup_params)

    respond_to do |format|
      if @matchup.save
        format.html { redirect_to @matchup, notice: 'Matchup was successfully created.' }
        format.json { render :show, status: :created, location: @matchup }
      else
        format.html { render :new }
        format.json { render json: @matchup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matchups/1
  # PATCH/PUT /matchups/1.json
  def update
    respond_to do |format|
      if @matchup.update(matchup_params)
				format.html { redirect_to action: :index, anchor: @matchup.id }
        # format.html { redirect_to @matchup, notice: 'Matchup was successfully updated.' }
        format.json { render :show, status: :ok, location: @matchup }
      else
        format.html { render :edit }
        format.json { render json: @matchup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchups/1
  # DELETE /matchups/1.json
  def destroy
    @matchup.destroy
    respond_to do |format|
      format.html { redirect_to matchups_url, notice: 'Matchup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matchup
      @matchup = Matchup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def matchup_params
      params.require(:matchup).permit(:attacking_pokemon_type_id, :defending_pokemon_type_id, :effectiveness)
    end
end
