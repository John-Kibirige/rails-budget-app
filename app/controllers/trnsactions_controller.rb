class TrnsactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trnsaction, only: %i[ show edit update destroy ]
  before_action :set_categories_array , only: [:edit, :update, :new, :create]

  # GET /trnsactions or /trnsactions.json
  def index
    @trnsactions = Trnsaction.order(created_at: :desc)
    @ctegory = Ctegory.find(params[:ctegory_id])
    @transaction_categories = @ctegory.transaction_categories.order(created_at: :desc).includes(:trnsaction)
  end

  # GET /trnsactions/1 or /trnsactions/1.json
  def show
  end

  # GET /trnsactions/new
  def new
    @ctegories = Ctegory.all
    @trnsaction = Trnsaction.new
  end

  # GET /trnsactions/1/edit
  def edit
  end

  # POST /trnsactions or /trnsactions.json
  def create
    name = params["trnsaction"]["name"]
    amount =params["trnsaction"]["amount"]
    ctegory_id = params["trnsaction"]["ctegory_id"]

    @trnsaction = Trnsaction.new(name: name, amount: amount)
    @trnsaction.author_id = current_user.id


    respond_to do |format|
      if @trnsaction.save
        # create save this to the transaction categories table
        TransactionCategory.create(ctegory_id: ctegory_id, trnsaction_id: @trnsaction.id)
        format.html { redirect_to ctegory_url(ctegory_id), notice: "Trnsaction was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trnsactions/1 or /trnsactions/1.json
  def update
    respond_to do |format|
      if @trnsaction.update(trnsaction_params)
        format.html { redirect_to trnsaction_url(@trnsaction), notice: "Trnsaction was successfully updated." }
        format.json { render :show, status: :ok, location: @trnsaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trnsaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trnsactions/1 or /trnsactions/1.json
  def destroy
    @trnsaction.destroy

    respond_to do |format|
      format.html { redirect_to trnsactions_url, notice: "Trnsaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trnsaction
      @trnsaction = Trnsaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trnsaction_params
      params.require(:trnsaction).permit(:name, :amount, :ctegory_id)
    end

    def set_categories_array
      @category_array = Ctegory.all
    end
end
