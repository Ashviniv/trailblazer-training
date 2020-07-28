module User::Operation
  class Index < Trailblazer::Operation

    step :request_from_web_app?
    fail :get_users_for_mobile_app
    pass :get_users_for_web_app
    
    def request_from_web_app?(ctx, params:, **)
      params[:is_request_from_web_app]
    end

    def get_users_for_mobile_app(ctx, **)
       ctx[:users] = User.all.order(created_at: :desc)
    end

    def get_users_for_web_app(ctx, **)
      ctx[:users] = User.all.where(created_at: (Date.current - 5.days...Date.current), 
                                      status: 1)
    end
  end
end