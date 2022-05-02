# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  text        :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
require "rails_helper"

RSpec.describe PostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/posts").to route_to("posts#index")
    end

    it "routes to #show" do
      expect(get: "/posts/1").to route_to("posts#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/posts").to route_to("posts#create")
    end
  end
end
