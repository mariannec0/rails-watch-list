class ListsController < ApplicationController
  def index
    @lists = List.all
    @movies = Movie.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
