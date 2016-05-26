class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.float :price
      t.integer :vat_rate
      t.datetime :issued_at
      t.references :client
      t.references :category
    end
  end
end
