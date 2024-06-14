# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    render json: fetch_product_list, status: :ok
  end

  def show
    find_product
    @product ? (render json: @product, status: :ok) : (head :not_found)
  end

  def create
    create_product(product_params)
    @created_product ? (render json: @created_product, status: :created) : (head :bad_request)
  end

  def update
    update_product(product_params)
    @updated_product ? (render json: @updated_product, status: :updated) : (head :bad_request)
  end

  def destroy
    destroy_product ? (head :ok) : (head :unprocessable_entity)
  end

  private

  def product_params
    params.require(:product).permit(:price, :portion_weight_grams, :ingredients, :desription, :image, :name, :id)
  end

  def fetch_product_list
    Products::Fetch.new.call
  end

  def find_product
    @product = Products::Fetch.new.call(params[:id])
  end

  def create_product(product_params)
    @created_product = Products::Create.new.call(product_params)
  end

  def update_product(product_params)
    Products::Update.new.call(params[:id], product_params)
  end

  def destroy_product
    Products::Destroy.new.call(params[:id])
  end
end
