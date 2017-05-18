class CheckoutController < ApplicationController
  def index
  	@items = ProductCart.where(user:current_user)
  end

end
