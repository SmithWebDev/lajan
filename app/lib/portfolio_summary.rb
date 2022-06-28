class PortfolioSummary
  # Create method to do calculations

  def process(portfolio_holdings)
    plucked = portfolio_holdings.distinct.pluck(:company_id)
    plucked.each do |c_id|
      owned = portfolio_holdings.where(company_id: c_id)
      total_shares = owned.sum(:shares)
      avg_cost_per_share = owned.average(:cost_per_share)
      p total_shares
      p avg_cost_per_share
    end
  end
end
