class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Ton signet a été créé !'
    else
      render :new
    end
  end

  def destroy
   @list = List.find(params[:list_id])
   @bookmark = @list.bookmarks.find(params[:id])
   @bookmark.destroy
   redirect_to list_path(@list), notice: 'Bookmark was successfully deleted.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
