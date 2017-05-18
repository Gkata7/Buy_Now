class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :content, presence: :true, length: { minimum: 2 }
end
