class DashboardController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_current_account

  def trash
    @accounts = current_user.accounts
    @account = current_user.accounts.first
    # @company = Company.find(params[:company_id])
    @companyinfo = CompanyInfo.find_by(params[:company_id])
    # go through every account holding and retrieve the annual dividend
    total = 0
    @accountholdings = @account.account_holdings.each do |ah|
      total = ah.stock_annual_income + total
    end
    # sum to the annualized dividends of all the account holdings
    @total = total

    total_shares = 0
    @shares_total = @account.account_holdings.where(company_id: 1).each do |ah|
      total_shares = ah.shares + total_shares
    end
    @total_shares = total_shares

    invested = 0
    @principle = current_user.accounts.first.account_holdings.each do |x|
      invested = x.principle_invested + invested
    end
    @total_principle_invested = invested
  end

  def trash2
    @empty = current_user.accounts.empty?
    @user = current_user
    @accounts = current_user.accounts
  end

  def tester; end

  private

  def set_current_account
    @account = if session[:current_account_id].present?
                 Account.find(session[:current_account_id])
               else
                 current_user.accounts.first
               end
  end

  def set_company_info
    @company_info = CompanyInfo.find(params[:company_id])
  end
end
