class AddColumnToProductOrder < ActiveRecord::Migration
  def change
    add_column :product_orders, :numbers, :string
  end
end
