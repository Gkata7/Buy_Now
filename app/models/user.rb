class User < ActiveRecord::Base
	email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	has_many :user_addresses
	has_many :addresses, through: :user_addresses
	has_many :user_credit_cards
	has_many :credit_cards, through: :user_credit_cards
	has_many :product_orders
	has_many :products, through: :product_orders
	has_one :product_cart
	has_many :products_in_cart, through: :product_cart, source: :product
	has_many :reviews
	has_secure_password
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :first_name, :last_name, :email, presence: :true
	validates :email, format: { with: email_regex }, uniqueness: { case_sensitive: false }
end
