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
      end
    end
  end
end
