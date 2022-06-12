module Messaging
  module Application
    module UseCases
      class UpdatePost
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

        def execute(post_id:, title:, description:, author:)
          begin
            post = @all_posts.find_by_id(id: post_id)
            post.title = title
            post.description = description
            post.text = text
            post.type = type
            @all_posts.save!(post: post)
            publish_post_updated_event(post: post, author: author)
          rescue Excpetions::UpdatePostException => e
            raise_update_post_exception(post: post, message: e.message)
          end
        end
      end
    end
  end
end
