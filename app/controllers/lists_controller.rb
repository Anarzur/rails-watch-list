class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def list_params
    # we are whitelisting the attributes a user can give us
    params.require(:list).permit(:name, :photo)
  end


end
