class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @article = Article.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new
    end
  end

  private

  def article_params
    prams.require(:item).permit(:name, :category_id, :price, :detail, :condition_id, :delivery_area_id, :delivery_bear_id, :delivery_day_id, :user)
  end
  
end
