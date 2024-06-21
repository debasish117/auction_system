class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.all
  end

  def show
    @bids = @items.bids.order(amount: :desc)
  end

  def new
    @item = current_user.items.build
  end
  
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated. '
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed. '
  end

  private

  def set_items
    @item = item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :starting_price, :minimum_selling_price, :start_time, :end_time)
  end
end
