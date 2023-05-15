class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  
  
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if current_user.id == @item.user_id
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  #def destroy
    #@item = Item.find(params[:id])
    #if @item.destroy
      #redirect_to root_path
    #else
      #redirect_to root_path
    #end
  #end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :charge_id, :region_id, :period_id, :price, :image).merge(user_id: current_user.id)
  end

end
