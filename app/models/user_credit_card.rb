class UserCreditCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit_card
end
