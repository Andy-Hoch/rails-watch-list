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

    @img_url = @list.photo.key.nil? ? 'https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2059&q=80' : @list.photo.url
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
    params.require(:list).permit(:name, :photo)
  end
end
