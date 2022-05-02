module Api
  module V1
    class HomePageController < Api::V1::ApiController
      def index
        @user = User.find(params[:id])
        @posts = Post.all
      end
    end
  end
end
