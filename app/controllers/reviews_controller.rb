class ReviewsController < ApplicationController

    # GET /reviews/new
    def new
      set_restaurant
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
      set_restaurant
      @review.restaurant = @restaurant
      # @review.save
      # redirect_to restaurant_path(@restaurant)

      if @review.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new
      end
    end

    private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
