class Guest::NewsLeasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lease, except: %i(new create)

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

  def edit
    @category = Category.all
  end

  def update
    if @lease.update lease_params
      flash[:success] = t "complete"
      redirect_to guest_news_lease_path
    else
      flash[:danger] = t "error"
    end
  end

  def show; end

  private
  def lease_params
    params.require(:news_lease).permit(:category_id, :user_id, :price_type, :price_value, :deposit_price, :deposit_paper,
    :product_name, :description, :sell, :key_search, :lease_name, :lease_phone_number, place_attributes: [:lat, :lng, :address],
    image_attributes: [:main_photo, :sub_photo])
  end

  def set_lease
    @lease = NewsLease.find_by id: params[:id]
    return if @lease
    flash[:danger] = t "notfound"
    redirect_to new_guest_news_lease_path
  end
end
