class Guest::CategoryController < ApplicationController
  before_action :set_category, only: :show

  def show
    @show_category = @category.news_leases.approved(true).order_desc.page(params[:page]).per(Settings.page_lease_category)
  end

  private
  def set_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "notfound"
    redirect_to root_path
  end
end
