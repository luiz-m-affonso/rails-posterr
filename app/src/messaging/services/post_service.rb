module Messaging
  module Services
    class PostService
      def self.build
        new(
          create_post_use_case: Messaging::UseCases::CreatePost.build,
          delete_post_use_case: Messaging::UseCases::DeletePost.build,
          update_post_use_case: Messaging::UseCases::UpdatePost.build
        )
      end

      def initialize(create_post_use_case:, delete_post_use_case:, update_post_use_case:)
        @create_post_use_case = create_post_use_case
        @delete_post_use_case = delete_post_use_case
        @update_post_use_case = update_post_use_case
      end

      def create_post(post_data:, author:)
        @create_post_use_case.execute(post_data: post_data, author: author)
      end

      def delete_post(id:, author:)
        @delete_post_use_case.execute(id: id, author: author)
      end

      def update_post(id:, author:)
        @update_post_use_case.execute(id: id, author: author)
      end
    end
  end
end