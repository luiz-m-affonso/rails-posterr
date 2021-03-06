# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string           default("")
#  last_name              :string           default("")
#  username               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  tokens                 :json
#  followees_count        :integer          default(0)
#  followers_count        :integer          default(0)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  acts_as_follower
  acts_as_followable

  validates :uid, uniqueness: { scope: :provider }
  # validates :username, length: { maximum: 14 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }, presence: true

  has_many :posts, dependent: :destroy do
    def today
      where(created_at: Time.zone.now.beginning_of_day..Time.zone.now)
    end
  end

  before_validation :init_uid

  def full_name
    return username if first_name.blank?

    "#{first_name} #{last_name}"
  end

  def self.from_social_provider(provider, user_params)
    where(provider: provider, uid: user_params['id']).first_or_create! do |user|
      user.password = Devise.friendly_token[0, 20]
      user.assign_attributes user_params.except('id')
    end
  end

  def posts_from_user_at_day
    Post.where(user_id: user.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now)
  end

  private

  def init_uid
    self.uid = email if uid.blank? && provider == 'email'
  end
end
