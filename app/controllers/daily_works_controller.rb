# coding: utf-8
class DailyWorksController < ApplicationController

  include Garage::RestfulActions
  include Garage::ControllerHelper
  
  def index
    render :json => @resources.json_format
  end

  def show
    render :json => @resource.json_format
  end

  def new
    @daily_work = DailyWork.new
  end

  def edit
  end

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

  def destroy
    @daily_work.destroy
    respond_to do |format|
      format.html { redirect_to daily_works_url }
      format.json { head :no_content }
    end
  end

  def require_resources
    @resources = DailyWork.new
    @resources.find_joins_all
  end

  def require_resource
    @resource = DailyWork.new
    @resource.find_by_date_and_user
  end

  # Garage用のフィルターメソッド
  def current_resource_owner
    @current_resource_owner ||= User.find(resource_owner_id) if resource_owner_id
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def daily_work_params
    params.require(:daily_work).permit(:user_id, :monthly_record_id, :unit_mission_id, :start_time,
                                       :end_time, :status, :contents, :memo, :target_date, :rest_time)
  end

end
