class MainController < ApplicationController
    def index
        flash.now[:notice] = "Logged in Successfully"
        flash.now[:alert] = "invalid"
        #or flash.alert
        #flashes persist for one more action before going away meaning after the seond click they will go away
        #to fix that flash.now can be used
    end
end