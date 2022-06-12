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
      end
    end
  end
end