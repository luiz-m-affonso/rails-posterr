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
      end
    end
  end
end
