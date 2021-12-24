class PostsController < ApplicationController
    impressionist actions: [:show]
    before_action :get_post, only: [:show]

    def index
        if params[:order].present?
            if params[:order] == 'comment'
                Post.find_each { |p| Post.reset_counters(p.id, :comments) }
                @posts = Post.order(comments_count: :desc, updated_at: :desc)
            elsif params[:order] == 'like'
                Post.find_each do |post|
                    result = 0
                    post.likes.find_each do |like|
                        result = result + like.status
                    end
                    post.update(likes_count: result)
                end
                @posts = Post.order(likes_count: :desc, updated_at: :desc)
            end
        elsif params[:Search].present?
            @posts = Post.where("title LIKE ?", "%#{params[:Search]}%")
            @posts1 = Post.where.not(id: @posts.ids).joins(:action_text_rich_text).where("action_text_rich_texts.body LIKE ?", "%#{params[:Search]}%")
            @posts += @posts1
        else
            @posts = Post.all.order("created_at DESC")
        end
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @arr_tag = params[:post][:tag].split(',')
        if @post.save
            @arr_tag.each do |tag|
                @tag = Tag.find_by(name: tag)
                if @tag.nil?
                    @post.tags.create(name: tag)
                else
                    @post.tag_ids = @tag.id
                    @tag.post_ids = @post.id
                end
            end
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def show
        @user = @post.user
        impressionist @post
    end

    private

    def post_params
        params.require(:post).permit(:title, :tag, :content)
    end

    def get_post
        @post = Post.find_by(id: params[:id])
        if @post.blank?
            render file: 'public/404.html'
        end
    end
end