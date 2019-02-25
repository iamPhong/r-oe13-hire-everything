class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :news_leases
  has_many :news_need_rents
  has_many :notifications
  mount_uploader :avatar, AvatarUploader
  validate  :avatar_size

  private
  def avatar_size
    return errors.add(:avatar, I18n.t("file_less_than")) unless avatar.size < Settings.avatar_size_max.megabytes
  end
end
