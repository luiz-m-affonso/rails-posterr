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
class Post < ApplicationRecord
  belongs_to :user
  validates :text, presence: true, length: { maximum: 777 }
  validates :user_post_limit, on: :create

  private

  def user_post_limit
    return unless user.posts.today.count >= 5

    errors.add(:base, 'You have reached your daily post limit')
  end
end
