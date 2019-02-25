class Guest::NewsNeedRentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rent, except: %i(myrents new create)
  before_action :list_category, only: %i(edit new)
  before_action :correct_user, only: %i(edit update destroy)

  def new
    @rent = NewsNeedRent.new
  end

  def create
    @rent = NewsNeedRent.new rent_params
    if @rent.save!
      flash.now[:success] = t "complete"
      render :show
    else
      flash.now[:danger] = t "error"
      render :new
    end
  end

  def edit; end

  def update
    if @rent.update rent_params
      flash[:success] = t "complete"
      redirect_to guest_news_need_rent_path
    else
      flash[:danger] = t "error"
    end
  end

  def show; end

  def myrents
    @rents = NewsNeedRent.select_newsrents.load_myrents(current_user.id).order_desc.page(params[:page]).per(Settings.new_rent_page)
    render "myrents"
  end

  def destroy
    respond_to do |format|
      if @rent.destroy
        format.js {}
        format.html {flash[:success] = t("complete")}
      else
        format.js {}
        format.html {flash[:danger] = t("error")}
      end
    end
  end

  private

  def rent_params
    params.require(:news_need_rent).permit(:user_id, :category_id, :product_name, :description, :picture,
     :address, :phone_number)
  end

  def set_rent
    @rent = NewsNeedRent.find_by id: params[:id]
    return if @rent
    flash[:danger] = t "notfound"
    redirect_to new_guest_news_need_rent_path
  end

  def correct_user
    @rent = current_user.news_need_rents.find_by id: params[:id]
    redirect_to root_url unless @rent
  end
end
