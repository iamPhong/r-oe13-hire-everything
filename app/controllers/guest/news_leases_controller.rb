class Guest::NewsLeasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lease, except: %i(myleases new create)
  before_action :correct_user, only: %i(edit destroy)

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

  def myleases
    @leases = NewsLease.select_newslease.load_myleases(current_user.id).order_desc.page(params[:page]).per(Settings.new_lease_page)
    render "myleases"
  end

  def destroy
    respond_to do |format|
      if @lease.destroy
        format.js {}
        format.html {flash[:success] = t("complete")}
      else
        format.js {}
        format.html {flash[:danger] = t("error")}
      end
    end
  end

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

  def correct_user
    @lease = current_user.news_leases.find_by id: params[:id]
    redirect_to root_url unless @lease
  end
end
