class LikesController < ApplicationController

    def create
        @like = current_user.likes.new(like_params)
        if @like.save
            redirect_to @like.post
        end
    end

    def update
        @like = current_user.likes.find_by(id: params[:id])
        if @like.update(like_params)
            redirect_to @like.post
        end
    end

    def destroy
        @like = current_user.likes.find_by(id: params[:id])
        @post = @like.post
        @like.destroy
        redirect_to @post
    end

    private

    def like_params
        params.permit(:post_id, :status)
    end
end