class Guest::NewsNeedRentsController < ApplicationController
  before_action :authenticate_user!
  before_action :list_category, only: :new

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

  private

  def rent_params
    params.require(:news_need_rent).permit(:user_id, :category_id, :product_name, :description, :picture,
     :address, :phone_number)
  end
end
