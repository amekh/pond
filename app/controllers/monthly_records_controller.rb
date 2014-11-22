# coding: utf-8

class MonthlyRecordsController < ApplicationController

  include Garage::RestfulActions
  include Garage::ControllerHelper
  
  before_action :set_monthly_record, only: [:show, :edit, :update, :destroy]

  # GET /monthly_records.json
  def index

    @monthly_record = Domain::MonthlyRecordDomain.new()
    @monthly_record.find_all

    render :json => @monthly_record.json_format
  end

  # GET /monthly_records/1
  # GET /monthly_records/1.json
  def show
  end

  # GET /monthly_records/new
  def new
    @monthly_record = MonthlyRecord.new
  end

  # GET /monthly_records/1/edit
  def edit
  end

  # POST /monthly_records
  # POST /monthly_records.json
  def create
    @monthly_record = MonthlyRecord.new(monthly_record_params)

    respond_to do |format|
      if @monthly_record.save
        format.html { redirect_to @monthly_record, notice: 'Monthly record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @monthly_record }
      else
        format.html { render action: 'new' }
        format.json { render json: @monthly_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_records/1
  # PATCH/PUT /monthly_records/1.json
  def update
    respond_to do |format|
      if @monthly_record.update(monthly_record_params)
        format.html { redirect_to @monthly_record, notice: 'Monthly record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @monthly_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_records/1
  # DELETE /monthly_records/1.json
  def destroy
    @monthly_record.destroy
    respond_to do |format|
      format.html { redirect_to monthly_records_url }
      format.json { head :no_content }
    end
  end

  def require_resources
    @resources = MonthlyRecord.all
  end

    # Garage用のフィルターメソッド
  def current_resource_owner
    @current_resource_owner ||= User.find(resource_owner_id) if resource_owner_id
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_monthly_record
    @monthly_record = MonthlyRecord.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def monthly_record_params
    params.require(:monthly_record).permit(:user_id, :salary, :outlay, :allowance, :carfare, :month, :late_time)
  end

end
