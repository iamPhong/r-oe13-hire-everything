class StaticPagesController < ApplicationController
  before_action :list_category, only: :home

  def home
    @leases_hot = NewsLease.select_views_hot.approved(true).order_desc_views.limit(Settings.home_leases_hot)
    @news_rents = NewsNeedRent.select_homerents.approved(true).order_desc.limit(Settings.home_rents)
  end
end
