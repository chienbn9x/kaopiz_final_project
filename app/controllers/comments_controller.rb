class CommentsController < ApplicationController

    def create
        @post = Post.find_by(id: params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to post_path(@post)
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end