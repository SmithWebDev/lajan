class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :symbol
      t.string :name
      t.integer :cik
      t.text :description
      t.string :exchange
      t.string :sector
      t.string :industry

      t.timestamps
    end
  end
end
