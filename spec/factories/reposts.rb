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
FactoryBot.define do
  factory :repost do
    title { "MyString" }
    description { "MyString" }
    text { "MyString" }
    type { "" }
    references { "" }
  end
end
