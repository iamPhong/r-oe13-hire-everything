class Guest::NewsLeasesController < ApplicationController
  before_action :authenticate_user!

  def new
    @lease = NewsLease.new
    @lease.build_place
    @lease.build_image
    @category = Category.all
  end

  def create
    @lease = NewsLease.new lease_params
    if @lease.save!
      flash.now[:success] = t "complete"
      render :show
    else
      flash.now[:danger] = t "error"
      render :new
    end
  end

  def lease_params
    params.require(:news_lease).permit(:category_id, :user_id, :price_type, :price_value, :deposit_price, :deposit_paper,
    :product_name, :description, :sell, :key_search, :lease_name, :lease_phone_number, place_attributes: [:lat, :lng, :address],
    image_attributes: [:main_photo, :sub_photo])
  end
end
