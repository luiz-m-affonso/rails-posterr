module Messaging
  module Application
    module UseCases
      class DeletePost
        def self.build
          new(
            all_posts: Infra::Repositories::AllPosts.build,
            publisher: EventManager::Publisher.instance
          )
        end

        def initialize(all_posts:, publisher:)
          @all_posts = all_posts
          @publisher = publisher
        end

        def execute(post_id:, author:)
          post = @all_posts.find_by_id(id: post_id)
          @all_posts.destroy(id: post_id)
          publish_post_deleted_event(post: post, author: author)
        rescue Exceptions::PostDeleteException => e
          raise_post_delete_exception(post: post, exception: e)
        end

        private

        def raise_post_delete_exception(post:, exception:)
          raise Exceptions::PostDeleteException.new(post, exception.message)
        end

        def publish_post_deleted_event(post:, author:)
          event = Messaging::Events::PostDeleted.new(post: post, author: author)
          @publisher.publish(event)
        end
      end
    end
  end
end