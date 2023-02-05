class PhotosController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :find_photo, :only => [:update, :destroy]
    def index
        @photos = Photo.all.order("created_at DESC")
    end
    def create
        @photo = Photo.create!(photo_params)
    end

    def update
        @photo.update(desc: params[:desc])
        render json: nil, status: :ok
    end
    def destroy
        @photo.url.purge
        @photo.destroy
        render json: nil, status: :ok
    end

    private

    def photo_params
        params.permit(:user_id, :desc, :url)
    end
    def find_photo
        @photo=Photo.find(params[:id])
    end
    
end
