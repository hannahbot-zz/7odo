class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error creating your list."
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error updating your list."
      redirect_to @list
    end
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end

end
