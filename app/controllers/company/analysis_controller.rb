class Company::AnalysisController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
  end
end
