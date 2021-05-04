class CustomersController < ApplicationController

  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    @customer = Customer.find(params[:id])
    render json: @customer
  end

  def create
    @customer = Customer.create(
      name: params[:name],
      id_number: params[:id_number],
      email: params[:email],
      phone: params[:phone],
      website: params[:website],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      postal_code: params[:postal_code]
    )
    render json: @customer
  end

  def search
    @customers = Customer.select(:name, :id, :email, :id_number, :phone, :website, :address, :city, :state, :postal_code).where('name LIKE ?', "%#{params['search_query']}%") unless params['search_query'].blank?
    render json: @customers
  end


  def update
    @customer = Customer.find(params[:id])
    @customer.update(
      name: params[:name],
      id_number: params[:id_number],
      vat: params[:vat],
      website: params[:website],
      phone: params[:phone],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      postal_code: params[:postal_code]
    )
    render json: @customer
  end

  def destroy
    @customers = Customer.all
    @customer = Customer.find(params[:id])
    @customer.destroy
    render json: @customers
  end

end
