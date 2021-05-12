require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  render_views

  let(:user) { create(:user, :with_name) }
  let(:category) { create(:category) }

  before :each do
    sign_in user
  end

  describe "#index" do
    it "responds successfully" do
      get :index

      expect(response).to be_successful
    end

    it "renders content" do
      product = create(:product)

      get :index

      expect(response.body).to have_content "Broccoli"
      expect(response.body).to have_content "It is a Broccoli"
      expect(response.body).to have_link "Show"
      expect(response.body).to have_link "Edit"
      expect(response.body).to have_link "Destroy"
    end

    context "when there are no products" do
      it "renders an empty message" do
        get :index

        expect(response.body).to have_content("There are no products. Please add some.")
      end
    end
  end

  describe "#new" do
    it "responds successfully" do
      get :new

      expect(response).to be_successful
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "#create" do
    it "responds successfully" do
      expect {
        post :create, params: { product: product_params }
      }.to change(Product, :count).by(1)

      expect(response).to be_redirect
      expect(response).to redirect_to [Product.last]
      expect(flash.notice).to be_present
    end

    context "when the record would be invalid" do
      it "re-renders the form" do
        expect {
          post :create, params: { product: invalid_product_params }
        }.not_to change(Product, :count)

        expect(response).to have_http_status(422)
        expect(response.body).to have_content("Category must exist")
        expect(flash.notice).to be_nil
      end
    end
  end

  describe "#edit" do
    it "responds successfully for non-native release" do
      product = create(:product, category: category)

      get :edit, params: { id: product.id, product: product_params }

      expect(response).to be_successful
    end
  end

  describe "#update" do
    let(:product) { create(:product, category: category) }

    it "responds successfully" do
      patch :update, params: { id: product.id, product: product_params }

      expect(response).to redirect_to [product]
      expect(flash.notice).to be_present
    end

    context "when the record would be invalid" do
      before do
        allow_any_instance_of(Product).to receive(:save).and_return(false)
      end

      it "re-renders the form" do
        patch :update, params: { id: product, product: product_params }

        expect(response).to have_http_status(422)
        expect(flash.notice).to be_nil
      end
    end
  end

  describe "#destroy" do
    let!(:product) { create(:product, category: category) }

    it "responds with redirect" do
      delete :destroy, params: { id: product }

      expect(response).to be_redirect
      expect(response).to redirect_to [:products]
    end

    it "sets the flash" do
      delete :destroy, params: { id: product }

      expect(flash.notice).not_to be_nil
    end

    it "destroys the record" do
      expect {
        delete :destroy, params: { id: product }
      }.to change(Product, :count).by(-1)
    end
  end

  private

  def product_params
    attributes_for(:product).merge(category_id: category.id)
  end

  def invalid_product_params
    attributes_for(:product)
  end
end
