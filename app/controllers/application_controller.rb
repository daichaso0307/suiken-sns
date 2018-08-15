class ApplicationController < ActionController::Base
    def get_login_user
        @login_user = nil
        unless cookies[:user_id].nil?
            @login_user = User.find_by(id: cookies[:user_id])
        end
    end
end
