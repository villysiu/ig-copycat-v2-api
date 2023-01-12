class PrivateController < ApplicationController
  before_action :authenticate_user!
  def test
      render json: { 
        # user: {
          id: current_user.id,
          email: current_user.email, 
          name: current_user.name
        # } 
      }, 
        status: :ok
  end


end
