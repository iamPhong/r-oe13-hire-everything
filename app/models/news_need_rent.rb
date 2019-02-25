class NewsNeedRent < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploader :picture, PhotoUploader
  validate :photo_size

  scope :select_newsrents, -> {select :id, :picture, :category_id, :product_name, :status}
  scope :load_myrents, -> myuser {where user_id: myuser}
  scope :order_desc, -> {order(created_at: :desc)}
  scope :select_homerents, -> {select :id, :product_name}
  scope :approved, -> (status){where status: status}

  private
  def photo_size
    return errors.add([:main_photo, :sub_photo], I18n.t("file_less_than")) unless picture.size < Settings.photo_size_max.megabytes
  end
end
