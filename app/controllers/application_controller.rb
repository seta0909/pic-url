class ApplicationController < ActionController::API
  def index
    @users = []
    render json: @users
  end
end
