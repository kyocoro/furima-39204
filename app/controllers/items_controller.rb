class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :contributor_confirmation, only: [:edit, :update]
  
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
    
  end

  def edit
    
  end

  def update
  
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
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :charge_id, :region_id, :period_id, :price, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end

end
