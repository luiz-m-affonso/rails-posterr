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
  attr_reader :user_id, :title, :description, :text, :type

  belongs_to :user
  validates :text, presence: true, length: { maximum: 777 }
  # validate :user_post_limit, on: :create

  def initilize(id:, title:, description:, text:, type:, user_id:)
    @user_id = id
    @title = title
    @description = description
    @text = text
    @type = type
    @user_id = user_id
  end

  private

  # def user_post_limit
  #   return unless user.today.count >= 5

  #   errors.add(:base, 'You have reached your daily post limit')
  # end
end
