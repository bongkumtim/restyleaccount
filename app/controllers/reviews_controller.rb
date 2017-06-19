class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_listing
  before_action :authenticate_user!


  def new
    @review = Review.new
  end

 
  def edit
  end


  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.list_id = @list.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @list, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @list, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_review
      @review = Review.find(params[:id])
    end

    def set_listing
      @list = List.find(params[:list_id])
    end


    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end