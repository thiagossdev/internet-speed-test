class InternetSpeedsController < ApplicationController
  before_action :set_internet_speed, only: %i[ show edit update destroy ]

  # GET /internet_speeds or /internet_speeds.json
  def index
    @internet_speeds = InternetSpeed.all
  end

  # GET /internet_speeds/1 or /internet_speeds/1.json
  def show
  end

  # GET /internet_speeds/new
  def new
    @internet_speed = InternetSpeed.new
  end

  # GET /internet_speeds/1/edit
  def edit
  end

  # POST /internet_speeds or /internet_speeds.json
  def create
    @internet_speed = InternetSpeed.new(internet_speed_params)

    respond_to do |format|
      if @internet_speed.save
        format.html { redirect_to internet_speed_url(@internet_speed), notice: "Internet speed was successfully created." }
        format.json { render :show, status: :created, location: @internet_speed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @internet_speed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internet_speeds/1 or /internet_speeds/1.json
  def update
    respond_to do |format|
      if @internet_speed.update(internet_speed_params)
        format.html { redirect_to internet_speed_url(@internet_speed), notice: "Internet speed was successfully updated." }
        format.json { render :show, status: :ok, location: @internet_speed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @internet_speed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internet_speeds/1 or /internet_speeds/1.json
  def destroy
    @internet_speed.destroy

    respond_to do |format|
      format.html { redirect_to internet_speeds_url, notice: "Internet speed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internet_speed
      @internet_speed = InternetSpeed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internet_speed_params
      params.require(:internet_speed).permit(:place_id, :download_speed, :download_units)
    end
end
