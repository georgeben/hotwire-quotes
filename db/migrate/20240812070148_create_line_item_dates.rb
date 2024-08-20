class CreateLineItemDates < ActiveRecord::Migration[7.1]
  def change
    create_table :line_item_dates do |t|
      t.date :date, null: false
      t.references :quote, null: false, foreign_key: true

      t.timestamps
    end

    # Adding uniqueness constraint for the couple date and quote_id
    add_index :line_item_dates, [:date, :quote_id], unique: true
    
    add_index :line_item_dates, :date
  end
end
