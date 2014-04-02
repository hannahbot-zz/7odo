class API::V1::ListsController < ApplicationController

  skip_before_action :verify_authenticity_token
  respond_to :html, :js, :json

  def index
    @lists = List.all
    respond_to do |format|
      format.json { render :json => @lists }
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
    respond_to do |format|
      format.json { render :json => @list }
    end
  end

  def create
    @list = List.new(list_params)
    respond_to do |format|
    if @list.save
      format.json { render json: @list, status: :created }
    else
      format.json { render json: @list.errors, status: :unprocessable_entity }
    end
  end
  end

  def update
    @list = List.find(params[:id])
    respond_to do |format|
      if @list.update_attributes(list_params)
        format.json { head :no_content, status: :ok }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @list.destroy
        format.json { head :no_content, status: :ok }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end

end
