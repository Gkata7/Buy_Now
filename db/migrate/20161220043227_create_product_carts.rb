class CreateProductCarts < ActiveRecord::Migration
  def change
    create_table :product_carts do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
