# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #searchkick
  #scope :search_import, -> { includes(:profile) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_one_attached :avatar
  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: 'friend_id'
  has_many :likes, dependent: :destroy
  has_many :rooms

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :room_messages, dependent: :destroy

  def self.from_omniauth(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

end
