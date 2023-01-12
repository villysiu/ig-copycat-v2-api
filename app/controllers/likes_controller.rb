class LikesController < ApplicationController

    before_action :find_photo
    before_action :find_like, :only => [:destroy]
    def index
        render json: @photo.likes, only: [:id, :user_id], include: [user: { only: [:name]}]
        # render json: @photo.likes,  include: [user: { only: [:name]}]
    end
    def create
        @like= @photo.likes.create(user_id: current_user.id)
        
    end
    def destroy
        @like.destroy
        render json: @like.id
        # User.find_by(username: params[:id]).destroy
        # @photo.likes.find_by(user_id: current_user.id).destroy
    end

    private

    def find_photo
        @photo=Photo.find(params[:photo_id])
    end
    def find_like
        puts params
        @like=@photo.likes.find(params[:id])
    end
    

end
