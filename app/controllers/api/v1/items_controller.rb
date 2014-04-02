class API::V1::ItemsController < ApplicationController

  skip_before_action :verify_authenticity_token
  respond_to :html, :js, :json

  def index
    @items = Item.all
    respond_to do |format|
      format.json { render :json => @items }
    end
  end

  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    respond_to do |format|
      format.json { render :json => @item }
    end
  end

  def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list
    respond_to do |format|
      if @item.save
        format.json { render json: @item, status: :created }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
    # respond_with(@item) do |f|
    #   f.html { redirect_to [@list, @item]}
    # end
  end

  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    authorize @post
    respond_to do |format|
      if @item.update_attributes(item_params)
        format.json { head :no_content, status: :ok }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.destroy
        format.json { head :no_content, status: :ok }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    @items = Item.find(params[:id])
    @items.each do |item|
      item.destroy
    end
  end

  def item_params
    params.require(:item).permit(:description, :days, :completed, :list_id)
  end
end
