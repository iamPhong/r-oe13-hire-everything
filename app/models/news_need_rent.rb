class NewsNeedRent < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploader :picture, PhotoUploader
  validate :photo_size

  private
  def photo_size
    return errors.add([:main_photo, :sub_photo], I18n.t("file_less_than")) unless picture.size < Settings.photo_size_max.megabytes
  end
end
