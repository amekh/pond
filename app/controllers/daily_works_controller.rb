class DailyWorksController < ApplicationController
  before_action :set_daily_work, only: [:show, :edit, :update, :destroy]

  # GET /daily_works
  # GET /daily_works.json
  def index
    @daily_works = DailyWork.all
  end

  # GET /daily_works/1
  # GET /daily_works/1.json
  def show
  end

  # GET /daily_works/new
  def new
    @daily_work = DailyWork.new
  end

  # GET /daily_works/1/edit
  def edit
  end

  # POST /daily_works
  # POST /daily_works.json
  def create
    @daily_work = DailyWork.new(daily_work_params)

    respond_to do |format|
      if @daily_work.save
        format.html { redirect_to @daily_work, notice: 'Daily work was successfully created.' }
        format.json { render action: 'show', status: :created, location: @daily_work }
      else
        format.html { render action: 'new' }
        format.json { render json: @daily_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_works/1
  # PATCH/PUT /daily_works/1.json
  def update
    respond_to do |format|
      if @daily_work.update(daily_work_params)
        format.html { redirect_to @daily_work, notice: 'Daily work was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @daily_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_works/1
  # DELETE /daily_works/1.json
  def destroy
    @daily_work.destroy
    respond_to do |format|
      format.html { redirect_to daily_works_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_work
      @daily_work = DailyWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_work_params
      params.require(:daily_work).permit(:user_id, :unit_mission, :start_time, :end_time, :type, :contents, :memo)
    end
end
