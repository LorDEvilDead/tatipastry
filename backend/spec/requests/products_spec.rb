# frozen_string_literal: true

require 'rails_helper'

# RSpec.describe 'Products' do
#   describe 'GET /index' do
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end

RSpec.describe ProductsController, type: :controller do
  describe "GET /index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     get :show
  #     expect(response).to be_successful
  #   end
  # end

  describe "POST #create" do
    it "creates a new Product" do
      expect {
        post :create, params: { product: { name: 'Cake with cherry' } }
      }.to change(Product, :count).by(1)
    end

    # it "PUT Product #update" do 
    # it "updates the Product" do 
    #     expect {
    #         put :update, params { product: {id: 1}}
    #     }.to change(Product, :name)
  end
end
