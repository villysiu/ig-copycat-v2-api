class PrivateController < ApplicationController
  before_action :authenticate_user!
  def test
      render json: current_user, except: [:created_at, :updated_at],
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
