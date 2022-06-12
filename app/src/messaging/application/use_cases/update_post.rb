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
      end
    end
  end
end
