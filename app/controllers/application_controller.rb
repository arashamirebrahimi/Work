class ApplicationController < ActionController::Base
    
    before_action :set_current_user
    
    #means  run this function before anything else

    def set_current_user
        if session[:user_id]
                Current.user = User.find_by(id: session[:user_id])
                #this way(rather than just "find") is better because it wont crash the app if it cant find the user
        end  
    end 

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You Must Be signed in to do that" if Current.user.nil?
    end
end
