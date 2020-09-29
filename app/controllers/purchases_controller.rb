class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new]

  # GET /purchases/new
  def new
    @purchase = current_user.purchases.build(plan_type: params[:plan_type])
    @purchase.set_price
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = current_user.purchases.build(purchase_params)
    @purchase.set_price
    @purchase.save
    @purchase.create_checkout_session(dashboard_url, new_purchase_url(plan_type: @purchase.plan_type))
    respond_to do |format|
      if @purchase.save
        format.html { render 'purchases/checkout_session_redirect' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:plan_type)
    end
end
