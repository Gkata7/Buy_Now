class CartsController < ApplicationController
    def index
  	@items = ProductCart.where(user:current_user)
   	session[:subtotal] = 0
    	@items.each { |item| session[:subtotal] += item.product.price*item.quantity }
    end

    def create
  	@product = Product.find(params[:product_id])
  	@product_in_cart = ProductCart.find_by(user:current_user, product:@product)
  	if @product_in_cart
  		@product_in_cart.quantity += Integer(params[:amount])
    		@product_in_cart.save!
  	else
  		ProductCart.create(user:current_user, product:@product, quantity:params[:amount])
	end
   	session[:in_cart] = ProductCart.where(user:current_user).sum("quantity")
	flash[:success] = "Item added to cart"
  	redirect_to "/products/#{@product.id}"
   
    end

    def update
        @product_in_cart = ProductCart.find_by(user:current_user, product:params[:id]).update(quantity:params[:amount])
   	session[:in_cart] = ProductCart.where(user:current_user).sum("quantity")
	redirect_to "/carts/#{current_user.id}"
    end

    def destroy
	ProductCart.find(params[:id]).destroy
	redirect_to "/carts/#{current_user.id}"
	session[:in_cart] = ProductCart.where(user:current_user).sum("quantity")
    end
end
