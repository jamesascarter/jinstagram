class LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create
    redirect_to photos_path
  end
end
