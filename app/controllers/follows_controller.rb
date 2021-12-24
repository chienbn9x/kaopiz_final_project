class FollowsController < ApplicationController
    
    def create
        @follow = current_user.follows.new(follow_params)
        if @follow.save
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @follow = current_user.follows.find_by(id: params[:id])
        @follow.destroy
        redirect_back(fallback_location: root_path)
    end

    private 

    def follow_params
        params.permit(:follow_id)
    end

end