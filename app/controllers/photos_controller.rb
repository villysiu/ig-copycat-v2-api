require "openai"

class PhotosController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :find_photo, :only => [:update, :destroy]
    
    def index
        @photos = Photo.all.order("created_at DESC")
    end
    def create
        # @photo = Photo.create!(photo_params)
        @photo = Photo.new(photo_params)
        # puts "desc"
        # puts @photo.desc
        # p @photo.url.blank?
        # if @photo.url.blank? 
            # openAIClient = OpenAI::Client.new
            # response = openAIClient.images.generate(
            #     parameters: { 
            #         prompt: @photo.desc, 
            #         size: "256x256" 
            #     })
            # puts response.dig("data", 0, "url")
            # puts "OPEN AI"
        #   end
        # @photo.link=response.dig("data", 0, "url")
          @photo.save
         
    end

    def update
        @photo.update!(desc: params[:desc])
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
