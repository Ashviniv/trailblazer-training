module User::Operation
  class Show < Trailblazer::Operation
    
    step :fetch_user
    fail :set_user_not_found

    def fetch_user(ctx, params:, **)
      ctx[:data] = {}
      ctx[:data][:user] = User.find_by(id: params[:id])
      ctx[:data][:status] = :ok
      ctx[:data][:user]
    end

    def set_user_not_found(ctx, **)
      ctx[:data][:message] = "User not found"
      ctx[:data][:status] = :unprocessable_entity
    end
  end
end