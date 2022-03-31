class AddAttrsToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :exchange, :string
    add_column :companies, :sector, :string
    add_column :companies, :industry, :string
    add_column :companies, :fiscalyearend, :date
    add_column :companies, :latestquarter, :date
    add_column :companies, :ebitda, :bigint
    add_column :companies, :peratio, :float
    add_column :companies, :dividend_per_share, :float
    add_column :companies, :dividend_yield, :float
    add_column :companies, :eps, :float
    add_column :companies, :year_high, :float
    add_column :companies, :year_low, :float
    add_column :companies, :shares_outstanding, :bigint
  end
end
