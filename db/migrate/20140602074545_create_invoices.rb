class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :purchase, index: true
      t.string :reference_number

      t.timestamps
    end
  end
end
