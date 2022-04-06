class CreateTrashes < ActiveRecord::Migration[7.0]
  def change
    create_table :trashes do |t|
      t.date :fiscalyearend
      t.date :latestquarter
      t.float :dividend_per_share
      t.float :dividend_yield
      t.float :eps
      t.float :year_high
      t.float :year_low
      t.references :company, null: false, foreign_key: true
      t.float :ebitda
      t.string :shares_outstanding
      t.float :peratio

      t.timestamps
    end
  end
end
