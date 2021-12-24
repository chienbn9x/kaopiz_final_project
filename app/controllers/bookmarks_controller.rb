class BookmarksController < ApplicationController

    def create
        @bookmark = current_user.bookmarks.new(bookmark_params)
        if @bookmark.save
            redirect_back(fallback_location: root_path)
        end
    end

    private

    def bookmark_params
        params.permit(:post_id)
    end

end