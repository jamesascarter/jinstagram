class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @review = @photo.comments.create(comment_params)
    redirect_to photos_path
  end

  def comment_params
    params.require(:comment).permit(:coment)
  end
end
