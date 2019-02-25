class Image < ApplicationRecord
  has_many :news_leases
  mount_uploader :main_photo, PhotoUploader
  mount_uploader :sub_photo, PhotoUploader
  validate  :photo_size

  private
  def photo_size
    if (main_photo.size > Settings.photo_size_max.megabytes)||(sub_photo.size > Settings.photo_size_max.megabytes)
      return errors.add([:main_photo, :sub_photo], I18n.t("file_less_than"))
    end
  end
end
