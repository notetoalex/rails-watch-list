class ListsController < ApplicationController

  def index
  @lists = List.all
  end

  # This is the old code that Barry helped me with
  # def show
  #   @list = List.find(params[:id])
  # end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      # redirect_to lists_path
      # redirect_to list_path(@list)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
