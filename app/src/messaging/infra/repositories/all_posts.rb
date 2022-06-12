module Messaging
  module Infra
    module Repositories
      class AllPosts
        def self.build
          new(
            post_model: Post,
            post_factory: Messaging::Infra::Factories::PostFactory.build
          )
        end

        def initialize(post_model:, post_factory:)
          @post_model = post_model
          @post_factory = post_factory
        end

        def find_by_id(id:)
          post = @post_model.find_by(id: id)
          @post_factory.build_from_model(post: post)
        end

        def find_by_ids(ids:)
          posts = @post_model.where(id: ids)
          @post_factory.build_from_model_list(posts: posts)
        end

        def save!(post:)
          post_model = @post_model.find_or_initialize_by(id: post.id)
          post_model.title = post.title
          post_model.description = post.description
          post_model.text = post.text
          post_model.type = post.type
          post_model.user_id = post.user_id
          post_model.save!

          post.id = post_model.id
          post
        rescue Messaging::Exceptions::SavePostException => e
          raise_save_post_exception(post: post, exception: e)
        end

        def save_all!(posts:)
          posts.map { |post| save!(post: post) }
        end

        def delete_by_id(id:)
          post = @post_model.find_by(id: id)
          raise_post_not_found_exception if post.blank?
          post.destroy!
        end

        private

        def raise_save_post_exception(post:, exception:)
          raise Messaging::Exceptions::SavePostException.new(post, exception.message)
        end

        def raise_post_not_found_exception
          raise Messaging::Exceptions::PostNotFoundException
        end
      end
    end
  end
end
