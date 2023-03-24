class Users::UserController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_current_user, :except => [:index, :show]

  def index
    @users=User.all
  end

  def curr_user
      render json: @user.id, except: [:created_at, :updated_at], status: :ok
    
  end

  def update
    
    @user.update(name: params[:name]) 
    @user.update(bio: params[:bio]) 
    render json: @user.id, except: [:created_at, :updated_at], status: :ok
  end

  def show
    @user=User.find(params[:id])  
  end

  private
  def avatar_params
    params.permit(:name, :bio )
  end
    
  def find_current_user
      @user=current_user
  end
end
