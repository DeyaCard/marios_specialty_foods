class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]
  before_action :only => [:edit, :update, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    # Code for listing all reviews goes here.
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Thanks for the feedback!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Error - please try again."
      render :new
    end  
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review updated"
      redirect_to product_path(@review.product)
    else
      flash[:alert] = "Error - please try again."
      @product = Product.find(params[:product_id])
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private
  def review_params
    params.require(:review).permit(:author, :rating, :content_body)
  end
end

