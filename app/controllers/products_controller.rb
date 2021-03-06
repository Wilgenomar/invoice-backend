class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def search
    @products = Product.select(:name, :id, :description, :price).where('name LIKE ?', "%#{params['search_query']}%") unless params['search_query'].blank?
    render json: @products
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    render json: @product
  end

  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy
    render json: @products
  end


end
