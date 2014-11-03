# coding: utf-8
class MonthlyRecodesController < ApplicationController
  before_action :set_monthly_recode, only: [:show, :edit, :update, :destroy]

  # GET /monthly_recodes.json
  def index
    @monthly_recodes = MonthlyRecode.all
  end

  # GET /monthly_recodes/1
  # GET /monthly_recodes/1.json
  def show
  end

  # GET /monthly_recodes/new
  def new
    @monthly_recode = MonthlyRecode.new
  end

  # GET /monthly_recodes/1/edit
  def edit
  end

  # POST /monthly_recodes
  # POST /monthly_recodes.json
  def create
    @monthly_recode = MonthlyRecode.new(monthly_recode_params)

    respond_to do |format|
      if @monthly_recode.save
        format.html { redirect_to @monthly_recode, notice: 'Monthly recode was successfully created.' }
        format.json { render action: 'show', status: :created, location: @monthly_recode }
      else
        format.html { render action: 'new' }
        format.json { render json: @monthly_recode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_recodes/1
  # PATCH/PUT /monthly_recodes/1.json
  def update
    respond_to do |format|
      if @monthly_recode.update(monthly_recode_params)
        format.html { redirect_to @monthly_recode, notice: 'Monthly recode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @monthly_recode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_recodes/1
  # DELETE /monthly_recodes/1.json
  def destroy
    @monthly_recode.destroy
    respond_to do |format|
      format.html { redirect_to monthly_recodes_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_monthly_recode
    @monthly_recode = MonthlyRecode.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def monthly_recode_params
    params.require(:monthly_recode).permit(:user_id, :salary, :welfare, :carfare, :month)
  end  

end
