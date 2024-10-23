class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @store = Store.find(params[:store_id])
    @rating = @store.ratings.new(rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_to store_path(@store), notice: 'Rating submitted successfully.'
    else
      redirect_to store_path(@store), alert: 'Failed to submit rating.'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :comment)
  end
end
