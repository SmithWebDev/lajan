class DashboardController < ApplicationController
  def index
    @company = Company.all
    # @company = Company.find_by(params[:id])
  end
end
