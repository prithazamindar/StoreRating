class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  
  def index
    @stores = Store.all
  end

  def show
    @ratings = @store.ratings
  end

  def new
    @store = current_user.stores.new
  end

  def create
    @store = current_user.stores.new(store_params)
    if @store.save
      redirect_to @store, notice: 'Store was successfully created.'
    else
      render :new
    end
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :address)
  end
end
