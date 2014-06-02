class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :purchase, index: true
      t.references :product, index: true
      t.integer :quantity
      t.decimal :cost

      t.timestamps
    end
  end
end
