class UsersController < ApplicationController

  def index
    result = User::Operation::Index.()
    render json: result[:users]
  end

  def show
    result = User::Operation::Show.({params: { id: params[:id]}})
    render json: result[:data], status: result[:data][:status]
  end
  
end
