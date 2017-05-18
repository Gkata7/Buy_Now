class CreateUserCreditCards < ActiveRecord::Migration
  def change
    create_table :user_credit_cards do |t|
      t.references :user, index: true
      t.references :credit_card, index: true

      t.timestamps
    end
  end
end
