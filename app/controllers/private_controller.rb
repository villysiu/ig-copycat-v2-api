class PrivateController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  
  def test
      render json: current_user, except: [:created_at, :updated_at],
      status: :ok
  end

  def index
    @users=User.all
    
    render json: @users, except: [:created_at, :updated_at], 
    status: :ok
  end

  def update
    current_user.update(name: params[:name])
    current_user.update(bio: params[:bio])
    render json:current_user, except: [:created_at, :updated_at],
    status: :ok
  end

  private

  def user_params
      params.permit(:name, :bio )
  end
  
 
end
