class ReviewsController < ApplicationController
	def create
		@review = Review.new(review_params)
		@product = Product.find(params[:review][:product])
		unless @review.valid?
			flash[:review_error] = "Must be at least 15 characters"
		else
			@review.save!
			@review.update(product:@product, user:current_user)
		end
		data = Review.select("*").joins(:user).where(id:@review.id)
		data[1] = data[0].created_at.strftime("%B %d, %Y")
		render json: data
	end

	private
	def review_params
		params.require(:review).permit(:content, :rating)
	end
end
