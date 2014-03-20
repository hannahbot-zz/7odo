class ItemsController < ApplicationController
  respond_to :html, :js

  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list

    if @item.save
      flash[:notice]= "Item was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving your item."
      render :new
    end

    # respond_with(@item) do |f|
    #   f.html { redirect_to [@list, @item]}
    # end
  end

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    authorize @post
    if @item.update_attributes(item_params)
      flash[:notice] = "Item was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error updating this item."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    authorize @post
    if @item.destroy
      flash[:notice] = "7 days are up! Item was deleted."
    else
      flash[:error] = "There was an error deleting the item."
      render :show
    end
  end

  def item_params
    params.require(:item).permit(:description, :days, :complete, :list_id)
  end
end
