class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  before_action :all_lists


  def index
    @lists = List.all
    new
  end

  def show
    @bookmarks = Bookmark.all
    @bookmark = Bookmark.new
    # raise
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def all_lists
    @all_lists = List.all
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
