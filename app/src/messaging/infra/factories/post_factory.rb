module Messaging
  module Infra
    module Factories
      class PostFactory
        def self.build
          new(post_model: Post)
        end

        def initialize(post_model:)
          @post_model = post_model
        end

        def build_from_model(post:)
          Messaging::Domain::Post.new(
            id: post.id,
            title: post.title,
            description: post.description,
            text: post.text,
            type: post.type,
            user_id: post.user_id
          )
        end
      end
    end
  end
end
