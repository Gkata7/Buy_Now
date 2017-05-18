class CreditCard < ActiveRecord::Base
	has_many :user_credit_cards
	has_many :users, through: :user_credit_cards
end
