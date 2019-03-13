require "rails_helper"

RSpec.describe Guest::NewsLeasesController, type: :controller do
  before do
    @user = FactoryBot.create :user
    sign_in @user
    FactoryBot.create :image
    FactoryBot.create :category
    FactoryBot.create :place
    FactoryBot.create :news_lease
  end
  describe "Get new" do
    it "create object lease" do
      get :new
      expect(assigns(:lease)).to be_a_new(NewsLease)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      before{post :create, params:{news_lease: FactoryBot.attributes_for(:news_lease)}}
      it "create news lease" do
        expect(assigns(:lease)).to be_a(NewsLease)
      end

      it "render after create" do
        expect(response).to render_template(:show)
      end

      it "flash success message" do
        expect(flash[:success]).to match(I18n.t("complete"))
      end
    end

    context "with invalid atrributes" do
      before{post :create, params:{news_lease: FactoryBot.attributes_for(:news_lease)}}
      it "redirect after create" do
        expect(be_a(NewsLease)).to_not redirect_to(new_guest_news_lease_path)
      end

      it "flash error message" do
        expect(flash[:success]).to_not match(I18n.t("error"))
      end
    end
  end

  describe "UPDATE" do
    context "with valid attributes" do
      @lease = FactoryBot.create(:news_lease)
      let(:attr) do
        { :description => 'new', :key_search => 'new key' }
      end
      before(:each) do
        patch :update, :id => @lease.id, :news_lease => attr
        @article.reload
      end
      it "updated news lease" do
        response.should be_successful
      end
    end
  end
end
