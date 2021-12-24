class AccountsController < ApplicationController
    before_action :set_account, only: [:show, :bookmark, :following, :follower]
    layout "account", only: [:show, :bookmark, :following, :follower]

    def show
    end

    def bookmark
    end

    def following
    end

    def follower
    end

    private

    def set_account
        @account = User.find_by(id: params[:id])
        if @account.blank?
            render file: 'public/404.html'
        end
    end
end