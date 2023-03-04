class LikesController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :find_photo
    # before_action :find_like, :only => [:destroy]
    def index
        @likes=@photo.likes
    end
    def create
        @like= @photo.likes.create!(user_id: current_user.id)
        render json: {id: @like.id, user_id: @like.user_id}, status: :ok
    end

    def destroy
        @like=@photo.likes.find_by(user_id: current_user.id)
        @like.destroy
        render json: @like.id, status: :ok
    end

    private

    def find_photo
        puts params[:photo_id]
        puts params[:comment]
        @photo=Photo.find(params[:photo_id])
    end
    # def find_like
    #     @like=@photo.likes.find(params[:id])
    # end
    

end
