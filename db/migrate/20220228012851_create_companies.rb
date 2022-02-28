class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :symbol
      t.string :name
      t.text :description
      t.integer :cik

      t.timestamps
    end
  end
end
