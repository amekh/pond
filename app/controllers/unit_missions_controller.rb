class UnitMissionsController < ApplicationController
  before_action :set_unit_mission, only: [:show, :edit, :update, :destroy]

  # GET /unit_missions
  # GET /unit_missions.json
  def index
    @unit_missions = UnitMission.all
  end

  # GET /unit_missions/1
  # GET /unit_missions/1.json
  def show
  end

  # GET /unit_missions/new
  def new
    @unit_mission = UnitMission.new
  end

  # GET /unit_missions/1/edit
  def edit
  end

  # POST /unit_missions
  # POST /unit_missions.json
  def create
    @unit_mission = UnitMission.new(unit_mission_params)

    respond_to do |format|
      if @unit_mission.save
        format.html { redirect_to @unit_mission, notice: 'Unit mission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unit_mission }
      else
        format.html { render action: 'new' }
        format.json { render json: @unit_mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_missions/1
  # PATCH/PUT /unit_missions/1.json
  def update
    respond_to do |format|
      if @unit_mission.update(unit_mission_params)
        format.html { redirect_to @unit_mission, notice: 'Unit mission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unit_mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_missions/1
  # DELETE /unit_missions/1.json
  def destroy
    @unit_mission.destroy
    respond_to do |format|
      format.html { redirect_to unit_missions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_mission
      @unit_mission = UnitMission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_mission_params
      params.require(:unit_mission).permit(:mission_id, :user_id, :unit_cost, :start_date, :period, :limit_over_cost_lower, :limit_over_cost_higher)
    end
end
