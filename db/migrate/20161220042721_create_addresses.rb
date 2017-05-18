class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.boolean :billing
      t.boolean :shipping
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
