module Messaging
  module Domain
    class Post
      attr_reader :id, :title, :description, :text, :type, :user_id

      def initialize(id: nil, title:, description:, text:, type:, user_id: nil)
        @id = id
        @title = title
        @description = description
        @text = text
        @type = type
        @user_id = user_id
      end
    end
  end
end
