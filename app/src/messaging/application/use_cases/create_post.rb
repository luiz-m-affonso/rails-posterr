module Messaging
  module Application
    module UseCases
      class CreatePost
        def self.build
          new(
            all_posts: Infra::Repositories::AllPosts.build,
            post_factory: Infra::Factories::PostFactory.build,
            publisher: EventManager::Publisher.instance
          )
        end

        def initialize(all_posts:, post_factory:, publisher:)
          @all_posts = all_posts
          @post_factory = post_factory
          @publisher = publisher
        end

        def execute(post_data:, author:)
          publish_initialize_post_creation(author: author)
          post = @post_factory.build_from_hash(post_data: post_data)
          @all_posts.save!(post: post)
          publish_post_created_event(post: post, author: author)
          post
        rescue => e
          raise_post_create_exception(post: post, exception: e.message)
        end
      end
    end
  end
end