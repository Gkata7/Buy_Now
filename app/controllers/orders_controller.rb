class OrdersController < ApplicationController
  def create
  	@cart_items = ProductCart.where(user:current_user)
    number = (0..10).map { (rand(1...10)) }.join
    i = 0
    @cart_items.each do |item|
      if i == 0
    		ProductOrder.create(product:item.product, user:current_user, quantity:item.quantity, numbers:number)
        i += 1
      else
        ProductOrder.create(product:item.product, user:current_user, quantity:item.quantity)
        i += 1
      end
  	end
  	@order = ProductOrder.last.id
    ProductCart.destroy_all
  	redirect_to "/users/#{current_user.id}"
  end
end
