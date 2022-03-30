class DashboardController < ApplicationController
  def index
    @account = Account.find_by(params[:id])
    @company = Company.all
  end

  def trash
    @company = Company.all
    @accountholding = AccountHolding.all
  end
end
