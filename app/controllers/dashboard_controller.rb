class DashboardController < ApplicationController
  def index
    @account = Account.find_by(params[:id])
    @company = Company.all
    # @company = Company.find_by(params[:id])
  end
end
