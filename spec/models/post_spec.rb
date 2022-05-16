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
require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:subject) { build(:post, user_id: 1) }
  let(:user) { create(:user, id: 1) }

  describe 'validations and associations' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(777) }
    it { should belong_to(:user) }
  end
end