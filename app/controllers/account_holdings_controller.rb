class AccountHoldingsController < ApplicationController
  before_action :set_account_holding, only: %i[show edit update destroy]

  # GET /account_holdings or /account_holdings.json
  def index
    @account_holdings = AccountHolding.all
  end

  # GET /account_holdings/1 or /account_holdings/1.json
  def show; end

  # GET /account_holdings/new
  def new
    @account_holding = AccountHolding.new
    @account = current_user.accounts
    @companies = Company.all
  end

  # GET /account_holdings/1/edit
  def edit; end

  # POST /account_holdings or /account_holdings.json
  def create
    @account_holding = AccountHolding.new(account_holding_params)

    respond_to do |format|
      if @account_holding.save
        format.html { redirect_to root_path, notice: 'Account holding was successfully created.' }
        format.json { render :show, status: :created, location: @account_holding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account_holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_holdings/1 or /account_holdings/1.json
  def update
    respond_to do |format|
      if @account_holding.update(account_holding_params)
        format.html do
          redirect_to account_holding_url(@account_holding), notice: 'Account holding was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @account_holding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account_holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_holdings/1 or /account_holdings/1.json
  def destroy
    @account_holding.destroy

    respond_to do |format|
      format.html { redirect_to account_holdings_url, notice: 'Account holding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account_holding
    @account_holding = AccountHolding.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_holding_params
    params.require(:account_holding).permit(:company_id, :account_id, :shares, :cost_per_share)
  end
end
