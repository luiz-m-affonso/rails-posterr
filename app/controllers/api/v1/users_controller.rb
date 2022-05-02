module Api
  module V1
    class UsersController < Api::V1::ApiController
      # before_action :auth_user

      def show; end

      def update
        current_user.update!(user_params)
        render :show
      end

      def follow
        @user = User.find(params[:id])
        current_user.follow!(@user)
        redirect_back(fallback_location: user_path(@user))
      end

      def unfollow
        @user = User.find(params[:id])
        current_user.unfollow!(@user)
        redirect_back(fallback_location: user_path(@user))
      end

      private

      def auth_user
        authorize current_user
      end

      def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email)
      end
    end
  end
end
