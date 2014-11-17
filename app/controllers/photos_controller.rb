class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    if current_user
      @photo = Photo.new(photo_params)
      @photo.user_id = current_user.id
    end

    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end


  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'photo deleted successfully'
    redirect_to '/photos'
  end


  private

  def photo_params
    params[:photo].permit(:caption, :image)
  end
end