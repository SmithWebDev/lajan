class DashboardController < ApplicationController
  # before_action :authenticate_user!

  # def index
  #   @account = Account.find_by(params[:id])
  #   @company = Company.all
  # end

  def trash
    @accounts = current_user.accounts
    # @account = current_user.accounts
    @company = Company.all
    @accountholding = AccountHolding.all
    @companyinfo = CompanyInfo.find_by(params[:company_id])
  end
end
