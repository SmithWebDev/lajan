class CreateCompanyInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :company_infos do |t|
      t.date :fiscalyearend
      t.date :latestquarter
      t.bigint :ebitda
      t.float :peratio
      t.float :dividend_per_share
      t.float :dividend_yield
      t.float :eps
      t.float :year_high
      t.float :year_low
      t.bigint :shares_outstanding
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
