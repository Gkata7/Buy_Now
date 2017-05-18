class Product < ActiveRecord::Base
	belongs_to :category
	has_many :product_orders
	has_many :users, through: :product_orders
	has_many :my_carts
	has_many :user_carts, through: :my_carts, source: :user
	has_many :reviews
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end

