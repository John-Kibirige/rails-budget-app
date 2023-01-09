class CtegoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ctegory, only: %i[ show edit update destroy ]

  # GET /ctegories or /ctegories.json
  def index
    @ctegories = Ctegory.all
  end

  # GET /ctegories/1 or /ctegories/1.json
  def show
  end

  # GET /ctegories/new
  def new
    @ctegory = Ctegory.new
  end

  # GET /ctegories/1/edit
  def edit
  end

  # POST /ctegories or /ctegories.json
  def create
    @ctegory = Ctegory.new(ctegory_params)

    respond_to do |format|
      if @ctegory.save
        format.html { redirect_to ctegory_url(@ctegory), notice: "Ctegory was successfully created." }
        format.json { render :show, status: :created, location: @ctegory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ctegory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ctegories/1 or /ctegories/1.json
  def update
    respond_to do |format|
      if @ctegory.update(ctegory_params)
        format.html { redirect_to ctegory_url(@ctegory), notice: "Ctegory was successfully updated." }
        format.json { render :show, status: :ok, location: @ctegory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ctegory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ctegories/1 or /ctegories/1.json
  def destroy
    @ctegory.destroy

    respond_to do |format|
      format.html { redirect_to ctegories_url, notice: "Ctegory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ctegory
      @ctegory = Ctegory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ctegory_params
      params.require(:ctegory).permit(:name, :icon)
    end
end
