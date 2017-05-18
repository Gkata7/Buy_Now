class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :cardholder
      t.string :number
      t.date :expiration

      t.timestamps
    end
  end
end
